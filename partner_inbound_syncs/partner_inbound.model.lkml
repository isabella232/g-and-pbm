connection: "athena_copenhagen"

include: "*.view.lkml"                # include all views in the views/ folder in this project

explore: partner_inbound_syncs_detailed {
  label: "Detailed Partner Inbound Syncs Aggs"
}
