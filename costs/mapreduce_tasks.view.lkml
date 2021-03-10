view: mapreduce_tasks {
  sql_table_name: metrics.yarn_tasks ;;
  drill_fields: [id]
  suggestions: no

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
    description: "Unique task ID"
  }

  dimension: join_id {
    type: string
    sql: REGEXP_EXTRACT(${id},'^task_(\d*)_',1) ;;
    #sql: REGEXP_EXTRACT(${id},'^task_(\d*_\d*)_',1) ;;
    description: "Key for joining with job resource usage"
    hidden: yes
  }

  dimension: cluster_date {
    type: string
    sql: ${TABLE}.cluster_date ;;
  }

  dimension: cluster_id {
    type: string
    sql: ${TABLE}.cluster_id ;;
  }

  dimension: combine_input_records {
    type: number
    sql: ${TABLE}.combine_input_records ;;
    hidden: yes
  }

  dimension: combine_output_records {
    type: number
    sql: ${TABLE}.combine_output_records ;;
    hidden: yes
  }

  dimension: committed_heap_bytes {
    type: number
    sql: ${TABLE}.committed_heap_bytes ;;
    hidden: yes
  }

  dimension: cpu_milliseconds {
    type: number
    sql: ${TABLE}.cpu_milliseconds ;;
    hidden: yes
  }

  dimension: dwhsource_cnt {
    type: string
    sql: ${TABLE}.dwhsource_cnt ;;
    hidden: yes
  }

  dimension: failed_shuffle {
    type: number
    sql: ${TABLE}.failed_shuffle ;;
    hidden: yes
  }

  dimension: file_bytes_read {
    type: number
    sql: ${TABLE}.file_bytes_read ;;
    hidden: yes
  }

  dimension: file_bytes_written {
    type: number
    sql: ${TABLE}.file_bytes_written ;;
    hidden: yes
  }

  dimension: file_large_read_ops {
    type: number
    sql: ${TABLE}.file_large_read_ops ;;
    hidden: yes
  }

  dimension: file_read_ops {
    type: number
    sql: ${TABLE}.file_read_ops ;;
    hidden: yes
  }

  dimension: file_write_ops {
    type: number
    sql: ${TABLE}.file_write_ops ;;
    hidden: yes
  }

  dimension: flowid {
    type: string
    sql: ${TABLE}.flowid ;;
    hidden: yes
  }

  dimension: gc_time_millis {
    type: number
    sql: ${TABLE}.gc_time_millis ;;
    hidden: yes
  }

  dimension: hdfs_bytes_read {
    type: number
    sql: ${TABLE}.hdfs_bytes_read ;;
    hidden: yes
  }

  dimension: hdfs_bytes_written {
    type: number
    sql: ${TABLE}.hdfs_bytes_written ;;
    hidden: yes
  }

  dimension: hdfs_large_read_ops {
    type: number
    sql: ${TABLE}.hdfs_large_read_ops ;;
    hidden: yes
  }

  dimension: hdfs_read_ops {
    type: number
    sql: ${TABLE}.hdfs_read_ops ;;
    hidden: yes
  }

  dimension: hdfs_write_ops {
    type: number
    sql: ${TABLE}.hdfs_write_ops ;;
    hidden: yes
  }

  dimension: jobclass {
    type: string
    sql: ${TABLE}.jobclass ;;
    hidden: yes
  }

  dimension: map_input_records {
    type: number
    sql: ${TABLE}.map_input_records ;;
    hidden: yes
  }

  dimension: map_output_bytes {
    type: number
    sql: ${TABLE}.map_output_bytes ;;
    hidden: yes
  }

  dimension: map_output_materialized_bytes {
    type: number
    sql: ${TABLE}.map_output_materialized_bytes ;;
    hidden: yes
  }

  dimension: map_output_records {
    type: number
    sql: ${TABLE}.map_output_records ;;
    hidden: yes
  }

  dimension: map_skipped_records {
    type: number
    sql: ${TABLE}.map_skipped_records ;;
    hidden: yes
  }

  dimension: merged_map_outputs {
    type: number
    sql: ${TABLE}.merged_map_outputs ;;
    hidden: yes
  }

  dimension: physical_memory_bytes {
    type: number
    sql: ${TABLE}.physical_memory_bytes ;;
    hidden: yes
  }

  dimension: process_begin_time {
    type: number
    sql: ${TABLE}.process_begin_time ;;
    hidden: yes
  }

  dimension: process_end_time {
    type: number
    sql: ${TABLE}.process_end_time ;;
    hidden: yes
  }

  dimension: read_duration {
    type: number
    sql: ${TABLE}.read_duration ;;
    hidden: yes
  }

  dimension: reduce_input_groups {
    type: number
    sql: ${TABLE}.reduce_input_groups ;;
    hidden: yes
  }

  dimension: reduce_input_records {
    type: number
    sql: ${TABLE}.reduce_input_records ;;
    hidden: yes
  }

  dimension: reduce_output_records {
    type: number
    sql: ${TABLE}.reduce_output_records ;;
    hidden: yes
  }

  dimension: reduce_shuffle_bytes {
    type: number
    sql: ${TABLE}.reduce_shuffle_bytes ;;
    hidden: yes
  }

  dimension: reduce_skipped_groups {
    type: number
    sql: ${TABLE}.reduce_skipped_groups ;;
    hidden: yes
  }

  dimension: reduce_skipped_records {
    type: number
    sql: ${TABLE}.reduce_skipped_records ;;
    hidden: yes
  }

  dimension: s3_bytes_read {
    type: number
    sql: ${TABLE}.s3_bytes_read ;;
    hidden: yes
  }

  dimension: s3_bytes_written {
    type: number
    sql: ${TABLE}.s3_bytes_written ;;
    hidden: yes
  }

  dimension: s3_large_read_ops {
    type: number
    sql: ${TABLE}.s3_large_read_ops ;;
    hidden: yes
  }

  dimension: s3_read_ops {
    type: number
    sql: ${TABLE}.s3_read_ops ;;
    hidden: yes
  }

  dimension: s3_write_ops {
    type: number
    sql: ${TABLE}.s3_write_ops ;;
    hidden: yes
  }

  dimension: shuffled_maps {
    type: number
    sql: ${TABLE}.shuffled_maps ;;
    hidden: yes
  }

  dimension: spilled_records {
    type: number
    sql: ${TABLE}.spilled_records ;;
    hidden: yes
  }

  dimension: split_raw_bytes {
    type: number
    sql: ${TABLE}.split_raw_bytes ;;
    hidden: yes
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
    hidden: yes
  }

  dimension: step {
    type: string
    sql: ${TABLE}.step ;;
    hidden: yes
  }

  dimension: step_tuples_read {
    type: number
    sql: ${TABLE}.step_tuples_read ;;
    hidden: yes
  }

  dimension_group: task_finish {
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
    sql: ${TABLE}.task_finish_time ;;
  }

  dimension_group: task_start {
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
    sql: ${TABLE}.task_start_time ;;
  }

  dimension: tuples_read {
    type: number
    sql: ${TABLE}.tuples_read ;;
    hidden: yes
  }

  dimension: tuples_written {
    type: number
    sql: ${TABLE}.tuples_written ;;
    hidden: yes
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: virtual_memory_bytes {
    type: number
    sql: ${TABLE}.virtual_memory_bytes ;;
    hidden: yes
  }

  dimension: write_duration {
    type: number
    sql: ${TABLE}.write_duration ;;
    hidden: yes
  }

  measure: tasks {
    type: count
    description: "Count of tasks"
    label: "Tasks (MapReduce)"
    drill_fields: [id]
  }

  dimension: job_name {
    type: string
    sql: element_at(split(${TABLE}.jobclass, '.'),-1) ;;
    description: "Name of mapreduce job"
  }

  dimension: is_map {
    type: yesno
    sql: ${type} = 'MAP' ;;
    description: "For MAP steps (for filtering)"
    hidden: yes
  }

  dimension: is_reduce {
    type: yesno
    sql: ${type} = 'REDUCE';;
    description: "For REDUCE steps (for filtering)"
    hidden: yes
  }

  dimension: physical_memory_usage {
    type: number
    sql: ${physical_memory_bytes}/1024/1024 ;;
    description: "Converted to MB"
    hidden: yes
  }

  measure: peak_map_memory_usage {
    type: max
    sql: ${physical_memory_usage} ;;
    filters: [is_map: "yes"]
    description: "Peak Map memory usage (in MB)"
    group_label: "Memory Usage"
    group_item_label: "Peak: Map"
  }

  measure: peak_reduce_memory_usage {
    type: max
    sql: ${physical_memory_usage} ;;
    filters: [is_reduce: "yes"]
    description: "Peak Reduce memory usage (in MB)"
    group_label: "Memory Usage"
    group_item_label: "Peak: Reduce"
  }

  measure: average_map_memory_usage {
    type: average
    sql: ${physical_memory_usage} ;;
    filters: [is_map: "yes"]
    description: "Average Map memory usage (in MB)"
    value_format_name: decimal_0
    group_label: "Memory Usage"
    group_item_label: "Average: Map"
  }

  measure: average_reduce_memory_usage {
    type: average
    sql: ${physical_memory_usage} ;;
    filters: [is_reduce: "yes"]
    description: "Average Reduce memory usage (in MB)"
    value_format_name: decimal_0
    group_label: "Memory Usage"
    group_item_label: "Average: Reduce"
  }

  measure: total_map_memory_usage {
    type: sum
    sql: ${physical_memory_usage} ;;
    filters: [is_map: "yes"]
    description: "Total Map memory usage (in MB)"
    group_label: "Memory Usage"
    group_item_label: "Total: Map"
  }

  measure: total_reduce_memory_usage {
    type: sum
    sql: ${physical_memory_usage} ;;
    filters: [is_reduce: "yes"]
    description: "Total Reduce memory usage (in MB)"
    group_label: "Memory Usage"
    group_item_label: "Total: Reduce"
  }

  measure: total_all_memory_usage {
    type: sum
    sql: ${physical_memory_usage} ;;
    description: "Total memory usage (in MB)"
    group_label: "Memory Usage"
    group_item_label: "Total: All"
  }

  measure: total_map_cpu_usage {
    type: sum
    sql: ${cpu_milliseconds} ;;
    filters: [is_map: "yes"]
    description: "Map CPU usage (in ms)"
    group_label: "CPU Usage"
    group_item_label: "Total: Map"
  }

  measure: total_reduce_cpu_usage {
    type: sum
    sql: ${cpu_milliseconds} ;;
    filters: [is_reduce: "yes"]
    description: "Reduce CPU usage (in ms)"
    group_label: "CPU Usage"
    group_item_label: "Total: Reduce"
  }

  measure: total_all_cpu_usage {
    type: sum
    sql: ${cpu_milliseconds} ;;
    description: "Total CPU usage (in ms)"
    group_label: "CPU Usage"
    group_item_label: "Total: All"
  }

}

view: mapreduce_jr_usage {
  extends: [mapreduce_tasks]

  dimension: id {
    hidden: yes
  }
}
