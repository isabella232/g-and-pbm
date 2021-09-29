view: custom_aggregates_exact {
  sql_table_name: ssp_agg.custom_aggregates_exact ;;

  dimension: adv_media_group {
    type: number
    sql: ${TABLE}.adv_media_group ;;
  }

  dimension: advertiser_id {
    type: number
    sql: ${TABLE}.advertiser_id ;;
  }

  dimension: advertiser_spend {
    type: number
    sql: ${TABLE}.advertiser_spend ;;
  }

  dimension: anomaly_clicks {
    type: number
    sql: ${TABLE}.anomaly_clicks ;;
  }

  dimension: anomaly_conversions_filtered {
    type: number
    sql: ${TABLE}.anomaly_conversions_filtered ;;
  }

  dimension: anomaly_decisions {
    type: number
    sql: ${TABLE}.anomaly_decisions ;;
  }

  dimension: attrib_pc_conversions {
    type: number
    sql: ${TABLE}.attrib_pc_conversions ;;
  }

  dimension: attrib_upa {
    type: number
    sql: ${TABLE}.attrib_upa ;;
  }

  dimension: avg_won_bid_cpm {
    type: number
    sql: ${TABLE}.avg_won_bid_cpm ;;
  }

  dimension: bid_price {
    type: number
    sql: ${TABLE}.bid_price ;;
  }

  dimension: bidder_campaign_id {
    type: string
    sql: ${TABLE}.bidder_campaign_id ;;
  }

  dimension: bidder_id {
    type: number
    sql: ${TABLE}.bidder_id ;;
  }

  dimension: bidder_seat {
    type: string
    sql: ${TABLE}.bidder_seat ;;
  }

  dimension: campaign_id {
    type: number
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: campaign_type {
    type: string
    sql: ${TABLE}.campaign_type ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}.clicks ;;
  }

  dimension: conversions {
    type: number
    sql: ${TABLE}.conversions ;;
  }

  dimension: creative_id {
    type: number
    sql: ${TABLE}.creative_id ;;
  }

  dimension: deal_id {
    type: string
    sql: ${TABLE}.deal_id ;;
  }

  dimension: decisions {
    type: number
    sql: ${TABLE}.decisions ;;
  }

  dimension: demand_type {
    type: string
    sql: ${TABLE}.demand_type ;;
  }

  dimension: dsp_fee_due {
    type: number
    sql: ${TABLE}.dsp_fee_due ;;
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

  dimension: expected_clicks {
    type: number
    sql: ${TABLE}.expected_clicks ;;
  }

  dimension: expected_conversions {
    type: number
    sql: ${TABLE}.expected_conversions ;;
  }

  dimension: expected_payout {
    type: number
    sql: ${TABLE}.expected_payout ;;
  }

  dimension: first_impressions {
    type: number
    sql: ${TABLE}.first_impressions ;;
  }

  dimension: iab_flag {
    type: string
    sql: ${TABLE}.iab_flag ;;
  }

  dimension: impressions {
    type: number
    sql: ${TABLE}.impressions ;;
  }

  dimension: insertion_order_id {
    type: number
    sql: ${TABLE}.insertion_order_id ;;
  }

  dimension: line_item_id {
    type: number
    sql: ${TABLE}.line_item_id ;;
  }

  dimension: mail_type {
    type: string
    sql: ${TABLE}.mail_type ;;
  }

  dimension: noads {
    type: number
    sql: ${TABLE}.noads ;;
  }

  dimension: opens {
    type: number
    sql: ${TABLE}.opens ;;
  }

  dimension: pricing_type {
    type: string
    sql: ${TABLE}.pricing_type ;;
  }

  dimension: primary_key {
    type: number
    sql: ${TABLE}.primary_key ;;
  }

  dimension: programmatic_fee_due {
    type: number
    sql: ${TABLE}.programmatic_fee_due ;;
  }

  dimension: pub_media_group {
    type: number
    sql: ${TABLE}.pub_media_group ;;
  }

  dimension: publisher_id {
    type: number
    sql: ${TABLE}.publisher_id ;;
  }

  dimension: publisher_revenue {
    type: number
    sql: ${TABLE}.publisher_revenue ;;
  }

  dimension: pvc {
    type: number
    sql: ${TABLE}.pvc ;;
  }

  dimension: second_price {
    type: number
    sql: ${TABLE}.second_price ;;
  }

  dimension: section_id {
    type: number
    sql: ${TABLE}.section_id ;;
  }

  dimension: size {
    type: string
    sql: ${TABLE}.size ;;
  }

  dimension: ssp_fee_due {
    type: number
    sql: ${TABLE}.ssp_fee_due ;;
  }

  dimension: template_id {
    type: number
    sql: ${TABLE}.template_id ;;
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
