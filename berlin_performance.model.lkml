connection: "liveintent_main_redshift"

include: "*.view.lkml"                       # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

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
datagroup: berlin_revenue_aggregates_updated {
  sql_trigger: SELECT c.max_date IS NOT NULL
  FROM (
  SELECT MAX(event_date) max_date FROM public.uslicer_exact_fact_new_looker WHERE event_date = CURRENT_DATE - 1 ) a
  LEFT JOIN (
  SELECT MAX(event_date) max_date FROM taboola_agg.revenue_summary) b
  ON a.max_date = b.max_date
  LEFT JOIN (
  SELECT MAX(event_date) max_date FROM taboola_agg.revenue_summary_ron) c
  ON b.max_date = c.max_date;;
}


explore: berlin_revenue {

}
