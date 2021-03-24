view: zf_pubvertisers {
  sql_table_name: AwsDataCatalog.lfx.zf_pubvertisers ;;
  drill_fields: [id]
  suggestions: no

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: account_id {
    type: number
    sql: ${TABLE}.account_id ;;
  }

  dimension: admin_user_id {
    type: string
    sql: ${TABLE}.admin_user_id ;;
  }

  dimension: adv_categories {
    type: string
    sql: ${TABLE}.adv_categories ;;
  }

  dimension: adv_cookie_sync {
    type: number
    sql: ${TABLE}.adv_cookie_sync ;;
  }

  dimension: adv_dsp_fee {
    type: number
    sql: ${TABLE}.adv_dsp_fee ;;
  }

  dimension: adv_liveramp_id {
    type: string
    sql: ${TABLE}.adv_liveramp_id ;;
  }

  dimension: adv_premium_domain {
    type: string
    sql: ${TABLE}.adv_premium_domain ;;
  }

  dimension: adv_rtb_host {
    type: number
    sql: ${TABLE}.adv_rtb_host ;;
  }

  dimension: adv_suppress_competitive {
    type: number
    sql: ${TABLE}.adv_suppress_competitive ;;
  }

  dimension: adv_targeting_names {
    type: string
    sql: ${TABLE}.adv_targeting_names ;;
  }

  dimension: adv_targeting_publishers {
    type: string
    sql: ${TABLE}.adv_targeting_publishers ;;
  }

  dimension: adv_targeting_type {
    type: string
    sql: ${TABLE}.adv_targeting_type ;;
  }

  dimension: agency_id {
    type: string
    sql: ${TABLE}.agency_id ;;
  }

  dimension: category_id {
    type: number
    sql: ${TABLE}.category_id ;;
  }

  dimension: company_name {
    type: string
    sql: ${TABLE}.company_name ;;
  }

  dimension: contact_addr1 {
    type: string
    sql: ${TABLE}.contact_addr1 ;;
  }

  dimension: contact_addr2 {
    type: string
    sql: ${TABLE}.contact_addr2 ;;
  }

  dimension: contact_city {
    type: string
    sql: ${TABLE}.contact_city ;;
  }

  dimension: contact_country {
    type: string
    sql: ${TABLE}.contact_country ;;
  }

  dimension: contact_email {
    type: string
    sql: ${TABLE}.contact_email ;;
  }

  dimension: contact_email_address {
    type: string
    sql: ${TABLE}.contact_email_address ;;
  }

  dimension: contact_fname {
    type: string
    sql: ${TABLE}.contact_fname ;;
  }

  dimension: contact_lname {
    type: string
    sql: ${TABLE}.contact_lname ;;
  }

  dimension: contact_phone {
    type: string
    sql: ${TABLE}.contact_phone ;;
  }

  dimension: contact_state {
    type: string
    sql: ${TABLE}.contact_state ;;
  }

  dimension: contact_zip {
    type: string
    sql: ${TABLE}.contact_zip ;;
  }

  dimension: created_by {
    type: string
    sql: ${TABLE}.created_by ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_on ;;
  }

  dimension: css_coordinator_user_id {
    type: string
    sql: ${TABLE}.css_coordinator_user_id ;;
  }

  dimension: deactivated {
    type: number
    sql: ${TABLE}.deactivated ;;
  }

  dimension_group: deactivated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.deactivated_on ;;
  }

  dimension: demand_fee {
    type: number
    sql: ${TABLE}.demand_fee ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: direct_sold_fee {
    type: number
    sql: ${TABLE}.direct_sold_fee ;;
  }

  dimension: direct_sold_fee_cpm {
    type: number
    sql: ${TABLE}.direct_sold_fee_cpm ;;
  }

  dimension: directory_expose {
    type: number
    sql: ${TABLE}.directory_expose ;;
  }

  dimension: directory_expose_public {
    type: number
    sql: ${TABLE}.directory_expose_public ;;
  }

  dimension: disable_ad_choices {
    type: number
    sql: ${TABLE}.disable_ad_choices ;;
  }

  dimension: disable_powered_by {
    type: number
    sql: ${TABLE}.disable_powered_by ;;
  }

  dimension: domain {
    type: string
    sql: ${TABLE}.domain ;;
  }

  dimension: email_tag_replacement {
    type: string
    sql: ${TABLE}.email_tag_replacement ;;
  }

  dimension: email_tag_type_id {
    type: number
    sql: ${TABLE}.email_tag_type_id ;;
  }

  dimension: esp_id {
    type: number
    sql: ${TABLE}.esp_id ;;
  }

  dimension: exchange_fee {
    type: number
    sql: ${TABLE}.exchange_fee ;;
  }

  dimension: executive_user_id {
    type: string
    sql: ${TABLE}.executive_user_id ;;
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}.external_id ;;
  }

  dimension: floor_competitive_ad_suppression {
    type: number
    sql: ${TABLE}.floor_competitive_ad_suppression ;;
  }

  dimension: floor_non_preemptive {
    type: number
    sql: ${TABLE}.floor_non_preemptive ;;
  }

  dimension: floor_remnant {
    type: number
    sql: ${TABLE}.floor_remnant ;;
  }

  dimension: floor_roadblock {
    type: number
    sql: ${TABLE}.floor_roadblock ;;
  }

  dimension: floor_takeover {
    type: number
    sql: ${TABLE}.floor_takeover ;;
  }

  dimension: floor_transparency {
    type: number
    sql: ${TABLE}.floor_transparency ;;
  }

  dimension: gdpr_compliance {
    type: number
    sql: ${TABLE}.gdpr_compliance ;;
  }

  dimension: has_exchange {
    type: number
    sql: ${TABLE}.has_exchange ;;
  }

  dimension: list_tag_replacement {
    type: string
    sql: ${TABLE}.list_tag_replacement ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
    label: "Publisher or Advertiser Name"
    description: "Name associated with Publisher ID"
  }

  dimension: pds_user_id {
    type: string
    sql: ${TABLE}.pds_user_id ;;
  }

  dimension: placement_tag_replacement {
    type: string
    sql: ${TABLE}.placement_tag_replacement ;;
  }

  dimension: pmp_ssp_fee {
    type: number
    sql: ${TABLE}.pmp_ssp_fee ;;
  }

  dimension: pub_allow_marquee_powered_by {
    type: number
    sql: ${TABLE}.pub_allow_marquee_powered_by ;;
  }

  dimension: pub_allow_rtb {
    type: number
    sql: ${TABLE}.pub_allow_rtb ;;
  }

  dimension: pub_apply_blocklists {
    type: number
    sql: ${TABLE}.pub_apply_blocklists ;;
  }

  dimension: pub_blocklist_categories {
    type: string
    sql: ${TABLE}.pub_blocklist_categories ;;
  }

  dimension: pub_categories {
    type: string
    sql: ${TABLE}.pub_categories ;;
  }

  dimension: pub_data_partners {
    type: string
    sql: ${TABLE}.pub_data_partners ;;
  }

  dimension: pub_demand_allocation {
    type: string
    sql: ${TABLE}.pub_demand_allocation ;;
  }

  dimension: pub_demand_allocation_direct {
    type: number
    sql: ${TABLE}.pub_demand_allocation_direct ;;
  }

  dimension: pub_demand_allocation_house {
    type: number
    sql: ${TABLE}.pub_demand_allocation_house ;;
  }

  dimension: pub_exchange_floor {
    type: number
    sql: ${TABLE}.pub_exchange_floor ;;
  }

  dimension: pub_iab_creative_attributes {
    type: string
    sql: ${TABLE}.pub_iab_creative_attributes ;;
  }

  dimension: pub_key_values_count {
    type: number
    sql: ${TABLE}.pub_key_values_count ;;
  }

  dimension: pub_key_values_params {
    type: string
    sql: ${TABLE}.pub_key_values_params ;;
  }

  dimension: pub_liveramp_id {
    type: number
    sql: ${TABLE}.pub_liveramp_id ;;
  }

  dimension: pub_rtb_hide {
    type: number
    sql: ${TABLE}.pub_rtb_hide ;;
  }

  dimension: pub_rtb_partners {
    type: string
    sql: ${TABLE}.pub_rtb_partners ;;
  }

  dimension: pub_targeting_advertisers {
    type: string
    sql: ${TABLE}.pub_targeting_advertisers ;;
  }

  dimension: pub_targeting_names {
    type: string
    sql: ${TABLE}.pub_targeting_names ;;
  }

  dimension: pub_targeting_names_type {
    type: string
    sql: ${TABLE}.pub_targeting_names_type ;;
  }

  dimension: pub_targeting_rtb_domains {
    type: string
    sql: ${TABLE}.pub_targeting_rtb_domains ;;
  }

  dimension: pub_targeting_rtb_domains_type {
    type: string
    sql: ${TABLE}.pub_targeting_rtb_domains_type ;;
  }

  dimension: pub_targeting_type {
    type: string
    sql: ${TABLE}.pub_targeting_type ;;
  }

  dimension: pub_uid {
    type: number
    value_format_name: id
    sql: ${TABLE}.pub_uid ;;
  }

  dimension: pub_unique_ads {
    type: string
    sql: ${TABLE}.pub_unique_ads ;;
  }

  dimension: pub_user_match_allow {
    type: number
    sql: ${TABLE}.pub_user_match_allow ;;
  }

  dimension: pub_user_match_partners {
    type: string
    sql: ${TABLE}.pub_user_match_partners ;;
  }

  dimension: publisher_id_lfx {
    type: string
    sql: ${TABLE}.publisher_id ;;
  }

  dimension: rate_card_dedicated {
    type: number
    sql: ${TABLE}.rate_card_dedicated ;;
  }

  dimension: rate_card_expose {
    type: number
    sql: ${TABLE}.rate_card_expose ;;
  }

  dimension: rate_card_newsletter {
    type: number
    sql: ${TABLE}.rate_card_newsletter ;;
  }

  dimension: rate_card_takeover {
    type: number
    sql: ${TABLE}.rate_card_takeover ;;
  }

  dimension: salesforce_id {
    type: string
    sql: ${TABLE}.salesforce_id ;;
  }

  dimension: spotfire_password {
    type: string
    sql: ${TABLE}.spotfire_password ;;
  }

  dimension: spotfire_username {
    type: string
    sql: ${TABLE}.spotfire_username ;;
  }

  dimension: tags_domain {
    type: string
    sql: ${TABLE}.tags_domain ;;
  }

  dimension: tags_domain_invalid {
    type: number
    value_format_name: id
    sql: ${TABLE}.tags_domain_invalid ;;
  }

  dimension: tier {
    type: number
    sql: ${TABLE}.tier ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: unsubscribe_url {
    type: string
    sql: ${TABLE}.unsubscribe_url ;;
  }

  dimension: updated_by {
    type: string
    sql: ${TABLE}.updated_by ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.updated_on ;;
  }

  dimension: userver_id {
    type: number
    sql: ${TABLE}.userver_id ;;
  }

  dimension: publisher_id {
    type: number
    sql: ${userver_id} ;;
    value_format_name: id
    description: "Publisher ID on the LiveIntent platform"
  }

  dimension: advertiser_id {
    type: number
    sql: ${userver_id} ;;
  }

  dimension: version {
    type: number
    sql: ${TABLE}.version ;;
  }

  measure: count {
    type: count
  }

  measure: count_publishers {
    type: count_distinct
    sql: ${publisher_id} ;;
    label: "Count (Publishers)"
    drill_fields: [zf_agencies.userver_id, zf_agencies.name, publisher_id, name]
    description: "Count of unique publisher IDs"
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      name,
      company_name,
      contact_fname,
      contact_lname,
      spotfire_username
    ]
  }
}
