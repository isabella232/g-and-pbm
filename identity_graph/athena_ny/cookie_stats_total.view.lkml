view: cookie_stats_total {

  derived_table:
  {
      sql:

      select
      'partner_cookie_stats' as source,
      fact.date_p,
      sum(fact.totalcount) /1000000000 as total_count


      from auto_dmps.partner_cookie_stats fact
      group by 1,2
      having sum(fact.totalcount)>0


      UNION ALL

      select
      'maid_stats' as source,
      fact.date_p,
      sum(fact.totalcount) /1000000000 as total_count


      from auto_dmps.maid_stats fact
      group by 1,2
      having sum(fact.totalcount)>0

      UNION ALL

      select
      'lidid_stats' as source,
      fact.date_p,
      sum(fact.totalcount) /1000000000 as total_count

      from auto_dmps.lidid_stats fact
      group by 1,2
      having sum(fact.totalcount)>0

      UNION ALL

      select
      'fpc_stats' as source,
      fact.date_p,
      sum(fact.totalcount) /1000000000 as total_count


      from auto_dmps.fpc_stats fact
      group by 1,2
      having sum(fact.totalcount)>0

      UNION ALL

      select
      'scraped_fpc_stats' as source,
      fact.date_p,
      sum(fact.totalcount) /1000000000 as total_count


      from auto_dmps.scraped_fpc_stats fact
      group by 1,2
      having sum(fact.totalcount)>0

      UNION ALL

      select
      'li_domain_ulid_stats' as source,
      fact.date_p,
      sum(fact.totalcount) /1000000000 as total_count


      from auto_dmps.li_domain_ulid_stats fact
      group by 1,2
      having sum(fact.totalcount)>0

      ;;
   }

  dimension: day_date {
    type: date
    sql: DATE_PARSE(${TABLE}.date_p,'%Y%m%d') ;;
    label: "Date"
  }



  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
    label: "Source"
  }

  measure: totalcount {
    type: sum
    sql: ${TABLE}.total_count ;;
    label: "Total Count in Billions"
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

# view: cookie_stats_total {
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
