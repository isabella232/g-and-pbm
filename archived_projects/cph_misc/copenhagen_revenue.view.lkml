view: copenhagen_revenue {

  derived_table: {
    sql: SELECT event_date, SUM(advertiser_spent) gross_revenue, SUM(publisher_revenue) net_revenue
          FROM ssp_logs.imp
          WHERE event_date BETWEEN DATE_TRUNC('year',CURRENT_DATE - INTERVAL '1' DAY) AND CURRENT_DATE - INTERVAL '1' DAY
          AND idaas_algo IS NOT NULL
          GROUP BY 1 ;;
  }

  dimension_group: event {
    type: time
    datatype: date
    sql: ${TABLE}.event_date ;;
    timeframes: [date,week,month,quarter,day_of_month,year]
  }

  measure: gross_revenue {
    type: sum
    sql: ${TABLE}.gross_revenue ;;
    value_format_name: usd
  }

  measure: net_revenue {
    type: sum
    sql: ${TABLE}.net_revenue ;;
    value_format_name: usd
  }

  measure: revenue_margin {
    type: number
    sql: ${gross_revenue} - ${net_revenue} ;;
    value_format_name: usd
  }
  }
