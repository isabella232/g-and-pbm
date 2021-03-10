view: rtb_mapping_type_performance_cohorts {
  sql_table_name: dsa.rtb_mapping_type_performance_cohorts ;;

  dimension: mapping_type_x {
    type: string
    sql: ${TABLE}.mapping_type_x ;;
  }

  dimension: mapping_type_y {
    type: string
    sql: ${TABLE}.mapping_type_y ;;
  }

  dimension: publisher_id {
    type: number
    sql: ${TABLE}.publisher_id ;;
  }

  dimension_group: event {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.event_date ;;
  }

  measure: audience {
    type: sum
    sql: ${TABLE}.audience ;;
    group_label: "Summations"
  }

  measure: bid_price_sum_hidden {
    type: sum
    sql: ${TABLE}.bid_price_sum ;;
    hidden: yes
  }

  measure: clicks {
    type: sum
    sql: ${TABLE}.clicks ;;
    group_label: "Summations"
  }

  measure: gross_revenue {
    type: sum
    sql: ${TABLE}.gross_revenue_sum ;;
    group_label: "Summations"
  }

  measure: impressions {
    type: sum
    sql: ${TABLE}.impressions ;;
    group_label: "Summations"
  }

  measure: gross_ecpm {
    type: number
    sql: ${gross_revenue}/NULLIF(${impressions},0)::FLOAT * 1000 ;;
    value_format_name: usd
  }

  measure: click_through_rate {
    type: number
    sql: ${clicks}/NULLIF(${impressions},0)::FLOAT ;;
    value_format_name: percent_2
  }
}
