connection: "bigquery_log_data"

include: "*.view.lkml"                # include all views in the views/ folder in this project

datagroup: bigquery_idx_update  {
  sql_trigger: SELECT MAX(_TABLE_SUFFIX)
  FROM `elite-contact-671.auto_logs.idaas_idx_track_log__*`  ;;
}
explore: index_tracking {
}

explore: index_tracking_new_domains_7d {
  label: "New Domains - Weekly Basis"
}

explore: index_tracking_missing_domains_7d {
  label: "Missing Domains - Weekly Basis"
}
