connection: "athena_copenhagen"

include: "*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard
explore: partner_cookie_stats{
  label: "partner_cookie"
  description: "partner cookie stats"
}

# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
explore: lidid_info__20210906 {


  join: lidid_info__20210906__basic_info__urls__value {
    view_label: "Lidid Info 20210906: Basicinfo Urls Value"
    sql: LEFT JOIN UNNEST(${lidid_info__20210906.basic_info__urls__value}) as lidid_info__20210906__basic_info__urls__value ;;
    relationship: one_to_many
  }

  join: lidid_info__20210906__basic_info__us_privacy_map {
    view_label: "Lidid Info 20210906: Basicinfo Usprivacymap"
    sql: LEFT JOIN UNNEST(${lidid_info__20210906.basic_info__us_privacy_map}) as lidid_info__20210906__basic_info__us_privacy_map ;;
    relationship: one_to_many
  }

  join: lidid_info__20210906__basic_info__visits__visits_last_week {
    view_label: "Lidid Info 20210906: Basicinfo Visits Visitslastweek"
    sql: LEFT JOIN UNNEST(${lidid_info__20210906.basic_info__visits__visits_last_week}) as lidid_info__20210906__basic_info__visits__visits_last_week ;;
    relationship: one_to_many
  }

  join: lidid_info__20210906__basic_info__requests__requests {
    view_label: "Lidid Info 20210906: Basicinfo Requests Requests"
    sql: LEFT JOIN UNNEST(${lidid_info__20210906.basic_info__requests__requests}) as lidid_info__20210906__basic_info__requests__requests ;;
    relationship: one_to_many
  }

  join: lidid_info__20210906__last_bids__latest_high_bid_sizes {
    view_label: "Lidid Info 20210906: Lastbids Latesthighbidsizes"
    sql: LEFT JOIN UNNEST(${lidid_info__20210906.last_bids__latest_high_bid_sizes}) as lidid_info__20210906__last_bids__latest_high_bid_sizes ;;
    relationship: one_to_many
  }

  join: lidid_info__20210906__basic_info__requests__requests__value {
    view_label: "Lidid Info 20210906: Basicinfo Requests Requests Value"
    sql: LEFT JOIN UNNEST(${lidid_info__20210906__basic_info__requests__requests.value}) as lidid_info__20210906__basic_info__requests__requests__value ;;
    relationship: one_to_many
  }
}
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
