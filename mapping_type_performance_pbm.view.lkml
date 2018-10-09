view: mapping_type_performance_pbm {
  sql_table_name: berlin.mapping_type_performance ;;
  suggestions: no

  dimension: campaign_id {
    type: number
    sql: ${TABLE}.campaign_id ;;
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

  dimension: line_item_id {
    type: number
    sql: ${TABLE}.line_item_id ;;
  }

  dimension: mapping_type_score {
    type: number
    sql: CAST(${TABLE}.score AS DECIMAL(18,1)) ;;
  }

  dimension: algorithm {
    type: string
    sql: CASE WHEN ${mapping_type_score} = 0.9 THEN 'Deterministic'
              WHEN ${mapping_type_score} = 0.8 THEN 'Acc'
              WHEN ${mapping_type_score} = 0.7 THEN 'Accx'
              WHEN ${mapping_type_score} = 0.6 THEN '3m'
              WHEN ${mapping_type_score} = 0.5 THEN 'LRXD'
              WHEN ${mapping_type_score} = 0.3 THEN 'Max'
              WHEN ${mapping_type_score} = 0.1 THEN 'Home'
              WHEN ${mapping_type_score} = 0 THEN 'No algorithm used'
              ELSE NULL END;;
    description: "Algorithm used to create cookie-to-hash connection in segment"
  }

  dimension: segment_id {
    type: number
    sql: ${TABLE}.segment_id ;;
  }

  dimension: impressions_dimension {
    type: number
    sql: ${TABLE}.impressions ;;
    hidden: yes
  }

  dimension: is_active_segment {
    type: yesno
    sql: ${impressions_dimension} > 0 ;;
  }

  measure: impressions {
    type: sum
    sql: ${TABLE}.impressions ;;
    group_label: "Summations"
  }

  measure: segment_hashes {
    type: sum_distinct
    sql: ${TABLE}.segment_hashes ;;
    sql_distinct_key: ${segment_id} ;;
    group_label: "Summations"
  }

  measure: user_purchase_amount {
    type: sum
    sql: ${TABLE}.upa ;;
    group_label: "Summations"
  }

  measure: active_hashes {
    type: sum
    sql: ${TABLE}.active_hashes ;;
    group_label: "Summations"
  }

  measure: gross_revenue {
    type: sum
    sql: ${TABLE}.advertiser_spent ;;
    group_label: "Summations"
  }

  measure: bid_price {
    type: sum
    sql: ${TABLE}.bid_price ;;
    group_label: "Summations"
  }

  measure: click_probability {
    type: sum
    sql: ${TABLE}."click_probability " ;;
    group_label: "Summations"
  }

  measure: clicks {
    type: sum
    sql: ${TABLE}.clicks ;;
    group_label: "Summations"
  }

  measure: conversion_probability {
    type: sum
    sql: ${TABLE}.conversion_probability ;;
    group_label: "Summations"
  }

  measure: conversions {
    type: sum
    sql: ${TABLE}.conversions ;;
    group_label: "Summations"
  }

  measure: click_through_rate {
    type: number
    sql: ${clicks}/CAST(NULLIF(${impressions},0) AS REAL) ;;
    value_format_name: percent_2
    description: "Clicks ÷ Impressions"
  }

  measure: click_to_conversion_rate {
    type: number
    sql: ${conversions}/CAST(NULLIF(${clicks},0) AS REAL) ;;
    description: "Conversions ÷ Clicks"
    value_format_name: percent_2
  }

  measure: impression_to_conversion_rate {
    type: number
    sql: ${conversions}/CAST(NULLIF(${clicks},0) AS REAL) ;;
    description: "Conversions ÷ Impressions"
    value_format_name: percent_4
  }

  measure: return_on_ad_spend {
    type: number
    sql: ${user_purchase_amount} / CAST(NULLIF(${conversions},0) AS REAL) ;;
    value_format_name: usd
    description: "User Purchase Amount ÷ Conversions"
  }

  measure: cost_per_acquisition {
    type: number
    sql: ${gross_revenue} / CAST(NULLIF(${conversions},0) AS REAL) ;;
  }

  measure: count_algorithm {
    type: count_distinct
    sql: ${algorithm} ;;
    group_label: "Counts"
  }

  measure: count_segments {
    type: count_distinct
    sql: ${segment_id} ;;
    group_label: "Counts"
    filters: {
      field: impressions_dimension
      value: "> 0"
    }
  }
}
