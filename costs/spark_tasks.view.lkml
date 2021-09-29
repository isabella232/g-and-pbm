view: spark_tasks {
  sql_table_name: metrics.spark_tasks ;;
  drill_fields: [id]
  suggestions: no

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: app_attempt {
    type: string
    sql: ${TABLE}.app_attempt ;;
  }

  dimension: app_id {
    type: string
    sql: ${TABLE}.app_id ;;
    # ID for joining on job resource usage
    description: "Application ID"
  }

  dimension: bytes_read {
    type: number
    sql: ${TABLE}.bytes_read ;;
    hidden: yes
  }

  dimension: bytes_written {
    type: number
    sql: ${TABLE}.bytes_written ;;
    hidden: yes
  }

  dimension: cluster_date {
    type: string
    sql: ${TABLE}.cluster_date ;;
  }

  dimension: disk_bytes_spilled {
    type: number
    sql: ${TABLE}.disk_bytes_spilled ;;
    hidden: yes
  }

  dimension: executor_cpu_time {
    type: number
    sql: ${TABLE}.executor_cpu_time ;;
    hidden: yes
  }

  dimension: executor_cpu_time_ms {
    type: number
    sql: ${executor_cpu_time}/1000000 ;;
    description: "CPU usage converted to milliseconds"
    hidden: yes
  }

  dimension: executor_deserialize_cpu_time {
    type: number
    sql: ${TABLE}.executor_deserialize_cpu_time ;;
    hidden: yes
  }

  dimension: executor_deserialize_time {
    type: number
    sql: ${TABLE}.executor_deserialize_time ;;
    hidden: yes
  }

  dimension: executor_run_time {
    type: number
    sql: ${TABLE}.executor_run_time ;;
    hidden: yes
  }

  dimension_group: finish {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.finish_time ;;
  }

  dimension: jvm_gctime {
    type: number
    sql: ${TABLE}.jvm_gctime ;;
    hidden: yes
  }

  dimension: memory_bytes_spilled {
    type: number
    sql: ${TABLE}.memory_bytes_spilled ;;
    hidden: yes
  }

  dimension: peak_execution_memory {
    type: number
    sql: ${TABLE}.peak_execution_memory ;;
    hidden: yes
  }

  dimension: peak_execution_mb {
    type: number
    sql: COALESCE(${peak_execution_memory}/1024/1024,0) ;;
    description: "Memory usage converted to MB"
    hidden: yes
  }

  dimension: records_read {
    type: number
    sql: ${TABLE}.records_read ;;
    hidden: yes
  }

  dimension: records_written {
    type: number
    sql: ${TABLE}.records_written ;;
    hidden: yes
  }

  dimension: result_serialization_time {
    type: number
    sql: ${TABLE}.result_serialization_time ;;
    hidden: yes
  }

  dimension: result_size {
    type: number
    sql: ${TABLE}.result_size ;;
    hidden: yes
  }

  dimension: shuffle_bytes_written {
    type: number
    sql: ${TABLE}.shuffle_bytes_written ;;
    hidden: yes
  }

  dimension: shuffle_fetch_wait_time {
    type: number
    sql: ${TABLE}.shuffle_fetch_wait_time ;;
    hidden: yes
  }

  dimension: shuffle_local_blocks_fetched {
    type: number
    sql: ${TABLE}.shuffle_local_blocks_fetched ;;
    hidden: yes
  }

  dimension: shuffle_local_bytes_read {
    type: number
    sql: ${TABLE}.shuffle_local_bytes_read ;;
    hidden: yes
  }

  dimension: shuffle_records_read {
    type: number
    sql: ${TABLE}.shuffle_records_read ;;
    hidden: yes
  }

  dimension: shuffle_records_written {
    type: number
    sql: ${TABLE}.shuffle_records_written ;;
    hidden: yes
  }

  dimension: shuffle_remote_blocks_fetched {
    type: number
    sql: ${TABLE}.shuffle_remote_blocks_fetched ;;
    hidden: yes
  }

  dimension: shuffle_remote_bytes_read {
    type: number
    sql: ${TABLE}.shuffle_remote_bytes_read ;;
    hidden: yes
  }

  dimension: shuffle_write_time {
    type: number
    sql: ${TABLE}.shuffle_write_time ;;
    hidden: yes
  }

  dimension: stage_attempt_id {
    type: number
    sql: ${TABLE}.stage_attempt_id ;;
  }

  dimension: stage_id {
    type: number
    sql: ${TABLE}.stage_id ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension_group: submit {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.submit_time ;;
  }

  dimension: task_attempt_num {
    type: number
    sql: ${TABLE}.task_attempt_num ;;
  }

  dimension: task_id {
    type: number
    sql: ${TABLE}.task_id ;;
    hidden: yes
  }

  dimension: task_type {
    type: string
    sql: ${TABLE}.task_type ;;
  }

  measure: tasks {
    type: count
    drill_fields: [id]
    description: "count of spark tasks"
    label: "Tasks (Spark)"
  }

  measure: peak_executor_memory {
    type: max
    sql: ${peak_execution_mb} ;;
    description: "Max (in MB)"
    group_label: "Executor Memory Usage (MB)"
    group_item_label: "Peak"
  }

  measure: average_executor_memory {
    type: average
    sql: ${peak_execution_mb} ;;
    description: "Average (in MB)"
    value_format_name: decimal_0
    group_label: "Executor Memory Usage (MB)"
    group_item_label: "Average"
  }

  measure: total_executor_memory {
    type: sum
    sql: ${peak_execution_mb} ;;
    description: "Sum total (in MB)"
    group_label: "Executor Memory Usage (MB)"
    group_item_label: "Total"
  }

  measure: peak_executor_cpu_time {
    type: max
    sql: ${executor_cpu_time_ms} ;;
    description: "Max time (in ms)"
    group_label: "Executor CPU Time (ms)"
    group_item_label: "Peak"
  }

  measure: average_executor_cpu_time {
    type: average
    sql: ${executor_cpu_time_ms} ;;
    description: "Average time (in ms)"
    value_format_name: decimal_0
    group_label: "Executor CPU Time (ms)"
    group_item_label: "Average"
  }

  measure: total_executor_cpu_time {
    type: sum
    sql: ${executor_cpu_time_ms} ;;
    description: "Sum time (in ms)"
    group_label: "Executor CPU Time (ms)"
    group_item_label: "Total"
  }
}

view: spark_tasks_jr_usage {
  extends: [spark_tasks]
  dimension: id {
    hidden: yes
  }
}
