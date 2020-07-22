connection: "liveintent_main_redshift"

include: "*.view.lkml"                # include all views in the views/ folder in this project

explore: lfx_zf_pubvertisers {
  label: "Pubvertisers Mapping"
}
