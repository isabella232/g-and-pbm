connection: "ny_athena"

include: "*.view.lkml"                       # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

explore: sellable_aggs_hems {
label: "Hems Count"
}

explore: sellable_aggs_pairs_by_partner_timeseries {
label: "Pairs by Partner Time Series"
}

explore: sellable_aggs_cluster {
label: "Clusters by Date"
}

explore: sellable_aggs_region_by_date {
label: "Region by Date"
}

explore: sellable_aggs_algo {
label: "Algorithms by Date"
}

explore: sellable_aggs_latest_region {
label: "Region Distribution"
}

explore: sellable_aggs_clustersize_general {
label: "Cluster Size Distribution"
}

explore: sellable_aggs_pairs_by_partner {
label: "Pairs by Partner ID"
}

explore: sellable_aggs_sellable_pairs {
label: "Sellable Pairs"
}

explore: sellable_aggs_thirdpartyids_by_cookiedomain {
label: "Partner IDs by Cookie Domain"
}

explore: sellable_aggs_pairs_best_classification {
label: "Pairs by Best Possible Classification"
}

explore: sellable_aggs_maids_overtime{
label: "Partner IDs by Partner Time Series"
}

explore: sellable_aggs_totalpairs_by_date {
label: "Total Pairs by Date"
}

explore: sellable_aggs_partnerid_mapper {
label: "Partner ID Mapper"
}

explore: sellable_aggs_total_by_partner_mapped {
label: "Total by Partner - Mapped"
}

explore: sellable_aggs_deterministic_partner_mapped {
label: "Deterministic by Partner - Mapped"
}

explore: sellable_aggs_hiaccprob_partner_mapped {
label: "HiAacc by Partner - Mapped"
}

explore: sellable_aggs_prob_partner_mapped {
label: "Probabilistic by Partner Mapped"
}

explore: sellable_agg_detandhiacc_partner_mapped {
label: "Deterministic and HiAcc Probabilistic by Partner Mapped"
}

explore: sellable_aggs_latest_date_partner {
label: "Partner - Last Seen Date"
}

explore: sellable_agg_latest_sellable_pair_count_partner {
label: "Partner Latest Sellable Pair Count"
}

explore: sellable_aggs_thirdpartyids_count_partner {
label: "Partner Latest Third Party ID Count"
}

explore: sellable_aggs_algo_counts_partner {
label: "Partner Latest Algorithm Classification"
}

explore: sellable_aggs_partner_cluster_sizes {
label: "Partner Cluster Size"
}

explore: sellable_aggs_partner_regions {
label: "Partner Region"
}

explore: sellable_aggs_lastdate_partner {
label: "Latest Date Partner"
}

explore: sellable_aggs_liids_by_partner {
label: "LIID Count by Partner"
}

explore: sellable_aggs_latest_date {}

explore: sellable_aggs_third_partyids_total {}

explore: sellable_aggs_pairs_total {}

explore: sellable_aggs_liid_count {}

explore: sellable_agg_max_date {}

explore: sellable_agg_cookie_date {}

explore: sellable_aggs_hem_date {}
