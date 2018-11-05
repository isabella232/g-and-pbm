connection: "bigquery_log_data"

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

datagroup: new_conv_day_data {
  sql_trigger: SELECT MAX(PARSE_DATE('%Y%m%d',REGEXP_EXTRACT(_TABLE_SUFFIX,r"(\d{8})$"))) FROM `userver_logs_ssp.conv_*` WHERE REGEXP_CONTAINS(_TABLE_SUFFIX, r"^[A-z0-9]{5}_[\d]{8}") ;;
}

explore: intelligent_tracking_prevention {

}
