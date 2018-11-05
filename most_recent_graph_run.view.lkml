view: most_recent_graph_run {
  derived_table: {
    sql: with yarn_active as (
          select
          'scalding' type,
          cascading.jobclass name,
          30 as active,
          t.active_seconds,
          cluster_date
        from metrics.yarn
        CROSS JOIN UNNEST(SEQUENCE(job.start_time,job.finish_time, interval '30' second)) AS t (active_seconds)
        where type='scalding_job'
          and job.status='SUCCESS'
          and DATE_PARSE(cluster_date, '%Y%m%d') = (SELECT MAX(DATE_PARSE(cluster_date, '%Y%m%d')) FROM metrics.yarn)
        ),

      spark_active as (
         select
          'spark' type,
          app.name name,
          30 as active,
          t.active_seconds,
          cluster_date
        from metrics.spark
        CROSS JOIN UNNEST(SEQUENCE(app.submit_time,app.finish_time,INTERVAL '30' SECOND)) as t (active_seconds)
        where type='app' and app.status='success'
        and DATE_PARSE(cluster_date,'%Y%m%d') = (SELECT MAX(DATE_PARSE(cluster_date,'%Y%m%d')) FROM metrics.spark)
        )

      SELECT type, REGEXP_EXTRACT(name,'[^.]+$') job_name, active, DATE_TRUNC('second',active_seconds) run_timestamp, DATE_PARSE(cluster_date,'%Y%m%d') cluster_date
      FROM
      (SELECT *
      FROM spark_active
      UNION ALL
      SELECT *
      FROM yarn_active)
       ;;
  }

  suggestions: no

  measure: count {
    type: count
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: job_name {
    type: string
    sql: ${TABLE}.job_name ;;
  }

  dimension_group: run_timestamp {
    type: time
    sql: ${TABLE}.run_timestamp ;;
  }

  dimension_group: cluster_date {
    type: time
    sql: ${TABLE}.cluster_date ;;
  }

  measure: active {
    type: sum
    sql: ${TABLE}.active ;;
  }
}
