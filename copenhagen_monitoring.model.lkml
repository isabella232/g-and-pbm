connection: "bigquery_log_data"

include: "*.view.lkml"         # include all views in this project
#include: "*.dashboard.lookml"  # include all dashboards in this project

datagroup: new_sync_day {
  sql_trigger: SELECT MAX(PARSE_DATE('%Y%m%d',REGEXP_EXTRACT(_TABLE_SUFFIX,r"(\d{8})$"))) FROM `noid.sync_*` ;;
}

datagroup: new_imp_day {
  sql_trigger: SELECT MAX(PARSE_DATE('%Y%m%d',REGEXP_EXTRACT(_TABLE_SUFFIX,r"(\d{8})$"))) FROM `userver_logs_ssp.imp_*` WHERE REGEXP_CONTAINS(a._TABLE_SUFFIX, r"^[A-Za-z0-9]{5}_[\d]{8}") ;;
}

explore: liveramp_pairs_submitted_overall {
  label: "LiveRamp Pairing Submissions (Overall)"
}

explore: liveramp_pairs_submitted_publisher {
  label: "LiveRamp Pairing Submissions (Per Publisher)"
}
