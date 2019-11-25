connection: "ny_athena"

include: "*.view.lkml"                       # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

explore: sellable_aggs_hems {
label: "Hems Count"
}

explore: sellable_aggs_maids {
label: "Maids Count"
}

explore: sellable_aggs_total {
label: "Total by Cookie Domain"
}

explore: sellable_aggs_region_cookiedom {
label: "Region Distribution by Cookie Domain"
}

explore: sellable_aggs_probabilistic {
label: "Probabilistic by Cookie Domain"
}

explore: sellable_aggs_deterministic {
label: "Deterministic by Cookie Domain"
}

explore: sellable_aggs_hiaccprobabilistic {
label: "HiAccProbabilistic by Cookie Domain"
}

explore: sellable_aggs_deterministicandhiacc {
  label: "DeterministicandHiAccProbabilistic by Cookie Domain"
}

explore: sellable_agg_max_date {}

explore: sellable_agg_cookie_date {}

explore: sellable_aggs_hem_date {}
