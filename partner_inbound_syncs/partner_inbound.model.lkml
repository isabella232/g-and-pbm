connection: "athena_copenhagen"

include: "*.view.lkml"                # include all views in the views/ folder in this project

explore: overall_daily_partner_inbound_sync_aggregates {
  label: "Overall Partner Inbound Syncs Counts"
}

explore: partner_inbound_aggs {
  label: "Full Partner Inbound Sync Aggs"

  join: lfx_zf_pubvertisers {
    fields: [lfx_zf_pubvertisers.domain, lfx_zf_pubvertisers.name]
    sql_on: ${partner_inbound_aggs.publisherorappid} = ${lfx_zf_pubvertisers.userver_id} ;;
    type: left_outer
    relationship: many_to_one

  }
}
