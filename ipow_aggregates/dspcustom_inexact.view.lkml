view: dspcustom_inexact {
  sql_table_name: auto_dspaggregates.dspcustom_inexact ;;
  suggestions: no

  dimension: adomain {
    type: string
    sql: ${TABLE}.adomain ;;
  }

  dimension: adv_media_group {
    type: string
    sql: ${TABLE}.adv_media_group ;;
  }

  dimension: adv_payout {
    type: number
    sql: ${TABLE}.adv_payout ;;
  }

  dimension: adv_payout_variance {
    type: number
    sql: ${TABLE}.adv_payout_variance ;;
  }

  dimension: advertiser_id {
    type: string
    sql: ${TABLE}.advertiser_id ;;
  }

  dimension: age {
    type: string
    sql: ${TABLE}.age ;;
  }

  dimension: anomaly_segment {
    type: string
    sql: ${TABLE}.anomaly_segment ;;
  }

  dimension: attrib_calculated_upa {
    type: number
    sql: ${TABLE}.attrib_calculated_upa ;;
  }

  dimension: attrib_calculated_upa_variance {
    type: number
    sql: ${TABLE}.attrib_calculated_upa_variance ;;
  }

  dimension: attrib_pc_conversions {
    type: number
    sql: ${TABLE}.attrib_pc_conversions ;;
  }

  dimension: attrib_pc_conversions_variance {
    type: number
    sql: ${TABLE}.attrib_pc_conversions_variance ;;
  }

  dimension: attrib_upa_pcc_intermediate {
    type: number
    sql: ${TABLE}.attrib_upa_pcc_intermediate ;;
  }

  dimension: attrib_upa_pcc_intermediate_variance {
    type: number
    sql: ${TABLE}.attrib_upa_pcc_intermediate_variance ;;
  }

  dimension: attrib_upa_pvc_final {
    type: number
    sql: ${TABLE}.attrib_upa_pvc_final ;;
  }

  dimension: attrib_upa_pvc_final_variance {
    type: number
    sql: ${TABLE}.attrib_upa_pvc_final_variance ;;
  }

  dimension: attrib_upa_pvc_intermediate {
    type: number
    sql: ${TABLE}.attrib_upa_pvc_intermediate ;;
  }

  dimension: attrib_upa_pvc_intermediate_variance {
    type: number
    sql: ${TABLE}.attrib_upa_pvc_intermediate_variance ;;
  }

  dimension: bid_from_imp_log {
    type: number
    sql: ${TABLE}.bid_from_imp_log ;;
  }

  dimension: bid_from_imp_log_variance {
    type: number
    sql: ${TABLE}.bid_from_imp_log_variance ;;
  }

  dimension: bids {
    type: number
    sql: ${TABLE}.bids ;;
  }

  dimension: bids_variance {
    type: number
    sql: ${TABLE}.bids_variance ;;
  }

  dimension: calculated_upa {
    type: number
    sql: ${TABLE}.calculated_upa ;;
  }

  dimension: calculated_upa_variance {
    type: number
    sql: ${TABLE}.calculated_upa_variance ;;
  }

  dimension: campaign_id {
    type: string
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}.clicks ;;
  }

  dimension: clicks_variance {
    type: number
    sql: ${TABLE}.clicks_variance ;;
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

  dimension: decisions_variance {
    type: number
    sql: ${TABLE}.decisions_variance ;;
  }

  dimension: demand_fee {
    type: number
    sql: ${TABLE}.demand_fee ;;
  }

  dimension: demand_fee_variance {
    type: number
    sql: ${TABLE}.demand_fee_variance ;;
  }

  dimension: demand_type {
    type: string
    sql: ${TABLE}.demand_type ;;
  }

  dimension: dev_maker {
    type: string
    sql: ${TABLE}.dev_maker ;;
  }

  dimension: dev_type {
    type: string
    sql: ${TABLE}.dev_type ;;
  }

  dimension: dma {
    type: string
    sql: ${TABLE}.dma ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: geo2_country {
    type: string
    sql: ${TABLE}.geo2_country ;;
  }

  dimension: geo2_country_sub1_sub2 {
    type: string
    sql: ${TABLE}.geo2_country_sub1_sub2 ;;
  }

  dimension: impressions_total {
    type: number
    sql: ${TABLE}.impressions_total ;;
  }

  dimension: impressions_total_variance {
    type: number
    sql: ${TABLE}.impressions_total_variance ;;
  }

  dimension: insertion_order_id {
    type: string
    sql: ${TABLE}.insertion_order_id ;;
  }

  dimension: lang {
    type: string
    sql: ${TABLE}.lang ;;
  }

  dimension: li_publisher_cat {
    type: string
    sql: ${TABLE}.li_publisher_cat ;;
  }

  dimension: li_publisher_id {
    type: string
    sql: ${TABLE}.li_publisher_id ;;
  }

  dimension: li_site_cat {
    type: string
    sql: ${TABLE}.li_site_cat ;;
  }

  dimension: li_site_id {
    type: string
    sql: ${TABLE}.li_site_id ;;
  }

  dimension: line_item_id {
    type: string
    sql: ${TABLE}.line_item_id ;;
  }

  dimension: list_id {
    type: string
    sql: ${TABLE}.list_id ;;
  }

  dimension: mail_type {
    type: string
    sql: ${TABLE}.mail_type ;;
  }

  dimension: metro {
    type: string
    sql: ${TABLE}.metro ;;
  }

  dimension: nbrowser {
    type: string
    sql: ${TABLE}.nbrowser ;;
  }

  dimension: nbrowser_version {
    type: string
    sql: ${TABLE}.nbrowser_version ;;
  }

  dimension: nobids {
    type: number
    sql: ${TABLE}.nobids ;;
  }

  dimension: nobids_variance {
    type: number
    sql: ${TABLE}.nobids_variance ;;
  }

  dimension: os {
    type: string
    sql: ${TABLE}.os ;;
  }

  dimension: os_version {
    type: string
    sql: ${TABLE}.os_version ;;
  }

  dimension: page_domain {
    type: string
    sql: ${TABLE}.page_domain ;;
  }

  dimension: pc_conversion_delay_bucket {
    type: string
    sql: ${TABLE}.pc_conversion_delay_bucket ;;
  }

  dimension: pc_conversions {
    type: number
    sql: ${TABLE}.pc_conversions ;;
  }

  dimension: pc_conversions_variance {
    type: number
    sql: ${TABLE}.pc_conversions_variance ;;
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

  dimension: pv_conversions_variance {
    type: number
    sql: ${TABLE}.pv_conversions_variance ;;
  }

  dimension: redecision_attempt {
    type: string
    sql: ${TABLE}.redecision_attempt ;;
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

  dimension: upa_pcc_intermediate_variance {
    type: number
    sql: ${TABLE}.upa_pcc_intermediate_variance ;;
  }

  dimension: upa_pvc_final {
    type: number
    sql: ${TABLE}.upa_pvc_final ;;
  }

  dimension: upa_pvc_final_variance {
    type: number
    sql: ${TABLE}.upa_pvc_final_variance ;;
  }

  dimension: upa_pvc_intermediate {
    type: number
    sql: ${TABLE}.upa_pvc_intermediate ;;
  }

  dimension: upa_pvc_intermediate_variance {
    type: number
    sql: ${TABLE}.upa_pvc_intermediate_variance ;;
  }

  dimension: user_segments {
    type: string
    sql: ${TABLE}.user_segments ;;
  }

  dimension: user_timezone_offset {
    type: string
    sql: ${TABLE}.user_timezone_offset ;;
  }

  dimension: visibility {
    type: string
    sql: ${TABLE}.visibility ;;
  }

  dimension: winner_price {
    type: number
    sql: ${TABLE}.winner_price ;;
  }

  dimension: winner_price_variance {
    type: number
    sql: ${TABLE}.winner_price_variance ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
