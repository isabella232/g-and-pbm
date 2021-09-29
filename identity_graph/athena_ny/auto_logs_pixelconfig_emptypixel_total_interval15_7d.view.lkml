view: auto_logs_pixelconfig_emptypixel_total_interval15_7d
{

  sql_table_name: auto_logs.pixelconfig_emptypixel_total_interval15_7d ;;


  dimension: day_date {
    type: date
    sql: DATE_PARSE(${TABLE}.date,'%Y%m%d') ;;
    label: "Date"
  }

  dimension_group: ts_trunc {
    #   description: "The date when each user last ordered"
     type: time
     timeframes: [date, week, month, year]
     sql: ${TABLE}.ts_trunc ;;
    label: "ts_trunc"
  }

  dimension: publisherorappid {
    type: string
    sql: ${TABLE}.publisherorappid ;;
    label: "Publisher or App ID"
  }

  measure: publisherorappid_fires {
    type: sum
    sql: ${TABLE}.publisherorappid_fires ;;
    label: "Publisher or App ID Fires"
  }

  measure: uuid_fires {
    type: sum
    sql: ${TABLE}.uuid_fires ;;
    label: "UUID Fires"
  }

  measure: lidid_fires {
    type: sum
    sql: ${TABLE}.lidid_fires ;;
    label: "IIDID Fires"
  }

  measure: md5_fires {
    type: sum
    sql: ${TABLE}.md5_fires ;;
    label: "MD5 Fires"
  }

  measure: sha1_fires {
    type: sum
    sql: ${TABLE}.sha1_fires ;;
    label: "SHA1 Fires"
  }

  measure: sha2_fires {
    type: sum
    sql: ${TABLE}.sha2_fires ;;
    label: "SHA2 Fires"
  }

  measure: bidderuuid_fires {
    type: sum
    sql: ${TABLE}.bidderuuid_fires ;;
    label: "Bidder UUID Fires"
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

# view: auto_logs_pixelconfig_emptypixel_total_interval15_7d {
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
