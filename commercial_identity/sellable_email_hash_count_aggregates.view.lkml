view: sellable_email_hash_count_aggregates {

  sql_table_name: auto_sellable.sellable_email_hash_count_aggregates ;;
  suggestions: no


  dimension_group: date_p {
    type: time
    sql: DATE_PARSE(${TABLE}.date_p,'%Y%m%d') ;;
    timeframes: [raw,date,day_of_week,day_of_month,month,quarter,year]
  }

  dimension: hashissellable {
    type: yesno
    sql: ${TABLE}.hashissellable ;;
    label: "Sellable Hash"
  }

  measure: total {
    type: sum
    sql: ${TABLE}.total;;
    value_format_name: decimal_0
    group_item_label: "Total"
  }

  measure: md5 {
    type: sum
    sql: ${TABLE}.md5;;
    value_format_name: decimal_0
    group_item_label: "MD5"
  }

  measure: sha1 {
    type: sum
    sql: ${TABLE}.sha1;;
    value_format_name: decimal_0
    group_item_label: "SHA1"
  }

  measure: sha2 {
    type: sum
    sql: ${TABLE}.sha2;;
    value_format_name: decimal_0
    group_item_label: "SHA2"
  }




  # # You can specify the table name if it's different from the view name:
  # sql_table_name: my_schema_name.tester ;;
  #
  # # Define your dimensions and measures here, like this:
  # dimension: user_id {
  #   description: "Unique ID for each user that has ordered"
  #   type: number
  #   sql: ${TABLE}.user_id ;;
  # }
  #
  # dimension: lifetime_orders {
  #   description: "The total number of orders for each user"
  #   type: number
  #   sql: ${TABLE}.lifetime_orders ;;
  # }
  #
  # dimension_group: most_recent_purchase {
  #   description: "The date when each user last ordered"
  #   type: time
  #   timeframes: [date, week, month, year]
  #   sql: ${TABLE}.most_recent_purchase_at ;;
  # }
  #
  # measure: total_lifetime_orders {
  #   description: "Use this for counting lifetime orders across many users"
  #   type: sum
  #   sql: ${lifetime_orders} ;;
  # }
}

# view: sellable_email_hash_count_aggregates {
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
