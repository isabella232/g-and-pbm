connection: "athena_copenhagen"

include: "*.view.lkml"                # include all views in the views/ folder in this project

explore: overall_daily_partner_inbound_sync_aggregates {
  label: "Overall Partner Inbound Syncs Counts"
}

explore: partner_inbound_aggs {
  label: "Full Partner Inbound Sync Aggs"
}
