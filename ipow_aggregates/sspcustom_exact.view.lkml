view: sspcustom_exact {
  sql_table_name: auto_sspaggregates.sspcustom_exact ;;
  suggestions: no

  dimension: primary_key {
    type: string
    sql: CONCAT("date", size, deal_id, creative_id, section_id, line_item_id, res_bid_cid, demand_type, CAST(attrib_conversions <> 0 as VARCHAR)) ;;
    primary_key: yes
    hidden: yes
  }

  dimension: actual_dsp_fee {
    type: number
    sql: ${TABLE}.actual_dsp_fee ;;
    hidden: yes
  }

  measure: actual_dsp_fee_sum {
    type: sum
    sql: ${actual_dsp_fee} ;;
    group_label: "Summations"
    group_item_label: "DSP Fee"
  }

  dimension: actual_pgm_fee {
    type: number
    sql: ${TABLE}.actual_pgm_fee ;;
    hidden: yes
  }

  measure: actual_pgm_fee_sum {
    type: sum
    sql: ${actual_pgm_fee} ;;
    group_label: "Summations"
    group_item_label: "PGM Fee"
  }

  dimension: actual_ssp_fee {
    type: number
    sql: ${TABLE}.actual_ssp_fee ;;
    hidden: yes
  }

  measure: actual_ssp_fee_sum {
    type: sum
    sql: ${actual_ssp_fee} ;;
    group_label: "Summations"
    group_item_label: "SSP Fee"
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
    hidden: yes
  }

  measure: advertiser_spent_sum {
    type: sum
    sql: ${advertiser_spent} ;;
    group_label: "Summations"
    group_item_label: "Gross Revenue"
  }

  dimension: anomaly_clicks_filtered {
    type: number
    sql: ${TABLE}.anomaly_clicks_filtered ;;
    hidden: yes
  }

  measure: anomaly_clicks_filtered_sum {
    type: sum
    sql: ${anomaly_clicks_filtered} ;;
    group_label: "Summations"
    group_item_label: "Filtered Anomaly Clicks"
  }

  dimension: anomaly_conversions_filtered {
    type: number
    sql: ${TABLE}.anomaly_conversions_filtered ;;
    hidden: yes
  }

  measure: anomaly_conversions_filtered_sum {
    type: sum
    sql: ${anomaly_conversions_filtered} ;;
    group_label: "Summations"
    group_item_label: "Filtered Anomaly Conversions"
  }

  dimension: attrib_conversions {
    type: number
    sql: ${TABLE}.attrib_conversions ;;
    hidden: yes
  }

  measure: attrib_conversions_sum {
    type: sum
    sql: ${attrib_conversions} ;;
    group_label: "Summations"
    group_item_label: "Attributed Conversions"
  }

  dimension: attributed_calculated_upa {
    type: number
    sql: ${TABLE}.attributed_calculated_upa ;;
    hidden: yes
  }

  measure: attributed_calculated_upa_sum {
    type: sum
    sql: ${attributed_calculated_upa} ;;
    group_label: "Summations"
    group_item_label: "Attributed UPA"
    description: "User purchase amount"
    value_format_name: usd
  }

  dimension: bid_price {
    type: number
    sql: ${TABLE}.bid_price ;;
    hidden: yes
  }

  measure: bid_price_average {
    type: average
    sql: ${bid_price} ;;
    group_label: "Mean"
    group_item_label: "Bid Price"
  }

  measure: bid_price_median {
    type: median
    sql: ${bid_price} ;;
    group_label: "Median"
    group_item_label: "Bid Price"
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
    hidden: yes
  }

  measure: calculated_upa_sum {
    type: sum
    sql: ${calculated_upa} ;;
    group_label: "Summations"
    group_item_label: "Calculated UPA"
    description: "User purchase amount"
    value_format_name: usd
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
    hidden: yes
  }

  measure: click_prob_avg {
    type: average
    sql: ${click_prob} ;;
    group_label: "Mean"
    group_item_label: "Click Probability"
    description: "IPOW Predict calculated value"
  }

  measure: click_prob_median {
    type: median
    sql: ${click_prob} ;;
    group_label: "Median"
    group_item_label: "Click Probability"
    description: "IPOW Predict calculated value"
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}.clicks ;;
    hidden: yes
  }

  measure: clicks_sum {
    type: sum
    sql: ${clicks} ;;
    group_label: "Summations"
    group_item_label: "Clicks"
  }

  dimension: conv_prob {
    type: number
    sql: ${TABLE}.conv_prob ;;
    hidden: yes
  }

  measure: conv_prob_avg {
    type: average
    sql: ${conv_prob} ;;
    group_label: "Mean"
    group_item_label: "Conversion Probability"
    description: "IPOW Predict calculated value"
  }

  measure: conv_prob_median {
    type: median
    sql: ${conv_prob} ;;
    group_label: "Median"
    group_item_label: "Conversion Probability"
    description: "IPOW Predict calculated value"
  }

  dimension: conversions {
    type: number
    sql: ${TABLE}.conversions ;;
    hidden: yes
  }

  measure: conversions_sum {
    type: sum
    sql: ${conversions} ;;
    group_label: "Summations"
    group_item_label: "Conversions"
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
    hidden: yes
  }

  dimension: deal_id {
    type: string
    sql: ${TABLE}.deal_id ;;
  }

  dimension: decisions {
    type: number
    sql: ${TABLE}.decisions ;;
    hidden: yes
  }

  measure: decisions_sum {
    type: sum
    sql: ${decisions} ;;
    group_label: "Summations"
    group_item_label: "Decisions"
  }

  dimension: demand_type {
    type: string
    sql: ${TABLE}.demand_type ;;
  }

  dimension: impressions {
    type: number
    sql: ${TABLE}.impressions ;;
    hidden: yes
  }

  measure: impressions_sum {
    type: sum
    sql: ${impressions} ;;
    group_label: "Summations"
    group_item_label: "Impressions"
  }

  dimension: insertion_order_id {
    type: string
    sql: ${TABLE}.insertion_order_id ;;
  }

  dimension: line_item_id {
    type: string
    sql: ${TABLE}.line_item_id ;;
  }

  dimension: mail_type {
    type: string
    sql: ${TABLE}.mail_type ;;
  }

  dimension: noads {
    type: number
    sql: ${TABLE}.noads ;;
    hidden: yes
  }

  measure: noads_sum {
    type: sum
    sql: ${noads} ;;
    group_label: "Summations"
    group_item_label: "No Ads"
    description: "Decisions resulting in no ad shown"
  }

  dimension: pricing_type {
    type: string
    sql: ${TABLE}.pricing_type ;;
  }

  dimension: pub_media_group {
    type: string
    sql: ${TABLE}.pub_media_group ;;
  }

  dimension: publisher_id {
    type: number
    sql: CAST(${TABLE}.publisher_id AS BIGINT) ;;
  }

  dimension: publisher_revenue {
    type: number
    sql: ${TABLE}.publisher_revenue ;;
    hidden: yes
  }

  measure: publisher_revenue_sum {
    type: sum
    sql: ${publisher_revenue} ;;
    group_label: "Summations"
    group_item_label: "Publisher Revenue"
  }

  dimension: pvc {
    type: number
    sql: ${TABLE}.pvc ;;
    hidden: yes
  }

  measure: pvc_sum {
    type: sum
    sql: ${pvc} ;;
    group_label: "Summations"
    group_item_label: "PVC"
    description: "Post-view conversions"
  }

  dimension: res_bid_cid {
    type: string
    sql: ${TABLE}.res_bid_cid ;;
  }

  dimension: second_price {
    type: number
    sql: ${TABLE}.second_price ;;
  }

  measure: second_price_avg {
    type: average
    sql: ${second_price} ;;
    group_label: "Mean"
    group_item_label: "Second Price"
    description: "Value of 2nd place bid"
  }

  measure: second_price_median {
    type: median
    sql: ${second_price} ;;
    group_label: "Median"
    group_item_label: "Secod Price"
    description: "Value of 2nd place bid"
  }

  dimension: section_id {
    type: string
    sql: ${TABLE}.section_id ;;
  }

  dimension: size {
    type: string
    sql: ${TABLE}.size ;;
  }

  dimension: template_id {
    type: string
    sql: ${TABLE}.template_id ;;
  }

}
