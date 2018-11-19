view: graph_cost_by_job {
  derived_table: {
    sql:  with spark_job as (
            SELECT cluster_date, REGEXP_EXTRACT(id, '[A-z]+_(\d+_\d+_\d+)',1) id,
            SUM(COALESCE(counter.bytes_read/1000000,0)) mb_read,
            SUM(COALESCE(counter.bytes_written/1000000,0)) mb_written,
            SUM(COALESCE(counter.executor_run_time/1000,0)) exec_run_time_sec,
            SUM(COALESCE((counter.executor_cpu_time+counter.executor_deserialize_time)/1000000000,0)) exec_cpu_time_sec
            FROM metrics.spark
            WHERE type <> 'app'
            GROUP BY 1,2
          ),

              spark_app as (
            SELECT cluster_date, REGEXP_EXTRACT(id, '[A-z]+_(\d+_\d+_\d+)',1) id, app.name name
            FROM metrics.spark
            WHERE type = 'app'
            GROUP BY 1,2,3
          ),

              spark_total as (
            SELECT DATE_PARSE(spark_job.cluster_date,'%Y%m%d') event_date, 'spark' as job_type, REGEXP_EXTRACT(spark_app.name, '[^.]+$') job_name,
            SUM(spark_job.exec_cpu_time_sec) run_time_sec,
            SUM(spark_job.mb_read+spark_job.mb_written) data_mb
            FROM spark_job
            LEFT JOIN spark_app
            ON spark_job.id = spark_app.id
            AND spark_job.cluster_date = spark_app.cluster_date
            GROUP BY 1,2,3
          ),

              mapreduce_total as (
            SELECT DATE_PARSE(cluster_date,'%Y%m%d') event_date, 'map_reduce' as job_type, REGEXP_EXTRACT(cascading.jobclass, '[^.]+$') job_name,
            SUM(COALESCE(job_cnt.vcores_millis_maps,0)+COALESCE(job_cnt.vcores_millis_reduces,0)) run_time_sec,
            SUM(COALESCE(job_cnt.mb_millis_maps,0)+COALESCE(job_cnt.mb_millis_reduces,0)) data_mb
            FROM metrics.yarn
            WHERE job_cnt.vcores_millis_maps IS NOT NULL
            GROUP BY 1,2,3
          ),

              cluster_cost as (
            SELECT CAST(REGEXP_EXTRACT(clustername, '\d{4}-\d{2}-\d{2}$') AS DATE) event_date,
            SUM(elasticcomputecloudcompute + elasticmapreduce + ec2other) cost
            FROM "metrics"."emr"
            GROUP BY 1
          )

        SELECT jobs.event_date, jobs.job_name, jobs.job_type, assignments.related_store, cluster_cost.cost,
        jobs.data_mb * assignments.weight data_mb,
        jobs.run_time_sec * assignments.weight run_time_sec,
        SUM(jobs.run_time_sec) OVER (PARTITION BY jobs.event_date) total_run_time_sec,
        SUM(jobs.data_mb) OVER (PARTITION BY jobs.event_date) total_data_mb,
        cluster_cost.cost * assignments.weight * (jobs.run_time_sec/CAST(SUM(jobs.run_time_sec) OVER (PARTITION BY jobs.event_date) AS REAL)) cost_run_time,
        cluster_cost.cost * assignments.weight * (jobs.data_mb/CAST(SUM(jobs.data_mb) OVER (PARTITION BY jobs.event_date) AS REAL)) cost_data_mb
        FROM (
          SELECT * FROM spark_total
          UNION ALL
          SELECT * FROM mapreduce_total
        ) jobs
        LEFT JOIN cluster_cost
        ON jobs.event_date = cluster_cost.event_date
        LEFT JOIN metrics.assignments assignments
        ON jobs.job_name = assignments.job_name;;
  }

  dimension_group: cluster {
    datatype: date
    type: time
    timeframes: [date,month,week,quarter]
    sql: ${TABLE}.event_date ;;
  }

  dimension: job_name {
    type: string
    sql: ${TABLE}.job_name ;;
  }

  dimension: job_type {
    type: string
    sql: ${TABLE}.job_type ;;
  }

  dimension: voldemort_store {
    type: string
    sql: ${TABLE}.related_store ;;
  }

  measure: run_time {
    type: sum
    sql: ${TABLE}.run_time_sec ;;
    description: "In seconds"
  }

  measure: data_processed {
    type: sum
    sql: ${TABLE}.data_mb ;;
    description: "In MB"
  }

  measure: job_cost_run_time {
    type: sum
    sql: ${TABLE}.cost_run_time ;;
    label: "Cost (Sum)"
    value_format_name: usd
  }

  measure: job_cost_run_time_avg {
    type: number
    sql: ${job_cost_run_time}/CAST(COUNT(DISTINCT ${TABLE}.event_date) AS REAL) ;;
    label: "Cost (Daily Average)"
    value_format_name: usd_0
  }

  measure: job_cost_data_processed {
    type: sum
    sql: ${TABLE}.cost_data_mb ;;
    value_format_name: usd
    hidden: yes
  }

}
