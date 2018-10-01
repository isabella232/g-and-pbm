connection: "liveintent_main_redshift"

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
explore: d_esp_pairing_volume {
  hidden: yes
}

explore: rtb_mapping_type_performance_cohorts {
  hidden: yes
}

explore: app_ids_with_multiple_domains {

}

explore: alert_app_id_new_secondary_domains {}

explore: active_hash_volume {

}
