view: pv_owned_v_prospect {

  derived_table: {
    sql:  SELECT DATE_PARSE(date_p,'%Y%m%d') event_date, publisher_id_p, prefix_p, segment_id_p, cookie_domain_p, COUNT(*) identifiers
          FROM "auto_pcg"."private_customer_graph"
          WHERE DATE_PARSE(date_p,'%Y%m%d') BETWEEN CURRENT_DATE - INTERVAL '28' DAY AND CURRENT_DATE - INTERVAL '1' DAY
          AND segment_id_p <> '71653'
          GROUP BY 1,2,3,4,5 ;;
  }

  dimension_group: event {
    sql: ${TABLE}.event_date ;;
    datatype: date
    type: time
    timeframes: [date]
  }

  dimension: publisher_id {
    type: string
    sql: ${TABLE}.publisher_id_p ;;
  }

  dimension: prefix {
    type: string
    sql: ${TABLE}.prefix_p  ;;
  }

  dimension: segment_id {
    type: number
    sql: ${TABLE}.segment_id_p ;;
  }

  dimension: cookie_domain {
    type: string
    sql: ${TABLE}.cookie_domain_p ;;
  }

  measure: identifiers {
    type: sum
    sql: ${TABLE}.identifiers ;;
  }

  dimension: owned_or_prospect {
    type: string
    sql: CASE ${segment_id} WHEN '71651' THEN 'Owned' WHEN '71652' THEN 'Prospect' END ;;
  }

  dimension: is_adobe_cookie {
    type: yesno
    sql: ${cookie_domain} = '82775' ;;
  }

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
}
