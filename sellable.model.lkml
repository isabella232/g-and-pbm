connection: "bigquery_log_data"

include: "*.view.lkml"                       # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

datagroup: new_features_mapping_pair {
  sql_trigger: SELECT MAX(_TABLE_SUFFIX) FROM `auto_dmps.all_features_mapping_pair__*` ;;
}

datagroup: new_sellable_pair {
  sql_trigger: SELECT MAX(_TABLE_SUFFIX) FROM `auto_sellable.sellable_pair__*` ;;
}

explore: total_liids_and_pairs_by_sellable_geo {

}

explore: sellable_pairs_by_cookie_domain {

}

explore: cross_domain_maid_availability {

}

explore: sellable_cookie_domain_cluster_size {

}
