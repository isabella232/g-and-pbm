view: mapping_type_performance {
  sql_table_name: berlin.mapping_type_performance ;;
  suggestions: no

  dimension: active_hashes {
    type: number
    sql: ${TABLE}.active_hashes ;;
  }

  dimension: advertiser_spent {
    type: number
    sql: ${TABLE}.advertiser_spent ;;
  }

  dimension: bid_price {
    type: number
    sql: ${TABLE}.bid_price ;;
  }

  dimension: campaign_id {
    type: number
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: click_probability_ {
    type: number
    sql: ${TABLE}."click_probability " ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}.clicks ;;
  }

  dimension: conversion_probability {
    type: number
    sql: ${TABLE}.conversion_probability ;;
  }

  dimension: conversions {
    type: number
    sql: ${TABLE}.conversions ;;
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

  dimension: impressions {
    type: number
    sql: ${TABLE}.impressions ;;
  }

  dimension: line_item_id {
    type: number
    sql: ${TABLE}.line_item_id ;;
  }

  dimension: score {
    type: number
    sql: ${TABLE}.score ;;
  }

  dimension: segment_hashes {
    type: number
    sql: ${TABLE}.segment_hashes ;;
  }

  dimension: segment_id {
    type: number
    sql: ${TABLE}.segment_id ;;
  }

  dimension: upa {
    type: number
    sql: ${TABLE}.upa ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
