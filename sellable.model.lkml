connection: "bigquery_log_data"

include: "*.view.lkml"                       # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

label: "Commercial Identity"

datagroup: new_features_mapping_pair {
  sql_trigger: SELECT MAX(_TABLE_SUFFIX) FROM `auto_dmps.all_features_mapping_pair__*` ;;
}

datagroup: new_sellable_pair {
  sql_trigger: SELECT MAX(_TABLE_SUFFIX) FROM `auto_sellable.sellable_pair_with_attributes__*` ;;
}

explore: total_liids_and_pairs_by_sellable_geo {
  label: "[LOG] Total LIIDs and Pairs (Geo)"
  description: "Do NOT use unless absolutely necessary"
}

explore: sellable_pairs_by_cookie_domain {
  label: "[LOG] Sellable Pairs (Domain)"
  description: "Do NOT use unless absolutely necessary"

}

explore: cross_domain_maid_availability {
  label: "[LOG] Cross Domain MAID Availability"
  description: "Do NOT use unless absolutely necessary"

}

explore: sellable_cookie_domain_cluster_size {
  label: "[LOG] Cookie Domain Cluster Size"
  description: "Do NOT use unless absolutely necessary"

}
