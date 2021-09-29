connection: "athena_copenhagen"

include: "*.view.lkml"                       # include all views in this project
include: "/metadata/bidder_sync_names.view.lkml"   # including bidder sync names view

# NEW REVISED LOOKS #


explore: c_identity_base_agg {
  label: "Available Pairs"
  description: "Pairs with additional dimensions"

  join: bidder_names_with_sellable_partner_link {
    fields: [bidder_names_with_sellable_partner_link.name]
    sql_on: ${c_identity_base_agg.cookiedomain} = ${bidder_names_with_sellable_partner_link.pub_or_app_id} ;;
    type: left_outer
    relationship: many_to_one
    view_label: "Bidder Names"
  }
}

explore: c_identity_agg_partner_ids_total {
  label: "Available Partner IDs"
  description: "Total third party IDs connected to sellable HEMs"

  join: bidder_names_with_sellable_partner_link {
    fields: [bidder_names_with_sellable_partner_link.name]
    sql_on: ${c_identity_agg_partner_ids_total.cookiedomain} = ${bidder_names_with_sellable_partner_link.pub_or_app_id} ;;
    type: left_outer
    relationship: many_to_one
    view_label: "Bidder Names"
  }
}

explore: c_identity_agg_hems_total {
  label: "Available HEMs (Overall)"
  description: "Total sellable HEMs available by day"
}

explore: c_identity_agg_partner_ids_domain {
  label: "Available HEMs (by Third-Party Domain)"
  description: "Total sellable HEMs broken down by individual domain"

  join: bidder_names_with_sellable_partner_link {
    fields: [bidder_names_with_sellable_partner_link.name]
    sql_on: ${c_identity_agg_partner_ids_domain.cookiedomain} = ${bidder_names_with_sellable_partner_link.pub_or_app_id} ;;
    type: left_outer
    relationship: many_to_one
    view_label: "Bidder Names"
  }
}

explore: c_identity_domain_relations {
  label: "Available HEMs (by Third-Party Domain Overlap)"
  description: "Comparison of shared IDs between third-party domains"
  join: primary {
    from: bidder_names_with_sellable_partner_link
    type: left_outer
    relationship: many_to_one
    sql_on: ${c_identity_domain_relations.primary_cdomain} = ${primary.pub_or_app_id} ;;
    view_label: "Primary Cookie Domain"
  }
  join: secondary {
    from: bidder_names_with_sellable_partner_link
    type: left_outer
    relationship: many_to_one
    sql_on: ${c_identity_domain_relations.secondary_cdomain} = ${secondary.pub_or_app_id} ;;
    view_label: "Secondary Cookie Domain"
  }
}

explore: c_identity_domain_relations_latest {
  label: "Overlaps between Partner Domains"
  description: "Shared HEMs and pairs associated between domains"
  join: primary {
    from: bidder_names_with_sellable_partner_link
    type: left_outer
    relationship: many_to_one
    sql_on: ${c_identity_domain_relations_latest.primary_cdomain} = ${primary.pub_or_app_id} ;;
    view_label: "Primary Cookie Domain"
  }
  join: secondary {
    from: bidder_names_with_sellable_partner_link
    type: left_outer
    relationship: many_to_one
    sql_on: ${c_identity_domain_relations_latest.secondary_cdomain} = ${secondary.pub_or_app_id} ;;
    view_label: "Secondary Cookie Domain"
  }
  hidden: yes
  # This seems to be a less optimized version than c_identity_domain_relations. Is only used for two experimental views. To be removed.
}

explore: data_delivery_pair_stats {
  label: "Customer Deliveries: Pair Stats"
}

explore: data_delivery_cluster_stats {
  label: "Customer Deliveries: Cluster Stats"
}

explore: data_delivery_liid_attribute_stats {
  label: "Customer Deliveries: Attribute Stats"
}

explore: etl_tracker_airflow {

  label: "Track Airflow ETL Jobs"
}

explore: partner_cookie_stats {
  label: "Partner ID Performance"
}

explore: mgtemp_pixelconfig_emptypixel_total_interval15_7d {
  label: "Pixel Config Empty Pixel Total"
}

explore: mgtemp_pixelconfig_redirectpixel_total_interval15_7d {

  label: "Pixel Config Redirect Pixel Total"

}

explore: sellable_email_hash_count_aggregates {

  label: "Sellable Email Hash Count Aggregates"

}
