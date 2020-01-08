connection: "ny_athena"

include: "*.view.lkml"                       # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# NEW REVISED LOOKS #

explore: c_identity_agg_hems_total {
  label: "Total Sellable HEMs"
}

explore: c_identity_agg_partner_ids_total {
  label: "Total Sellable Partner IDs"

  join: bidder_names_with_sellable_partner_link {
    fields: [bidder_names_with_sellable_partner_link.name]
    sql_on: ${c_identity_agg_partner_ids_total.cookiedomain} = ${bidder_names_with_sellable_partner_link.pub_or_app_id} ;;
    type: left_outer
    relationship: many_to_one
  }
}

explore: c_identity_agg_partner_ids_domain {
  label: "Total Sellable HEMs (By Domain)"

  join: bidder_names_with_sellable_partner_link {
    fields: [bidder_names_with_sellable_partner_link.name]
    sql_on: ${c_identity_agg_partner_ids_domain.cookiedomain} = ${bidder_names_with_sellable_partner_link.pub_or_app_id} ;;
    type: left_outer
    relationship: many_to_one
  }
}

explore: sellable_pairs_aggregates {
  label: "Sellable Pairs Aggregate"

  join: bidder_names_with_sellable_partner_link {
    fields: [bidder_names_with_sellable_partner_link.name]
    sql_on: ${sellable_pairs_aggregates.cookiedomain} = ${bidder_names_with_sellable_partner_link.pub_or_app_id} ;;
    type: left_outer
    relationship: many_to_one
  }
}
