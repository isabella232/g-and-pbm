view: parter_cookie_stats_domain
{

  sql_table_name: auto_reports.cookie_progress ;;


  dimension: domain {
    type: string
    sql: ${TABLE}.domain ;;
    label: "Domain"
  }


  dimension: month_day {
    type: date
    sql: ${TABLE}.month_day ;;
    #sql: ${TABLE}.month_day ;;
    label: "Date"
  }

  measure: total_count_ratio {
    type: sum
    sql: ${TABLE}.total_count_ratio;;
    label: "Ratio of Latest Sync to Earliest Sync"
  }


  measure: latest_month_max {
    type: sum
    sql: ${TABLE}.latest_total_count ;;
    label: "Latest Total Count"
  }



}



# view: parter_cookie_stats_domain {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
