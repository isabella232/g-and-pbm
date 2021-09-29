view: sspcustom_inexact {
  sql_table_name: auto_sspaggregates.sspcustom_inexact ;;
  suggestions: no

  dimension: actual_dsp_fee {
    type: number
    sql: ${TABLE}.actual_dsp_fee ;;
  }

  dimension: actual_dsp_fee_variance {
    type: number
    sql: ${TABLE}.actual_dsp_fee_variance ;;
  }

  dimension: actual_pgm_fee {
    type: number
    sql: ${TABLE}.actual_pgm_fee ;;
  }

  dimension: actual_pgm_fee_variance {
    type: number
    sql: ${TABLE}.actual_pgm_fee_variance ;;
  }

  dimension: actual_ssp_fee {
    type: number
    sql: ${TABLE}.actual_ssp_fee ;;
  }

  dimension: actual_ssp_fee_variance {
    type: number
    sql: ${TABLE}.actual_ssp_fee_variance ;;
  }

  dimension: adomain {
    type: string
    sql: ${TABLE}.adomain ;;
  }

  dimension: adv_media_group {
    type: string
    sql: ${TABLE}.adv_media_group ;;
  }

  dimension: advertiser_id {
    type: string
    sql: ${TABLE}.advertiser_id ;;
  }

  dimension: advertiser_spent {
    type: number
    sql: ${TABLE}.advertiser_spent ;;
  }

  dimension: advertiser_spent_variance {
    type: number
    sql: ${TABLE}.advertiser_spent_variance ;;
  }

  dimension: age {
    type: string
    sql: ${TABLE}.age ;;
  }

  dimension: attrib_conversions {
    type: number
    sql: ${TABLE}.attrib_conversions ;;
  }

  dimension: attrib_conversions_variance {
    type: number
    sql: ${TABLE}.attrib_conversions_variance ;;
  }

  dimension: attributed_calculated_upa {
    type: number
    sql: ${TABLE}.attributed_calculated_upa ;;
  }

  dimension: attributed_calculated_upa_variance {
    type: number
    sql: ${TABLE}.attributed_calculated_upa_variance ;;
  }

  dimension: bid_price {
    type: number
    sql: ${TABLE}.bid_price ;;
  }

  dimension: bid_price_variance {
    type: number
    sql: ${TABLE}.bid_price_variance ;;
  }

  dimension: bidder_id {
    type: string
    sql: ${TABLE}.bidder_id ;;
  }

  dimension: bidder_seat {
    type: string
    sql: ${TABLE}.bidder_seat ;;
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

  dimension: conversions {
    type: number
    sql: ${TABLE}.conversions ;;
  }

  dimension: conversions_variance {
    type: number
    sql: ${TABLE}.conversions_variance ;;
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

  dimension: deal_id {
    type: string
    sql: ${TABLE}.deal_id ;;
  }

  dimension: decisions {
    type: number
    sql: ${TABLE}.decisions ;;
  }

  dimension: decisions_variance {
    type: number
    sql: ${TABLE}.decisions_variance ;;
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

  dimension: domain {
    type: string
    sql: ${TABLE}.domain ;;
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

  dimension: impressions {
    type: number
    sql: ${TABLE}.impressions ;;
  }

  dimension: impressions_variance {
    type: number
    sql: ${TABLE}.impressions_variance ;;
  }

  dimension: insertion_order_id {
    type: string
    sql: ${TABLE}.insertion_order_id ;;
  }

  dimension: isp {
    type: string
    sql: ${TABLE}.isp ;;
  }

  dimension: key_values {
    type: string
    sql: ${TABLE}.key_values ;;
  }

  dimension: lang {
    type: string
    sql: ${TABLE}.lang ;;
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

  dimension: noads {
    type: number
    sql: ${TABLE}.noads ;;
  }

  dimension: noads_variance {
    type: number
    sql: ${TABLE}.noads_variance ;;
  }

  dimension: os {
    type: string
    sql: ${TABLE}.os ;;
  }

  dimension: os_version {
    type: string
    sql: ${TABLE}.os_version ;;
  }

  dimension: placement_id {
    type: string
    sql: ${TABLE}.placement_id ;;
  }

  dimension: pricing_type {
    type: string
    sql: ${TABLE}.pricing_type ;;
  }

  dimension: pub_media_group {
    type: string
    sql: ${TABLE}.pub_media_group ;;
  }

  dimension: publisher_categories {
    type: string
    sql: ${TABLE}.publisher_categories ;;
  }

  dimension: publisher_id {
    type: string
    sql: ${TABLE}.publisher_id ;;
  }

  dimension: publisher_revenue {
    type: number
    sql: ${TABLE}.publisher_revenue ;;
  }

  dimension: publisher_revenue_variance {
    type: number
    sql: ${TABLE}.publisher_revenue_variance ;;
  }

  dimension: pvc {
    type: number
    sql: ${TABLE}.pvc ;;
  }

  dimension: pvc_variance {
    type: number
    sql: ${TABLE}.pvc_variance ;;
  }

  dimension: res_bid_cid {
    type: string
    sql: ${TABLE}.res_bid_cid ;;
  }

  dimension: second_price {
    type: number
    sql: ${TABLE}.second_price ;;
  }

  dimension: second_price_variance {
    type: number
    sql: ${TABLE}.second_price_variance ;;
  }

  dimension: section_id {
    type: string
    sql: ${TABLE}.section_id ;;
  }

  dimension: segments {
    type: string
    sql: ${TABLE}.segments ;;
  }

  dimension: size {
    type: string
    sql: ${TABLE}.size ;;
  }

  dimension: template_categories {
    type: string
    sql: ${TABLE}.template_categories ;;
  }

  dimension: template_id {
    type: string
    sql: ${TABLE}.template_id ;;
  }

  dimension: timezone_offset {
    type: string
    sql: ${TABLE}.timezone_offset ;;
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
