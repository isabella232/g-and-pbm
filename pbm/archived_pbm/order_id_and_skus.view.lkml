view: order_id_and_skus {
  derived_table: {
    sql: SELECT a.*, r.items.field0 content, r.items.field1 content_cost
      FROM "berlin"."conversion_contexts" a
      CROSS JOIN UNNEST(zip(regexp_split(content_id,','), regexp_split(content_amount,','))) AS r (items)
       ;;
  }

  suggestions: no

  dimension: event_timestamp {
    type: date_time
    sql: DATE_PARSE(${TABLE}.event_timestamp,'%Y-%m-%dT%T.%fZ') ;;
    datatype: timestamp
    hidden: yes
  }

  dimension: event_id {
    type: string
    sql: ${TABLE}.event_id ;;
    hidden: yes
  }

  dimension: app_id {
    type: string
    sql: ${TABLE}.app_id ;;
  }

  dimension: advertiser_id {
    type: string
    sql: ${TABLE}.advertiser_id ;;
  }

  dimension: lidid {
    type: string
    sql: ${TABLE}.lidid ;;
    hidden: yes
  }

  dimension: conversion_id {
    type: string
    sql: ${TABLE}.conversion_id ;;
    hidden: yes
  }

  dimension: remarketing_conversion_id {
    type: string
    sql: ${TABLE}.remarketing_conversion_id ;;
    hidden: yes
  }

  dimension: transaction_amount {
    type: number
    sql: ${TABLE}.transaction_amount ;;
  }

  dimension: transaction_id {
    type: string
    sql: ${TABLE}.transaction_id ;;
  }

  dimension: content_id_hidden {
    type: string
    sql: ${TABLE}.content_id ;;
    hidden: yes
  }

  dimension: content_amount_hidden {
    type: string
    sql: ${TABLE}.content_amount ;;
    hidden: yes
  }

  dimension: year {
    type: string
    sql: ${TABLE}."year" ;;
    hidden: yes
  }

  dimension: month {
    type: string
    sql: ${TABLE}."month" ;;
    hidden: yes
  }

  dimension: day {
    type: string
    sql: ${TABLE}."day" ;;
    hidden: yes
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
    sql: CAST(CONCAT(${year},'-',${month},'-',${day}) as date) ;;
  }

  dimension: content_id {
    type: string
    sql: ${TABLE}.content ;;
  }

  dimension: content_cost_hidden {
    type: number
    sql: CAST(NULLIF(${TABLE}.content_cost,'') AS real) ;;
    hidden: yes
  }

  dimension: items_in_transaction {
    type: number
    sql: CARDINALITY(SPLIT(${content_id_hidden},',')) ;;
  }

  dimension: primary_key {
    type: string
    sql: CONCAT(${event_timestamp},${event_id}) ;;
    primary_key: yes
    hidden: yes
  }

  # measure

  measure: purchased_item_value {
    type: sum
    sql: ${content_cost_hidden} ;;
    value_format_name: usd
  }

  measure: final_transaction_value {
    type: sum_distinct
    sql: ${transaction_amount} ;;
    value_format_name: usd
    hidden: yes
  }

  measure: purchased_items {
    type: count
  }

  measure: transactions {
    type: count_distinct
    sql: ${primary_key} ;;
  }

  measure: average_purchased_item_value {
    type: number
    sql: ${purchased_item_value}/CAST(NULLIF(${purchased_items},0) AS REAL) ;;
    value_format_name: usd
  }

  measure: average_transaction_value {
    type: number
    sql: ${purchased_item_value}/CAST(NULLIF(${transactions},0) AS REAL) ;;
    value_format_name: usd
  }

  measure: average_items_per_transaction {
    type: number
    sql: ${purchased_items}/CAST(NULLIF(${transactions},0) AS REAL) ;;
    value_format_name: decimal_1
  }

}
