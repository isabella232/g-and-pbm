view: impression {
  sql_table_name: auto_userverssp_parquet.impression ;;
  drill_fields: [impression_id]
  suggestions: no

  dimension: impression_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.impression_id ;;
  }

  dimension: ab_test_values {
    type: string
    sql: ${TABLE}.ab_test_values ;;
  }

  dimension: accept_languages {
    type: string
    sql: ${TABLE}.accept_languages ;;
  }

  dimension: actual_data_fee {
    type: number
    sql: ${TABLE}.actual_data_fee ;;
  }

  dimension: actual_dsp_fee {
    type: number
    sql: ${TABLE}.actual_dsp_fee ;;
  }

  dimension: actual_pgm_fee {
    type: number
    sql: ${TABLE}.actual_pgm_fee ;;
  }

  dimension: actual_ssp_fee {
    type: number
    sql: ${TABLE}.actual_ssp_fee ;;
  }

  dimension: adomain {
    type: string
    sql: ${TABLE}.adomain ;;
  }

  dimension: adv_media_group {
    type: number
    sql: ${TABLE}.adv_media_group ;;
  }

  dimension: advertiser_id {
    type: number
    sql: ${TABLE}.advertiser_id ;;
  }

  dimension: advertiser_payout {
    type: number
    sql: ${TABLE}.advertiser_payout ;;
  }

  dimension: advertiser_spent {
    type: number
    sql: ${TABLE}.advertiser_spent ;;
  }

  dimension: age {
    type: string
    sql: ${TABLE}.age ;;
  }

  dimension: agency_id {
    type: number
    sql: ${TABLE}.agency_id ;;
  }

  dimension: auction_type {
    type: string
    sql: ${TABLE}.auction_type ;;
  }

  dimension: bid_bucket {
    type: number
    sql: ${TABLE}.bid_bucket ;;
  }

  dimension: bid_decile {
    type: number
    sql: ${TABLE}.bid_decile ;;
  }

  dimension: bid_price {
    type: number
    sql: ${TABLE}.bid_price ;;
  }

  dimension: bidder_id {
    type: number
    sql: ${TABLE}.bidder_id ;;
  }

  dimension: bidder_seat {
    type: string
    sql: ${TABLE}.bidder_seat ;;
  }

  dimension: blueprint_id {
    type: number
    sql: ${TABLE}.blueprint_id ;;
  }

  dimension: bsw_site_id {
    type: string
    sql: ${TABLE}.bsw_site_id ;;
  }

  dimension: bundle {
    type: string
    sql: ${TABLE}.bundle ;;
  }

  dimension: buyeruid_source {
    type: string
    sql: ${TABLE}.buyeruid_source ;;
  }

  dimension: campaign_id {
    type: number
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: campaign_type {
    type: string
    sql: ${TABLE}.campaign_type ;;
  }

  dimension: category_id {
    type: number
    sql: ${TABLE}.category_id ;;
  }

  dimension: click_prob {
    type: number
    sql: ${TABLE}.click_prob ;;
  }

  dimension: click_url {
    type: string
    sql: ${TABLE}.click_url ;;
  }

  dimension: conv_prob {
    type: number
    sql: ${TABLE}.conv_prob ;;
  }

  dimension: conversion_id {
    type: number
    sql: ${TABLE}.conversion_id ;;
  }

  dimension: creative_id {
    type: number
    sql: ${TABLE}.creative_id ;;
  }

  dimension: custom_flag {
    type: number
    sql: ${TABLE}.custom_flag ;;
  }

  dimension: datacenter_id {
    type: number
    sql: ${TABLE}.datacenter_id ;;
  }

  dimension: date_p {
    type: string
    sql: ${TABLE}.date_p ;;
  }

  dimension: day_of_week {
    type: number
    sql: ${TABLE}.day_of_week ;;
  }

  dimension: day_part {
    type: number
    sql: ${TABLE}.day_part ;;
  }

  dimension: deal_auction_type {
    type: number
    sql: ${TABLE}.deal_auction_type ;;
  }

  dimension: deal_id {
    type: string
    sql: ${TABLE}.deal_id ;;
  }

  dimension: deal_is_direct {
    type: yesno
    sql: ${TABLE}.deal_is_direct ;;
  }

  dimension: deals_auction_logged {
    type: yesno
    sql: ${TABLE}.deals_auction_logged ;;
  }

  dimension: debug {
    type: number
    sql: ${TABLE}.debug ;;
  }

  dimension: decision_date {
    type: string
    sql: ${TABLE}.decision_date ;;
  }

  dimension: decision_id {
    type: string
    sql: ${TABLE}.decision_id ;;
  }

  dimension: demand_type {
    type: string
    sql: ${TABLE}.demand_type ;;
  }

  dimension: dev_maker {
    type: string
    sql: ${TABLE}.dev_maker ;;
  }

  dimension: dev_model {
    type: string
    sql: ${TABLE}.dev_model ;;
  }

  dimension: dev_type {
    type: string
    sql: ${TABLE}.dev_type ;;
  }

  dimension: dnt_header {
    type: string
    sql: ${TABLE}.dnt_header ;;
  }

  dimension: email_domain {
    type: string
    sql: ${TABLE}.email_domain ;;
  }

  dimension: extra_offer_max {
    type: number
    sql: ${TABLE}.extra_offer_max ;;
  }

  dimension: extra_offer_sent {
    type: number
    sql: ${TABLE}.extra_offer_sent ;;
  }

  dimension: first_imp {
    type: number
    sql: ${TABLE}.first_imp ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: geo2 {
    type: string
    sql: ${TABLE}.geo2 ;;
  }

  dimension: goal_type {
    type: number
    sql: ${TABLE}.goal_type ;;
  }

  dimension: google_creative_id {
    type: string
    sql: ${TABLE}.google_creative_id ;;
  }

  dimension: google_line_item_id {
    type: string
    sql: ${TABLE}.google_line_item_id ;;
  }

  dimension: hashed_segments_array {
    type: string
    sql: ${TABLE}.hashed_segments_array ;;
  }

  dimension: idaas_algo {
    type: string
    sql: ${TABLE}.idaas_algo ;;
  }

  dimension: idaas_aw4 {
    type: number
    sql: ${TABLE}.idaas_aw4 ;;
  }

  dimension: idaas_cl {
    type: string
    sql: ${TABLE}.idaas_cl ;;
  }

  dimension: idaas_er {
    type: number
    sql: ${TABLE}.idaas_er ;;
  }

  dimension: idaas_group {
    type: string
    sql: ${TABLE}.idaas_group ;;
  }

  dimension: idaas_hiro {
    type: string
    sql: ${TABLE}.idaas_hiro ;;
  }

  dimension: idaas_index {
    type: number
    sql: ${TABLE}.idaas_index ;;
  }

  dimension: idaas_response_id {
    type: string
    sql: ${TABLE}.idaas_response_id ;;
  }

  dimension: idaas_v {
    type: number
    sql: ${TABLE}.idaas_v ;;
  }

  dimension: ifaas_template_id {
    type: string
    sql: ${TABLE}.ifaas_template_id ;;
  }

  dimension: image_url {
    type: string
    sql: ${TABLE}.image_url ;;
  }

  dimension: insertion_order_id {
    type: number
    sql: ${TABLE}.insertion_order_id ;;
  }

  dimension: intent_referrers {
    type: string
    sql: ${TABLE}.intent_referrers ;;
  }

  dimension: interest {
    type: string
    sql: ${TABLE}.interest ;;
  }

  dimension: interest_id {
    type: number
    sql: ${TABLE}.interest_id ;;
  }

  dimension: is_advertiser_with_max_bid_amount {
    type: yesno
    sql: ${TABLE}.is_advertiser_with_max_bid_amount ;;
  }

  dimension: is_bad_user {
    type: yesno
    sql: ${TABLE}.is_bad_user ;;
  }

  dimension: is_bidder_with_max_bid_amount {
    type: yesno
    sql: ${TABLE}.is_bidder_with_max_bid_amount ;;
  }

  dimension: is_broken_drop {
    type: yesno
    sql: ${TABLE}.is_broken_drop ;;
  }

  dimension: is_creative_with_max_bid_amount {
    type: yesno
    sql: ${TABLE}.is_creative_with_max_bid_amount ;;
  }

  dimension: is_deal_preferred {
    type: yesno
    sql: ${TABLE}.is_deal_preferred ;;
  }

  dimension: is_deal_private {
    type: yesno
    sql: ${TABLE}.is_deal_private ;;
  }

  dimension: is_testing {
    type: yesno
    sql: ${TABLE}.is_testing ;;
  }

  dimension: is_weekend {
    type: number
    sql: ${TABLE}.is_weekend ;;
  }

  dimension: key_values {
    type: string
    sql: ${TABLE}.key_values ;;
  }

  dimension: known_user_array {
    type: string
    sql: ${TABLE}.known_user_array ;;
  }

  dimension: last_adv_session_daypart {
    type: number
    sql: ${TABLE}.last_adv_session_daypart ;;
  }

  dimension: li_coord {
    type: string
    sql: ${TABLE}.li_coord ;;
  }

  dimension: lidid {
    type: string
    sql: ${TABLE}.lidid ;;
  }

  dimension: line_item_id {
    type: number
    sql: ${TABLE}.line_item_id ;;
  }

  dimension: list_id {
    type: string
    sql: ${TABLE}.list_id ;;
  }

  dimension: lload2_allpub_imp_1d {
    type: number
    sql: ${TABLE}.lload2_allpub_imp_1d ;;
  }

  dimension: lload_add_product_to_cart_adv_1d {
    type: number
    sql: ${TABLE}.lload_add_product_to_cart_adv_1d ;;
  }

  dimension: lload_adv2_intent_1w {
    type: number
    sql: ${TABLE}.lload_adv2_intent_1w ;;
  }

  dimension: lload_adv_click_30d {
    type: number
    sql: ${TABLE}.lload_adv_click_30d ;;
  }

  dimension: lload_adv_intent_1w {
    type: number
    sql: ${TABLE}.lload_adv_intent_1w ;;
  }

  dimension: lload_camp_click_1d {
    type: number
    sql: ${TABLE}.lload_camp_click_1d ;;
  }

  dimension: lload_camp_click_30d {
    type: number
    sql: ${TABLE}.lload_camp_click_30d ;;
  }

  dimension: lload_camp_conv_1d {
    type: number
    sql: ${TABLE}.lload_camp_conv_1d ;;
  }

  dimension: lload_campaign_imp_12h {
    type: number
    sql: ${TABLE}.lload_campaign_imp_12h ;;
  }

  dimension: lload_click_1d {
    type: number
    sql: ${TABLE}.lload_click_1d ;;
  }

  dimension: lload_click_30d {
    type: number
    sql: ${TABLE}.lload_click_30d ;;
  }

  dimension: lload_conv_1d {
    type: number
    sql: ${TABLE}.lload_conv_1d ;;
  }

  dimension: lload_conv_30d {
    type: number
    sql: ${TABLE}.lload_conv_30d ;;
  }

  dimension: lload_conv_7d {
    type: number
    sql: ${TABLE}.lload_conv_7d ;;
  }

  dimension: lload_creative_imp_12h {
    type: number
    sql: ${TABLE}.lload_creative_imp_12h ;;
  }

  dimension: lload_imp_1d {
    type: number
    sql: ${TABLE}.lload_imp_1d ;;
  }

  dimension: lload_purchase_product_30d {
    type: number
    sql: ${TABLE}.lload_purchase_product_30d ;;
  }

  dimension: lload_purchase_product_7d {
    type: number
    sql: ${TABLE}.lload_purchase_product_7d ;;
  }

  dimension: lload_view_product_7d {
    type: number
    sql: ${TABLE}.lload_view_product_7d ;;
  }

  dimension: mail_type {
    type: string
    sql: ${TABLE}.mail_type ;;
  }

  dimension: mapping_type {
    type: string
    sql: ${TABLE}.mapping_type ;;
  }

  dimension: max_quality {
    type: string
    sql: ${TABLE}.max_quality ;;
  }

  dimension: md5 {
    type: string
    sql: ${TABLE}.md5 ;;
  }

  dimension: metadata {
    type: string
    sql: ${TABLE}.metadata ;;
  }

  dimension: mobile_id_type {
    type: string
    sql: ${TABLE}.mobile_id_type ;;
  }

  dimension: mock_ios15 {
    type: string
    sql: ${TABLE}.mock_ios15 ;;
  }

  dimension: muuid {
    type: string
    sql: ${TABLE}.muuid ;;
  }

  dimension: native_response_info {
    type: string
    sql: ${TABLE}.native_response_info ;;
  }

  dimension: native_template_id {
    type: number
    sql: ${TABLE}.native_template_id ;;
  }

  dimension: nbrowser {
    type: string
    sql: ${TABLE}.nbrowser ;;
  }

  dimension: nbrowser_version {
    type: string
    sql: ${TABLE}.nbrowser_version ;;
  }

  dimension: optimization {
    type: string
    sql: ${TABLE}.optimization ;;
  }

  dimension: os {
    type: string
    sql: ${TABLE}.os ;;
  }

  dimension: os_version {
    type: string
    sql: ${TABLE}.os_version ;;
  }

  dimension: other_segments {
    type: string
    sql: ${TABLE}.other_segments ;;
  }

  dimension: package_id {
    type: number
    sql: ${TABLE}.package_id ;;
  }

  dimension: parsed_domain {
    type: string
    sql: ${TABLE}.parsed_domain ;;
  }

  dimension: per_test_enabled {
    type: number
    sql: ${TABLE}.per_test_enabled ;;
  }

  dimension: placement_id {
    type: string
    sql: ${TABLE}.placement_id ;;
  }

  dimension: precise_time {
    type: number
    sql: ${TABLE}.precise_time ;;
  }

  dimension: predict_version {
    type: number
    sql: ${TABLE}.predict_version ;;
  }

  dimension: pricing_type {
    type: string
    sql: ${TABLE}.pricing_type ;;
  }

  dimension: processing_time {
    type: number
    sql: ${TABLE}.processing_time ;;
  }

  dimension: project_id {
    type: string
    sql: ${TABLE}.project_id ;;
  }

  dimension: pub_media_group {
    type: number
    sql: ${TABLE}.pub_media_group ;;
  }

  dimension: publisher_categories {
    type: string
    sql: ${TABLE}.publisher_categories ;;
  }

  dimension: publisher_domain {
    type: string
    sql: ${TABLE}.publisher_domain ;;
  }

  dimension: publisher_id {
    type: number
    sql: ${TABLE}.publisher_id ;;
  }

  dimension: publisher_payout {
    type: number
    sql: ${TABLE}.publisher_payout ;;
  }

  dimension: publisher_revenue {
    type: number
    sql: ${TABLE}.publisher_revenue ;;
  }

  dimension: random_auction {
    type: string
    sql: ${TABLE}.random_auction ;;
  }

  dimension: redecision_attempt {
    type: number
    sql: ${TABLE}.redecision_attempt ;;
  }

  dimension: redecision_attempt_original {
    type: number
    sql: ${TABLE}.redecision_attempt_original ;;
  }

  dimension: request {
    type: string
    sql: ${TABLE}.request ;;
  }

  dimension: request_ip {
    type: string
    sql: ${TABLE}.request_ip ;;
  }

  dimension: res_bid_cid {
    type: string
    sql: ${TABLE}.res_bid_cid ;;
  }

  dimension: res_bid_crid {
    type: string
    sql: ${TABLE}.res_bid_crid ;;
  }

  dimension: schema_hash_p {
    type: string
    sql: ${TABLE}.schema_hash_p ;;
  }

  dimension: sec_gpc_header {
    type: string
    sql: ${TABLE}.sec_gpc_header ;;
  }

  dimension: second_price {
    type: number
    sql: ${TABLE}.second_price ;;
  }

  dimension: section_id {
    type: number
    sql: ${TABLE}.section_id ;;
  }

  dimension: segmented_keys {
    type: string
    sql: ${TABLE}.segmented_keys ;;
  }

  dimension: segmented_values {
    type: string
    sql: ${TABLE}.segmented_values ;;
  }

  dimension: segments {
    type: string
    sql: ${TABLE}.segments ;;
  }

  dimension: seller_network {
    type: string
    sql: ${TABLE}.seller_network ;;
  }

  dimension: sha1 {
    type: string
    sql: ${TABLE}.sha1 ;;
  }

  dimension: sha2 {
    type: string
    sql: ${TABLE}.sha2 ;;
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
    type: number
    sql: ${TABLE}.template_id ;;
  }

  dimension: test_group {
    type: number
    sql: ${TABLE}.test_group ;;
  }

  dimension: timezone_offset {
    type: number
    sql: ${TABLE}.timezone_offset ;;
  }

  dimension: uid {
    type: string
    sql: ${TABLE}.uid ;;
  }

  dimension: up2_test_group {
    type: string
    sql: ${TABLE}.up2_test_group ;;
  }

  dimension: us_privacy_type {
    type: string
    sql: ${TABLE}.us_privacy_type ;;
  }

  dimension: uuid {
    type: string
    sql: ${TABLE}.uuid ;;
  }

  dimension: x_forwarded_for {
    type: string
    sql: ${TABLE}.x_forwarded_for ;;
  }

  measure: count {
    type: count
    drill_fields: [impression_id]
  }
}
