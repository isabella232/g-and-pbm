view: parter_cookie_stats_domain
{
  derived_table:
  {
    sql:
      with total_counts as
        (


        select
        a.domain,
        a.month_day,
        a.totalcount

        from
        (
        select
        fact.domain,
        DATE_TRUNC('month',DATE(PARSE_DATETIME(fact.date_p,'yyyyMMdd'))) as month_day,
        max(fact.totalcount) as totalcount

        from auto_dmps.partner_cookie_stats fact
        where DATE_TRUNC('day',PARSE_DATETIME(fact.date_p,'yyyyMMdd')) BETWEEN current_date - interval '365' day AND current_date
        group by 1,2
        having sum(fact.totalcount)>0
        ) a
        group by 1,2,3
        )



        select
        b.domain,
        b.max_date,
        b.min_date,
        x.totalcount as latest_month_max,
        n.totalcount as earliest_month_max

        from
        (
        select
        date_sub.domain as domain,
        max(date_sub.month_day) as max_date,
        min(date_sub.month_day) as min_date
        from total_counts date_sub
        group by 1
        ) b
        left join total_counts x on b.domain = x.domain and b.max_date = x.month_day
        left join total_counts n on b.domain = n.domain and b.min_date = n.month_day

      ;;
  }

  dimension: domain {
    type: string
    sql: ${TABLE}.domain ;;
    label: "Domain"
  }


  dimension: max_date {
    type: date
    sql: DATE_PARSE(${TABLE}.max_date,'%Y%m%d') ;;
    label: "Latest Sync Date"
  }

  dimension: min_date {
    type: date
    sql: DATE_PARSE(${TABLE}.min_date,'%Y%m%d') ;;
    label: "Earliest Sync Date"
  }


  measure: latest_month_max {
    type: sum
    sql: ${TABLE}.latest_month_max ;;
    label: "Latest Month Total Count"
  }

  measure: earliest_month_max {
    type: sum
    sql: ${TABLE}.earliest_month_max ;;
    label: "Earliest Month Total Count"
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
