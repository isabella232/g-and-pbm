connection: "athena_berlin"

include: "*.view.lkml"
include: "/lfx/*.view.lkml"
include: "/ipow_aggregates/*.view.lkml"

explore: metadata_aggregate {
  label: "Header Metadata"

  join: zf_pubvertisers {
    view_label: "Publisher Metadata"
    sql_on: ${metadata_aggregate.domain} = ${zf_pubvertisers.domain} ;;
    sql_where: ${zf_pubvertisers.type} = 'publisher' OR ${zf_pubvertisers.type} IS NULL ;;
    relationship: many_to_many
    type: left_outer
    fields: [zf_pubvertisers.publisher_id,zf_pubvertisers.name,zf_pubvertisers.count]
  }

  join: sspcustom_exact {
    view_label: "Exchange Performance"
    sql_on: ${zf_pubvertisers.publisher_id} = ${sspcustom_exact.publisher_id}
    AND ${metadata_aggregate.cooker_date} = ${sspcustom_exact.date};;
    relationship: one_to_many
    type: left_outer
  }
}
