view: lidomulid {
#auto_dmps.li_domain_ulid_stats
  sql_table_name: auto_dmps.li_domain_ulid_stats ;;

  dimension: day_date {
    type: date
    sql: DATE_PARSE(${TABLE}.date_p,'%Y%m%d') ;;
    label: "Date"
  }

  dimension: first_seen_date {
    type: date
    sql: DATE_PARSE(${TABLE}.firstseenat,'%Y%m%d') ;;
    label: "First Seen Date"
  }

  dimension: lastseenat {
    type: date
    sql: DATE_PARSE(${TABLE}.lastseenat,'%Y%m%d') ;;
    label: "Last Seen Date"
  }

  dimension: domain {
    type: number
    sql: ${TABLE}.domain ;;
    label: "Domain"
  }

  measure: totalcount {
    type: sum
    sql: ${TABLE}.totalcount ;;
    label: "Total Count"
  }

  measure: numnew {
    type: sum
    sql: ${TABLE}.numnew ;;
    label: "Number New"
  }

  measure: numdeleted {
    type: sum
    sql: ${TABLE}.numdeleted ;;
    label: "Number Deleted"
  }




}

# view: lidomulid {
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
