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
  }

  dimension: cluster_group {
    description: "Cluster name if daily job"
    type: string
    sql: COALESCE(REGEXP_EXTRACT(${cluster_name},'(.*)(?=-\d{8}$)',1),'Ad hoc') ;;
  }

  dimension: cluster_group_date {
    description: "Date of cluster group job"
    type: string
    sql: REGEXP_EXTRACT(${cluster_name},'(\d{8}$)',1) ;;
  }

  dimension: job_name {
    description: "DWH job name"
    type: string
    sql: ${TABLE}.lijobname ;;
  }

  dimension: job_status {
    description: "Final application status"
    label: "Application Status"
    type: string
    sql: ${TABLE}.finalstatus ;;
  }

  dimension: application_type {
    description: "Spark or MapReduce"
    type: string
    sql: ${TABLE}.applicationtype ;;
  }

  dimension: application_id {
    description: "ID of application"
    type: string
    sql: ${TABLE}.id ;;
    primary_key: yes
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
    description: "Name of application"
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: applications {
    description: "Count of job applications"
    type: count
  }

  measure: jobs {
    description: "Count of Jobs"
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
