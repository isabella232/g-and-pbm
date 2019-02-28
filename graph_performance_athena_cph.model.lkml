connection: "athena_copenhagen"

include: "*.view.lkml"                       # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }

explore: graph_cluster_run_times {

}

explore: most_recent_graph_run {

}

explore: graph_cost_by_job {

}

explore: accuracy_pair_stats {
  view_label: "Mapping Type Stats"
  label: "Accuracy Stats"

join: accuracy_cookie_stats_modified {
  relationship: one_to_one
  sql_on: ${accuracy_pair_stats.event_date_date} = ${accuracy_cookie_stats_modified.event_date_date}
          AND ${accuracy_pair_stats.mapping_type} = ${accuracy_cookie_stats_modified.mapping_type};;
  type: full_outer
  view_label: "Mapping Type Stats"
}
}

explore: graph_daily_hash_activity_distribution {

}

explore: graph_daily_cookie_activity_distribution {

}

explore: accuracy_pair_overlap {

}

explore: people_verified_counts {

}
