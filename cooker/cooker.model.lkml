connection: "athena_berlin_dynamodb"

include: "*.view.lkml"
include: "/lfx/*.view.lkml"
include: "/ipow_aggregates/*.view.lkml"
include: "/metadata/domain_properties_production.view.lkml"
include: "/metadata/active_exchange_publishers_last_thirty.view.lkml"
include: "//liveintent/ownership_sf.view.lkml"

explore: metadata_aggregate {
  label: "Header Metadata"
  view_label: "Cooker Aggregate"

  join: zf_pubvertisers {
    view_label: "Publisher Metadata"
    sql_on: ${metadata_aggregate.domain} = ${zf_pubvertisers.domain} ;;
    sql_where: ${zf_pubvertisers.type} = 'publisher' OR ${zf_pubvertisers.type} IS NULL ;;
    relationship: many_to_many
    type: left_outer
    fields: [zf_pubvertisers.publisher_id,zf_pubvertisers.name,zf_pubvertisers.count_publishers]
  }

  join: zf_agencies {
    view_label: "Publisher Metadata"
    sql_on: ${zf_pubvertisers.agency_id} = ${zf_agencies.id} ;;
    relationship: many_to_one
    type: left_outer
    fields: [zf_agencies.userver_id,zf_agencies.name]
  }

  #join: sspcustom_exact {
  #  view_label: "LI Exchange Measures"
  #  sql_on: ${zf_pubvertisers.publisher_id} = ${sspcustom_exact.publisher_id}
  #  AND ${metadata_aggregate.cooker_date} = ${sspcustom_exact.date};;
  #  relationship: one_to_many
  #  type: left_outer
  #  fields: [sspcustom_exact.basic_measures*]
  #}

  join: active_exchange_publishers_last_thirty {
    sql_on: ${zf_pubvertisers.publisher_id} = ${active_exchange_publishers_last_thirty.publisher_id} ;;
    relationship: one_to_one
    type: left_outer
    fields: [active_exchange_publishers_last_thirty.total_impressions_last_thirty]
    view_label: "Publisher Metadata"
  }

  join: domain_properties_production {
    view_label: "Akamai CNAME"
    sql_on: ${metadata_aggregate.domain} = ${domain_properties_production.domainname} ;;
    relationship: many_to_many
    type: left_outer
    fields: []
  }
}
