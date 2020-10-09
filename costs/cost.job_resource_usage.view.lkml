view: job_resource_usage {
  sql_table_name: auto_logs.app_metrics ;;
  suggestions: no

  dimension_group: run {
    description: "Date of log file"
    type: time
    timeframes: [date,day_of_month,day_of_week,month,year]
    sql: DATE_PARSE(CONCAT(${TABLE}.year_p,${TABLE}.month_p,${TABLE}.day_p),'%Y%m%d') ;;
  }

  dimension: cluster_name {
    description: "Name of cluster"
    type: string
    sql: ${TABLE}.clustername ;;
    group_label: "Cluster"
    group_item_label: "Name"
  }

  dimension: cluster_group {
    description: "Simplified cluster name if daily job"
    type: string
    sql: COALESCE(REGEXP_EXTRACT(${cluster_name},'(.*)(?=-\d{8}$)',1),'Ad hoc') ;;
    group_label: "Cluster"
    group_item_label: "Group Name"
  }

  dimension: cluster_group_date {
    description: "Date of cluster group job"
    type: string
    sql: REGEXP_EXTRACT(${cluster_name},'(\d{8}$)',1) ;;
    group_label: "Cluster"
    group_item_label: "Group Date"
  }

  dimension: job_name {
    description: "LI Application Name"
    type: string
    sql: ${TABLE}.lijobname ;;
    label: "Application Group Name"
  }

  dimension: job_status {
    description: "Success, Failure, Killed"
    label: "Application Status"
    type: string
    sql: ${TABLE}.finalstatus ;;
    group_label: "Application"
    group_item_label: "Final Status"
  }

  dimension: application_type {
    description: "Spark or MapReduce"
    type: string
    sql: ${TABLE}.applicationtype ;;
    group_label: "Application"
    group_item_label: "Type"
  }

  dimension: application_id {
    description: "ID of application"
    type: string
    sql: ${TABLE}.id ;;
    primary_key: yes
    group_label: "Application"
    group_item_label: "ID"
  }

  dimension: lcid {
    description: "limr cluster id"
    type: string
    sql: ${TABLE}.lcid ;;
    hidden: yes
  }

  dimension: join_id {
    description: "reduce of app id for joining on mapreduce tasks"
    type: string
    sql: REGEXP_EXTRACT(${application_id},'^application_(\d*)_',1) ;;
    #sql: REGEXP_EXTRACT(${application_id},'^application_(\d*_\d*)_',1) ;;
    hidden: yes
  }

  dimension: spark_join_id {
    description: "reduce of app id for joiing on spark tasks"
    type: string
    sql: REGEXP_EXTRACT(${application_id}, '^application_(\d*_\d*)$',1) ;;
    hidden: yes
  }

  dimension: application_name {
    description: "Raw name of application"
    type: string
    sql: ${TABLE}.name ;;
    group_label: "Application"
    group_item_label: "Name"
  }

  measure: applications {
    description: "Count of application runs"
    label: "Runs"
    type: count
  }

  measure: jobs {
    description: "Count of Applications"
    label: "Applications"
    type: count_distinct
    sql: ${job_name} ;;
    drill_fields: [applications_by_job*]
  }

  measure: clusters {
    description: "Count of clusters"
    type: count_distinct
    sql: ${cluster_name} ;;
    drill_fields: [jobs_by_cluster_group*]
  }

  measure: mb_seconds {
    description: "# MB allocated to application * seconds run"
    label: "MB Seconds"
    type: sum
    sql: ${TABLE}.memoryseconds ;;
    drill_fields: [cluster_group,mb_seconds_cg]
  }

  measure: vcore_seconds {
    description: "# vcores allocated to application * seconds run"
    type: sum
    sql: ${TABLE}.vcoreseconds ;;
    drill_fields: [cluster_group,vcore_seconds_cg]
  }

  # Drill Measures #

  measure: successful_apps {
    description: "Applications with final status: SUCCEEDED"
    hidden: yes
    type: count
    filters: [job_status: "SUCCEEDED"]
    drill_fields: [app_drill*]
  }

  measure: unsuccessful_apps {
    description: "Applications with final status: FAILED or KILLED"
    hidden: yes
    type: count
    filters: [job_status: "-SUCCEEDED"]
    drill_fields: [app_drill*]
  }

  measure: mb_seconds_cg {
    description: "Duplicate of MB Seconds for cluster group drill field"
    label: "MB Seconds"
    hidden: yes
    type: number
    sql: ${mb_seconds} ;;
    drill_fields: [cluster_name,mb_seconds_cluster]
  }

  measure: vcore_seconds_cg {
    description: "Duplicate of Vcore Seconds for cluster group drill field"
    label: "Vcore Seconds"
    hidden: yes
    type: number
    sql: ${vcore_seconds} ;;
    drill_fields: [cluster_name,vcore_seconds_cluster]
  }

  measure: mb_seconds_cluster {
    description: "Duplicate of MB Seconds for cluster drill field"
    label: "MB Seconds"
    hidden: yes
    type: number
    sql: ${mb_seconds} ;;
    drill_fields: [job_name,mb_seconds_jobs]
  }

  measure: vcore_seconds_cluster {
    description: "Duplicate of Vcore Seconds for cluster drill field"
    label: "Vcore Seconds"
    hidden: yes
    type: number
    sql: ${vcore_seconds} ;;
    drill_fields: [job_name,vcore_seconds_jobs]
  }

  measure: mb_seconds_jobs {
    description: "Duplicate of MB Seconds for jobs drill field"
    label: "MB Seconds"
    hidden: yes
    type: number
    sql: ${mb_seconds} ;;
    drill_fields: [application_id,application_name,application_type,mb_seconds_app]
  }

  measure: vcore_seconds_jobs {
    description: "Duplicate of Vcore Seconds for jobs drill field"
    label: "Vcore Seconds"
    hidden: yes
    type: number
    sql: ${vcore_seconds} ;;
    drill_fields: [application_id,application_name,application_type,vcore_seconds_app]
  }

  measure: mb_seconds_app {
    description: "Duplicate of MB Seconds for apps drill field"
    label: "MB Seconds"
    hidden: yes
    type: number
    sql: ${mb_seconds} ;;
  }

  measure: vcore_seconds_app {
    description: "Duplicate of Vcore Seconds for apps drill field"
    label: "Vcore Seconds"
    hidden: yes
    type: number
    sql: ${vcore_seconds} ;;
  }

  # Drill field sets #

  set: applications_by_job {
    fields: [cluster_name,job_name,applications,successful_apps,unsuccessful_apps]
  }

  set: jobs_by_cluster_group {
    fields: [cluster_group,cluster_name,jobs]
  }

  set: app_drill {
    fields: [application_id,application_name, application_type,mb_seconds,vcore_seconds]
  }

}

view: cluster_costs {
  extends: [job_resource_usage]
  derived_table: {
    sql: SELECT *,
        SUM(memoryseconds) OVER (PARTITION BY lcid) ttl_mb_sec,
        memoryseconds/CAST(SUM(memoryseconds) OVER (PARTITION BY lcid) AS REAL) pct_ttl_lcid_mb,
        SUM(vcoreseconds) OVER (PARTITION BY lcid) ttl_vcore_sec,
        vcoreseconds/CAST(SUM(vcoreseconds) OVER (PARTITION BY lcid) AS REAL) pct_ttl_lcid_vcore
        FROM auto_logs.app_metrics ;;
  }

  dimension: pct_ttl_lcid_mb {
    type: number
    sql: ${TABLE}.pct_ttl_lcid_mb;;
    value_format_name: percent_4
    hidden: yes
  }

  dimension: pct_ttl_lcid_vcore {
    type: number
    sql: ${TABLE}.pct_ttl_lcid_vcore ;;
    value_format_name: percent_4
    hidden: yes
  }

  dimension_group: run {
    description: "Items can have multiple run dates if duration is greater than a day. Start date works as alternative."
  }

  dimension: job_name {
    hidden: yes
  }

  dimension: application_group_name {
    type: string
    sql: REGEXP_REPLACE(${job_name}, '-\d{8}$') ;;
    description: "Simplified application name if daily job."
    group_label: "Application"
    group_item_label: "Group Name"
  }

}
