connection: "bigquery_log_data"

include: "*.view.lkml"

datagroup: new_conv_day_data {
  sql_trigger: SELECT MAX(PARSE_DATE('%Y%m%d',REGEXP_EXTRACT(_TABLE_SUFFIX,r"(\d{8})$"))) FROM `userver_logs_ssp.conv_*` WHERE REGEXP_CONTAINS(_TABLE_SUFFIX, r"^[A-z0-9]{5}_[\d]{8}") ;;
}

explore: intelligent_tracking_prevention {
  hidden: yes
}
