connection: "liveintent_main_redshift"
label: "Identity Graph"

include: "*.view.lkml"         # include all views in this project

explore: d_esp_pairing_volume {
# Hidden because it had a singular purporse (for the d/esp dashboard)

  hidden: yes
}

explore: rtb_mapping_type_performance_cohorts {
# Hidden because it is updated infrequently and has questionable usage / data
  hidden: yes
}

explore: app_ids_with_multiple_domains {
  group_label: "LiveConnect Pipeline"
  label: "Number of Domains Per App ID"
  description: "Historic Counts of the # of Domains Per LC App ID"
}

explore: alert_app_id_new_secondary_domains {
  group_label: "LiveConnect Alerts"
  label: "App IDs with New Domains"
  description: "All LC App IDs that Provided a New Domain Yesterday"
}

explore: active_hash_volume {
# Hidden because it is updated infrequently and has questionable usage

  hidden: yes
  group_label: "Graph Quality"
  description: "Pair Distributions with Booleans for Hash Activity on Exchange"

}
