connection: "athena_copenhagen"

include: "*.view.lkml"                # include all views in the views/ folder in this project
include: "/metadata/bidder_sync_names.view.lkml"

explore: sellable_pairs_pii_count_info {
  label: "Connected LI HEMs (Overall)"
  description: "Uniques across the entire dataset"
}

explore: sellable_pairs_aggregates_info {
  label: "Core Aggregate"
  description: "Pairs with additional dimensions"

  join: bidder_names_with_sellable_partner_link {
    fields: [bidder_names_with_sellable_partner_link.name]
    sql_on: ${sellable_pairs_aggregates_info.cookiedomain} = ${bidder_names_with_sellable_partner_link.pub_or_app_id} ;;
    type: left_outer
    relationship: many_to_one
    view_label: "C Identity Base Agg"
  }
}

explore: sellable_pairs_pii_count_by_domain_info {
  label: "Connected LI HEMs (Domain)"
  description: "Uniques with cookie domain granularity"

  join: bidder_names_with_sellable_partner_link {
    fields: [bidder_names_with_sellable_partner_link.name]
    sql_on: ${sellable_pairs_pii_count_by_domain_info.cookiedomain} = ${bidder_names_with_sellable_partner_link.pub_or_app_id} ;;
    type: left_outer
    relationship: many_to_one
    view_label: "C Identity Agg Partner Ids Domain"
  }
}

explore: sellable_pairs_cookie_count_by_domain_info {
  label: "Connected Partner IDs"
  description: "Unique third party IDs connected to sellable HEMs"

  join: bidder_names_with_sellable_partner_link {
    fields: [bidder_names_with_sellable_partner_link.name]
    sql_on: ${sellable_pairs_cookie_count_by_domain_info.cookiedomain} = ${bidder_names_with_sellable_partner_link.pub_or_app_id} ;;
    type: left_outer
    relationship: many_to_one
    view_label: "C Identity Agg Partner Ids Domain"
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
