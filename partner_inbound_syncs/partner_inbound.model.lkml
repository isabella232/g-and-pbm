connection: "athena_copenhagen"

include: "*.view.lkml"                # include all views in the views/ folder in this project

explore: partner_inbound_syncs_detailed {
  label: "Detailed Partner Inbound Syncs Aggs"

  join: lfx_zf_pubvertisers {
    fields: [lfx_zf_pubvertisers.domain, lfx_zf_pubvertisers.name]
    sql_on: ${partner_inbound_syncs_detailed.publisherorappid} = ${lfx_zf_pubvertisers.pub_uid} ;;
    type: left_outer
    relationship: many_to_one
  }
}

explore: overall_daily_partner_inbound_sync_aggregates {
  label: "Overall Partner Inbound Syncs Counts"
}

explore: daily_no_syncing_partners {
  label: "Number of Daily Partners Syncing to us"
}
