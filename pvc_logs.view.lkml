view: pvc_view {
  derived_table: {
    sql:SELECT
conversion_time,
impression_time,
advertiser_id,
campaign_id,
line_item_id,
order_id,
upa,
conversion_window,
conversion_type
FROM (
SELECT
conversion_time,
impression_time,
advertiser_id,
campaign_id,
line_item_id,
order_id,
upa,
conversion_window,
conversion_type
FROM (
SELECT
PARSE_DATETIME('%F %T', root.request.datetime) conversion_time,
PARSE_DATETIME('%F %T', root.impression_dt) impression_time,
root.demand.advertiser_id advertiser_id,
root.demand.campaign_id campaign_id,
root.demand.line_item_id line_item_id,
root.order_id order_id,
root.upa upa,
"PCC" conversion_window,
"PCC" conversion_type
FROM
`elite-contact-671.userver_logs_dsp.conversion_*`
GROUP BY 1,2,3,4,5,6,7,8)
GROUP BY 1,2,3,4,5,6,7,8,9
UNION ALL
SELECT
conversion_time,
impression_time,
advertiser_id,
campaign_id,
line_item_id,
order_id,
upa,
conversion_window,
conversion_type
FROM (
SELECT
PARSE_DATETIME('%F %T', root.request.datetime) conversion_time,
PARSE_DATETIME('%F %T', root.impression_time)  impression_time,
root.demand.advertiser_id advertiser_id,
root.demand.campaign_id campaign_id,
root.demand.line_item_id line_item_id,
root.order_id order_id,
root.upa upa,
case when root.pvc_1h = 1 then "PVC within 1h" when root.pvc_24h = 1 then "PVC within 24h"
when root.pvc_72h = 1 then "PVC within 72h" when root.pvc_over_72h = 1 then "PVC over 72h" else "error" end as conversion_window,
"PVC" conversion_type
FROM
  `elite-contact-671.userver_logs_dsp.pv_conversion_*` pvc
INNER JOIN (
SELECT
root.bid.id bid_id,
root.request.datetime max_time
FROM
  `elite-contact-671.userver_logs_dsp.pv_conversion_*`
  GROUP BY 1,2) dt
ON pvc.root.bid.id = dt.bid_id
AND pvc.root.request.datetime = dt.max_time)
GROUP BY 1,2,3,4,5,6,7,8,9)
ORDER BY 1 ASC
             ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
    view_label: "Post View Conversions"
  }

  dimension: conversion_date {
    type: date
    sql: CAST(${TABLE}.conversion_time AS TIMESTAMP);;
    view_label: "Post View Conversions"
    group_label: "Order Metadata"
    label: "Conversion Date"
  }

  dimension_group: conversion {
    type: time
    timeframes: [time]
    sql:CAST(${TABLE}.conversion_time AS TIMESTAMP);;
    view_label: "Post View Conversions"
    label: "Conversion"
    group_label: "Order Metadata"
  }


  dimension: impression_date {
    type: date
    sql:CAST(${TABLE}.impression_time AS TIMESTAMP);;
    #sql: TIMESTAMP(${TABLE}.impression_time) ;;
    view_label: "Post View Conversions"
    label: "Impression Date"
    group_label: "Order Metadata"
  }

  dimension_group: impression {
    type: time
    timeframes: [time]
    sql:CAST(${TABLE}.impression_time AS TIMESTAMP);;
    view_label: "Post View Conversions"
    label: "Impression"
    group_label: "Order Metadata"
  }

  dimension: advertiser_id {
    type: number
    sql: ${TABLE}.advertiser_id ;;
    view_label:  "Post View Conversions"
    group_label: "Demand Metadata"
  }

  dimension: campaign_id {
    type: number
    sql: ${TABLE}.campaign_id ;;
    view_label:  "Post View Conversions"
    group_label: "Demand Metadata"
  }

  dimension: line_item_id {
    type: number
    sql: ${TABLE}.line_item_id ;;
    view_label:  "Post View Conversions"
    group_label: "Demand Metadata"
  }

  dimension: order_id {
    type: string
    sql: ${TABLE}.order_id ;;
    view_label: "Post View Conversions"
    group_label: "Order Metadata"
  }

  dimension: upa_hidden {
    type: number
    sql: ${TABLE}.upa ;;
    hidden: yes
  }

  measure: upa {
    type: sum
    sql: ${upa_hidden} ;;
    view_label: "Post View Conversions"
    group_label: "Order Metadata"
    label: "UPA"
    value_format_name: usd
  }

  dimension: conversion_window {
    type: string
    sql: ${TABLE}.conversion_window ;;
    view_label: "Post View Conversions"
    group_label: "Order Metadata"
  }

  dimension: conversion_type {
    type: string
    sql: ${TABLE}.conversion_type ;;
    view_label: "Post View Conversions"
    group_label: "Order Metadata"
  }

  set: detail {
    fields: [
      conversion_time,
      impression_time,
      advertiser_id,
      campaign_id,
      line_item_id,
      order_id,
      upa,
      conversion_window,
      conversion_type
    ]
  }
}
