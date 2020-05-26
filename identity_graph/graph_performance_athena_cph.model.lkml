connection: "athena_copenhagen"

include: "**/athena_cph/*.view.lkml"
include: "**/dashboards/third_party_cookie_syncs.dashboard.lookml"
include: "/**/metadata/bidder_sync_names.view.lkml"   # including bidder sync names view
label: "Identity Graph"

explore: graph_cluster_run_times {
  group_label: "Graph Pipeline"
  label: "Graph Job Run Time Performance"
  description: "Historic Spark and Map-Reduce Performance Information"
}

explore: most_recent_graph_run {
  hidden: yes
  group_label: "Graph Pipeline"
  description: "Most Recent Spark and Map-Reduce Performance Information"
}

explore: graph_cost_by_job {
  group_label: "Graph Pipeline"
  label: "Graph Job Financial Cost"
  description: "Historic Spark and Map-Reduce Cost Information"
}

explore: accuracy_pair_stats {
  group_label: "Graph Quality"
  view_label: "Mapping Type Accuracy Stats"
  label: "Mapping Type Accuracy Statistics"
  description: "Data Generated From Data Science's Monthly Accuracy Tests"

join: accuracy_cookie_stats_modified {
  relationship: one_to_one
  sql_on: ${accuracy_pair_stats.event_date_date} = ${accuracy_cookie_stats_modified.event_date_date}
          AND ${accuracy_pair_stats.mapping_type} = ${accuracy_cookie_stats_modified.mapping_type};;
  type: full_outer
  view_label: "Mapping Type Stats"
}
}

explore: graph_daily_hash_activity_distribution {
  group_label: "Graph Quality"
  label: "Hash Activity Distribution"
  description: "Distribution of the # of Days a Hash Appeared in the Prior 30 Days"
}

explore: graph_daily_cookie_activity_distribution {
  group_label: "Graph Quality"
  label: "Cookie Activity Distribution"
  description: "Distribution of the # of Days a Cookie Appeared in the Prior 30 Days"

}

explore: accuracy_pair_overlap {
  group_label: "Graph Quality"
  label: "Mapping Type Overlaps: Pairs"
  description: "Number of Shared Pairs Between Mapping Types"
}

explore: people_verified_counts {
  group_label: "Graph Performance"
  label: "People Verified Counts by App ID"
  description: "Counts of Identifiers By People-Verified, Customer-Verified, and if Found in a Cookie-Challenged Inventory"
}

explore: accuracy_cookie_overlap {
  group_label: "Graph Quality"
  label: "Mapping Type Overlaps: Cookies"
  description: "Number of Shared Cookies Between Mapping Types"
}

explore: data_selling_sellable_pairs_by_cookie_domain {
  group_label: "Data Selling"
  label: "Sellable Pairs by Cookie Domain"
  description: "Historical Counts of Sellable Pairs by Cookie Domain"

  join: bidder_sync_names {
    relationship: many_to_one
    sql_on: ${data_selling_sellable_pairs_by_cookie_domain.cookie_domain} = ${bidder_sync_names.pub_or_app_id} ;;
    type: left_outer
    fields: [bidder_sync_names.name]
    view_label: "Data Selling Sellable Pairs By Cookie Domain"
  }
}

explore: first_party_cookie_syncs {
  group_label: "Data Selling"
  description: "First Party Cookie Syncs with IDaaS (Last Two Weeks)"

  join: bidder_sync_names {
    relationship: many_to_one
    sql_on: ${first_party_cookie_syncs.identifier_type} = ${bidder_sync_names.pub_or_app_id} ;;
    type: left_outer
    fields: [bidder_sync_names.name]
    view_label: "First Party Cookie Syncs"
  }
}

explore: third_party_cookie_syncs {
  group_label: "Data Selling"
  description: "Third Party Cookie Syncs with IDaaS (Last Two Weeks)"

  join: bidder_sync_names {
    relationship: many_to_one
    sql_on: ${third_party_cookie_syncs.identifier_type} = ${bidder_sync_names.pub_or_app_id} ;;
    type: left_outer
    fields: [bidder_sync_names.name]
    view_label: "Third Party Cookie Syncs"
  }
}

explore: region_counts {
  group_label: "Auto Sellable"
  label: "Region Distribution"
}

explore: sellable_unique_pairs {
  group_label: "Auto Sellable"
  label: "Unique Pairs Count"
  }

explore: sellable_unique_piiidentifier {
  group_label: "Auto Sellable"
  label: "Unique 3rd Party IDs Count"
}

explore: unique_hems_sellable {
  group_label: "Auto Sellable"
  label: "Unique Hems Count"
}

explore: unique_pairs_by_cookie_domain {
  group_label: "Auto Sellable"
  label: "Unique Pairs Count by Cookie Domain"

  join: bidder_sync_names {
    relationship: one_to_one
    sql_on: ${unique_pairs_by_cookie_domain.cookiedomain} = ${bidder_sync_names.pub_or_app_id} ;;
    type: left_outer
  }
}

explore: unique_piiidentifier_by_cookie_domain {
  group_label: "Auto Sellable"
  label: "Unique 3rd Party IDs Count by Cookie Domain"

  join: bidder_sync_names {
    relationship: one_to_one
    sql_on: ${unique_piiidentifier_by_cookie_domain.cookiedomain} = ${bidder_sync_names.pub_or_app_id} ;;
    type: left_outer
  }
}

explore: third_party_ids_count_by_cookie_domain {
  group_label: "Auto Sellable"
  label: "Third Party IDs by Cookie Domain"

  join: bidder_sync_names {
    relationship: one_to_one
    sql_on: ${third_party_ids_count_by_cookie_domain.cookiedomain} = ${bidder_sync_names.pub_or_app_id} ;;
    type: left_outer
  }
}

explore: algorithm_class_by_cookie_domain {
  group_label: "Auto Sellable"
  label: "Algorithm Classification by Cookie Domain"
}

explore: unique_hems_by_cookie_domain {
  group_label: "Auto Sellable"
  label: "Unique Hems Count by Cookie Domain"

  join: bidder_sync_names {
    relationship: one_to_one
    sql_on: ${unique_hems_by_cookie_domain.cookiedomain} = ${bidder_sync_names.pub_or_app_id} ;;
    type: left_outer
  }
}

explore: cookie_hash_ranks {
  group_label: "Auto Sellable"
  label: "Cluster size of Hash Ranks"
}

explore: cookie_hash_ranks_by_cookie_domain {
  group_label: "Auto Sellable"
  label: "Cluster size of Hash Ranks by Cookie Domain"
}

explore: unique_pairs_sellable_by_cookie_domain {
  group_label: "Auto Sellable"
  label: "Unique Pairs by Cookie Domain - Sellable"
}

explore: hems_by_cookie_domain {
  group_label: "Auto Sellable"
  label: "Hems by Cookie Domain"
}

explore: deterministic_cookies {
  group_label: "Auto Sellable"
  label: "Deterministic values by Cookie Domain"
}

explore: total_by_cookiedomain_full {
  group_label: "Auto Sellable"
  label: "Total values by Cookie Domain Full"
}

explore: deterministic_by_cookie_domain_total {
  group_label: "Auto Sellable"
  label: "Deterministic values by Cookie Domain Full"
}

explore: hiaccprobabilistic_by_cookiedomain_full{
  group_label: "Auto Sellable"
  label: "HiAccProbabilistic values by Cookie Domain Full"
}

explore: deterministicandhiaccprobabilistic_by_cookiedomain_full {
  group_label: "Auto Sellable"
  label: "Deterministic and HiAccProbabilistic values by Cookie Domain Full"
}

explore: total_by_cookie_domain {
  group_label: "Auto Sellable"
  label: "Total values by Cookie Domain"
}

explore: hiaccprobabilistic_by_cookie_domain {
  group_label: "Auto Sellable"
  label: "HiAccProbabilistic values by Cookie Domain"
}

explore: deterministicandhiaccprobabilistic_by_cookie_domain {
  group_label: "Auto Sellable"
  label: "Deterministic and HiAccProbabilistic values by Cookie Domain"
}

explore: feature_1_by_cookie_domain {
  group_label: "Auto Sellable"
}

explore: feature_2_by_cookie_domain {
  group_label: "Auto Sellable"
}

explore: feature_3_by_cookie_domain {
  group_label: "Auto Sellable"
}

explore: region_by_cookie_domain {
  group_label: "Auto Sellable"
  label: "Region by Cookie Domain"
}

explore: algorithm_classification_sellable {
  group_label: "Auto Sellable"
}

explore: adobe_by_classification_type {
  group_label: "Auto Deliverable"
  label: "Adobe - Algorithmic Classification"
}

explore: narrative_by_classification_type {
  group_label: "Auto Deliverable"
  label: "Narrative - Algorithmic Classification"
}

explore: oracle_by_classification_type {
  group_label: "Auto Deliverable"
  label: "Oracle - Algorithmic Classification"
}

explore: walmart_by_classification_type {
  group_label: "Auto Deliverable"
  label: "Walmart - Algorithmic Classification"
}

explore: feature_1_by_partner {
  group_label: "Auto Deliverable"
}

explore: feature_2_by_partner {
  group_label: "Auto Deliverable"
}

explore: feature_3_by_partner {
  group_label: "Auto Deliverable"
}

explore: narrative_by_cookie_domain {
  group_label: "Auto Deliverable"
  label: "Narrative - Weight Distribution by Cookie Domain"
}

explore: weight_by_partner {
  group_label: "Auto Deliverable"
  label: "Weight Distribution by Partner"
}

explore: bothhighacc_by_partner {
  group_label: "Auto Deliverable"
  label: "BothHighAcc - Weight Distribution by Partner"
}

explore: deterministic_by_partner {
  group_label: "Auto Deliverable"
  label: "Deterministic - Weight Distribution by Partner"
}

explore: hiaccprobabilistic_by_partner {
  group_label: "Auto Deliverable"
  label: "HiAccProbabilistic - Weight Distribution by Partner"
}

explore: narrative_thirdpartyids_hems {
  group_label: "Auto Deliverable"
  label: "Narrative - Unique 3rd Party IDs and Hems"
}

explore: narrative_unique_pairs {
  group_label: "Auto Deliverable"
  label: "Narrative - Unique Pairs Count"
}

explore: narrative_pairs_count_by_cookie_domain {
  group_label: "Auto Deliverable"
  label: "Narrative - Unique Pairs Count by Cookie Domain"
}

explore: narrative_unique_hems_by_cookie_domain {
  group_label: "Auto Deliverable"
  label: "Narrative - Unique Hems Count by Cookie Domain"
}

explore: narrative_no_unique_thirdpartyids_by_cookie_domain {
  group_label: "Auto Deliverable"
  label: "Narrative -  Unique 3rd Party IDs count by Cookie Domain"
}
