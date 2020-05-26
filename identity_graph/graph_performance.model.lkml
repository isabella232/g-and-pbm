connection: "bigquery_log_data"
label: "Identity Graph"

include: "bigquery/*.view.lkml"

datagroup: new_imp_day_data {
  sql_trigger: SELECT MAX(PARSE_DATE('%Y%m%d',REGEXP_EXTRACT(_TABLE_SUFFIX,r"(\d{8})$"))) FROM `userver_logs_ssp.imp_*` WHERE REGEXP_CONTAINS(_TABLE_SUFFIX, r"^[A-z0-9]{5}_[\d]{8}") ;;
}

explore: mapping_type_click_performance_rtb {
  label: "Mapping Type Click Performance (RTB)"
  group_label: "Graph Quality"
  description: "Standard Metrics Relating to RTB Auction Performance (No Conversion Information)"
}
