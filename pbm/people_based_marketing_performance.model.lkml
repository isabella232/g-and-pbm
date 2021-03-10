connection: "ny_athena"

include: "*.view.lkml"         # include all views in this project
include: "**/archived_pbm/*.view.lkml"

explore: mapping_type_performance_pbm {
  label: "Mapping Type Performance (PBM)"
  description: "Performance of Hashes in Remarketing Campaigns based on the Mapping Type Used to Add Hash to Segment"
  group_label: "Graph Quality"
}

explore: order_id_and_skus {
hidden: yes
}

explore: kohls_test {
label: "Kohl's SKU"
hidden: yes
}

explore: segmentation_events {
hidden: yes
}

#explore: copenhagen_revenue {
#hidden: yes
#}
