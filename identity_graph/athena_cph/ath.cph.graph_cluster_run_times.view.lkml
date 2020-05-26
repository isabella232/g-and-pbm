view: graph_cluster_run_times {

  derived_table: {
    sql: with
        yarn_runtimes as (
          select
            'scalding' type,
            cascading.jobclass name,
            date_diff('second', job.start_time, job.finish_time) seconds,
            job.start_time start,
            cluster_date
          from metrics.yarn
          where type='scalding_job'
          and job.status='SUCCESS'
        ),

        spark_runtimes as (
          select
            'spark' type,
            app.name name,
            date_diff('second', app.submit_time,app.finish_time) runtime,
            app.submit_time start,
            cluster_date
          from metrics.spark
          where type='app' and app.status='success'
        )

      select *
      from spark_runtimes
      union all
      select *
      from yarn_runtimes
      order by cluster_date, name ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: full_name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: name {
    type: string
    sql: REGEXP_EXTRACT(${full_name},'[^.]+$') ;;
  }

  dimension: start_time {
    type: date_time
    sql: ${TABLE}.start ;;
  }

  dimension: cluster_date {
    type: date
    sql: DATE_PARSE(${TABLE}.cluster_date,'%Y%m%d') ;;
  }

  measure: run_time {
    type: sum
    sql: ${TABLE}.runtime ;;
    value_format_name: decimal_0
    description: "Run time of job (in seconds)"
  }

  measure: average_run_time {
    type: average
    sql: ${TABLE}.runtime ;;
    value_format_name: decimal_0
    description: "Average run time of job (in seconds)"
  }

  measure: last_successful_completion {
    type: date
    sql: MAX(DATE_PARSE(${TABLE}.cluster_date,'%Y%m%d')) ;;
  }

  measure: days_since_last_update {
    type: number
    sql: DATE_DIFF('day',MAX(DATE_PARSE(${TABLE}.cluster_date,'%Y%m%d')),CURRENT_DATE - INTERVAL '1' DAY) ;;
  }
}
