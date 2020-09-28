view: dspcustom_exact {
  sql_table_name: auto_dspaggregates.dspcustom_exact ;;
  suggestions: no

  dimension: adv_media_group {
    type: string
    sql: ${TABLE}.adv_media_group ;;
  }

  dimension: adv_payout {
    type: number
    sql: ${TABLE}.adv_payout ;;
  }

  dimension: advertiser_id {
    type: string
    sql: ${TABLE}.advertiser_id ;;
  }

  dimension: anomaly_clicks_filtered {
    type: number
    sql: ${TABLE}.anomaly_clicks_filtered ;;
  }

  dimension: attrib_calculated_upa {
    type: number
    sql: ${TABLE}.attrib_calculated_upa ;;
  }

  dimension: attrib_pc_conversions {
    type: number
    sql: ${TABLE}.attrib_pc_conversions ;;
  }

  dimension: attrib_upa_pcc_intermediate {
    type: number
    sql: ${TABLE}.attrib_upa_pcc_intermediate ;;
  }

  dimension: attrib_upa_pvc_final {
    type: number
    sql: ${TABLE}.attrib_upa_pvc_final ;;
  }

  dimension: attrib_upa_pvc_intermediate {
    type: number
    sql: ${TABLE}.attrib_upa_pvc_intermediate ;;
  }

  dimension: bid_from_imp_log {
    type: number
    sql: ${TABLE}.bid_from_imp_log ;;
  }

  dimension: calculated_upa {
    type: number
    sql: ${TABLE}.calculated_upa ;;
  }

  dimension: campaign_id {
    type: string
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: campaign_type {
    type: string
    sql: ${TABLE}.campaign_type ;;
  }

  dimension: click_prob {
    type: number
    sql: ${TABLE}.click_prob ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}.clicks ;;
  }

  dimension: creative_id {
    type: string
    sql: ${TABLE}.creative_id ;;
  }

  dimension: date {
    type: string
    sql: ${TABLE}."date" ;;
  }

  dimension: date_p {
    type: string
    sql: ${TABLE}.date_p ;;
  }

  dimension: decisions {
    type: number
    sql: ${TABLE}.decisions ;;
  }

  dimension: demand_fee {
    type: number
    sql: ${TABLE}.demand_fee ;;
  }

  dimension: demand_type {
    type: string
    sql: ${TABLE}.demand_type ;;
  }

  dimension: impressions_total {
    type: number
    sql: ${TABLE}.impressions_total ;;
  }

  dimension: insertion_order_id {
    type: string
    sql: ${TABLE}.insertion_order_id ;;
  }

  dimension: li_publisher_id {
    type: string
    sql: ${TABLE}.li_publisher_id ;;
  }

  dimension: li_site_id {
    type: string
    sql: ${TABLE}.li_site_id ;;
  }

  dimension: line_item_id {
    type: string
    sql: ${TABLE}.line_item_id ;;
  }

  dimension: mail_type {
    type: string
    sql: ${TABLE}.mail_type ;;
  }

  dimension: pc_conv_prob {
    type: number
    sql: ${TABLE}.pc_conv_prob ;;
  }

  dimension: pc_conversion_delay_bucket {
    type: string
    sql: ${TABLE}.pc_conversion_delay_bucket ;;
  }

  dimension: pc_conversions {
    type: number
    sql: ${TABLE}.pc_conversions ;;
  }

  dimension: pub_media_group {
    type: string
    sql: ${TABLE}.pub_media_group ;;
  }

  dimension: pv_conversion_delay_bucket {
    type: string
    sql: ${TABLE}.pv_conversion_delay_bucket ;;
  }

  dimension: pv_conversions {
    type: number
    sql: ${TABLE}.pv_conversions ;;
  }

  dimension: section_id {
    type: string
    sql: ${TABLE}.section_id ;;
  }

  dimension: seller_network {
    type: string
    sql: ${TABLE}.seller_network ;;
  }

  dimension: size {
    type: string
    sql: ${TABLE}.size ;;
  }

  dimension: strategy_id {
    type: string
    sql: ${TABLE}.strategy_id ;;
  }

  dimension: upa_pcc_intermediate {
    type: number
    sql: ${TABLE}.upa_pcc_intermediate ;;
  }

  dimension: upa_pvc_final {
    type: number
    sql: ${TABLE}.upa_pvc_final ;;
  }

  dimension: upa_pvc_intermediate {
    type: number
    sql: ${TABLE}.upa_pvc_intermediate ;;
  }

  dimension: winner_price {
    type: number
    sql: ${TABLE}.winner_price ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
