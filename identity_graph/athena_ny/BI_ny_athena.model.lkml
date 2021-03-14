connection: "ny_athena"
label: "NY Athena"

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


explore: partner_cookie_stats {
# Hidden because it appears to be defunct

hidden: no
}


explore: maid_stats {
# Hidden because it appears to be defunct

  hidden: no
}


explore: lidid_stats {
# Hidden because it appears to be defunct

  hidden: no
}


explore: fpc_stats {
# Hidden because it appears to be defunct

  hidden: no
}


explore: scrapped {
# Hidden because it appears to be defunct

  hidden: no
}
