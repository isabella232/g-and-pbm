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



hidden: no
}


explore: maid_stats {

  hidden: no
}


explore: lidid_stats {

  hidden: no
}


explore: fpc_stats {

  hidden: no
}


explore: scrapped {

  hidden: no
}


explore: lidomulid {

  hidden: no
}

#cookie_stats_total
explore: cookie_stats_total {

  hidden: no
}

#parter_cookie_stats_domain
explore: parter_cookie_stats_domain {

  hidden: no
}
