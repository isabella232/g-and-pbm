connection: "ny_athena"

include: "*.view.lkml"                       # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# NEW REVISED LOOKS #

explore: c_identity_agg_hems_total {
  label: "Connected LI HEMs (Overall)"
  description: "Uniques across the entire dataset"
}

explore: c_identity_agg_partner_ids_total {
  label: "Connected Partner IDs"

  join: bidder_names_with_sellable_partner_link {
    fields: [bidder_names_with_sellable_partner_link.name]
    sql_on: ${c_identity_agg_partner_ids_total.cookiedomain} = ${bidder_names_with_sellable_partner_link.pub_or_app_id} ;;
    type: left_outer
    relationship: many_to_one
    view_label: "C Identity Agg Partner Ids Total"
  }
}

explore: c_identity_agg_partner_ids_domain {
  label: "Connected LI HEMs (Domain)"
  description: "Uniques with cookie domain granularity"

  join: bidder_names_with_sellable_partner_link {
    fields: [bidder_names_with_sellable_partner_link.name]
    sql_on: ${c_identity_agg_partner_ids_domain.cookiedomain} = ${bidder_names_with_sellable_partner_link.pub_or_app_id} ;;
    type: left_outer
    relationship: many_to_one
    view_label: "C Identity Agg Partner Ids Domain"
  }
}

explore: c_identity_base_agg {
  label: "Core Aggregate"
  description: "Pairs with additional dimensions"

  join: bidder_names_with_sellable_partner_link {
    fields: [bidder_names_with_sellable_partner_link.name]
    sql_on: ${c_identity_base_agg.cookiedomain} = ${bidder_names_with_sellable_partner_link.pub_or_app_id} ;;
    type: left_outer
    relationship: many_to_one
    view_label: "C Identity Base Agg"
  }
}
