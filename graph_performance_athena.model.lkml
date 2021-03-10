connection: "ny_athena"
label: "Identity Graph"

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

explore: watermarking {
group_label: "Graph Quality"
description: "Performance Results of Mapping Selectors Groups"
}

explore: pv_owned_v_prospect {
# Hidden because it appears to be defunct

  hidden: yes
}



explore: mapping_type_cost_coefficient {
  hidden: yes
}

explore: partner_cookie_stats {
  hidden: no
}
