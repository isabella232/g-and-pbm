connection: "athena_copenhagen"

include: "*.view.lkml"
label: "Identity Graph"

explore: graph_cluster_run_times {
  group_label: "Graph Pipeline"
  label: "Graph Job Run Time Performance"
  description: "Historic Spark and Map-Reduce Performance Information"
}

explore: most_recent_graph_run {
  hidden: yes
  group_label: "Graph Pipeline"
  description: "Most Recent Spark and Map-Reduce Performance Information"
}

explore: graph_cost_by_job {
  group_label: "Graph Pipeline"
  label: "Graph Job Financial Cost"
  description: "Historic Spark and Map-Reduce Cost Information"
}

explore: accuracy_pair_stats {
  group_label: "Graph Quality"
  view_label: "Mapping Type Accuracy Stats"
  label: "Mapping Type Accuracy Statistics"
  description: "Data Generated From Data Science's Monthly Accuracy Tests"

join: accuracy_cookie_stats_modified {
  relationship: one_to_one
  sql_on: ${accuracy_pair_stats.event_date_date} = ${accuracy_cookie_stats_modified.event_date_date}
          AND ${accuracy_pair_stats.mapping_type} = ${accuracy_cookie_stats_modified.mapping_type};;
  type: full_outer
  view_label: "Mapping Type Stats"
}
}

explore: graph_daily_hash_activity_distribution {
  group_label: "Graph Quality"
  label: "Hash Activity Distribution"
  description: "Distribution of the # of Days a Hash Appeared in the Prior 30 Days"
}

explore: graph_daily_cookie_activity_distribution {
  group_label: "Graph Quality"
  label: "Cookie Activity Distribution"
  description: "Distribution of the # of Days a Cookie Appeared in the Prior 30 Days"

}

explore: accuracy_pair_overlap {
  group_label: "Graph Quality"
  label: "Mapping Type Overlaps: Pairs"
  description: "Number of Shared Pairs Between Mapping Types"
}

explore: people_verified_counts {
  group_label: "Graph Performance"
  label: "People Verified Counts by App ID"
  description: "Counts of Identifiers By People-Verified, Customer-Verified, and if Found in a Cookie-Challenged Inventory"
}

explore: accuracy_cookie_overlap {
  group_label: "Graph Quality"
  label: "Mapping Type Overlaps: Cookies"
  description: "Number of Shared Cookies Between Mapping Types"
}

explore: data_selling_sellable_pairs_by_cookie_domain {
  group_label: "Data Selling"
  label: "Sellable Pairs by Cookie Domain"
  description: "Historical Counts of Sellable Pairs by Cookie Domain"

  join: pub_or_app_id_names {
    relationship: many_to_one
    sql_on: ${data_selling_sellable_pairs_by_cookie_domain.cookie_domain} = ${pub_or_app_id_names.pub_or_app_id} ;;
    type: left_outer
    fields: [pub_or_app_id_names.name]
    view_label: "Data Selling Sellable Pairs By Cookie Domain"
  }
}

explore: first_party_cookie_syncs {
  group_label: "Data Selling"
  description: "First Party Cookie Syncs with IDaaS (Last Two Weeks)"

  join: pub_or_app_id_names {
    relationship: many_to_one
    sql_on: ${first_party_cookie_syncs.identifier_type} = ${pub_or_app_id_names.pub_or_app_id} ;;
    type: left_outer
    fields: [pub_or_app_id_names.name]
    view_label: "First Party Cookie Syncs"
  }
}
