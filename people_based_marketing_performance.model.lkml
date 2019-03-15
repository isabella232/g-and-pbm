connection: "ny_athena"

include: "*.view.lkml"         # include all views in this project
#include: "*.dashboard.lookml"  # include all dashboards in this project

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }

explore: mapping_type_performance_pbm {
  label: "Mapping Type Performance (PBM)"
  description: "Performance of Hashes in Remarketing Campaigns based on the Mapping Type Used to Add Hash to Segment"
  group_label: "Graph Quality"
}

explore: order_id_and_skus {
}

explore: kohls_test {
label: "Kohl's SKU"
}

explore: segmentation_events {}

explore: copenhagen_revenue {}
