connection: "athena_copenhagen"

include: "*.view.lkml"                # include all views in the views/ folder in this project

explore: index_tracking {
}

explore: index_tracking_new_domains_7d {
  label: "New Domains - Weekly Basis"
}

explore: index_tracking_missing_domains_7d {
  label: "Missing Domains - Weekly Basis"
}
