view: zf_agencies {
  sql_table_name: lfx.zf_agencies ;;
  drill_fields: [id]
  suggestions: no

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: account_executive_id {
    type: string
    sql: ${TABLE}.account_executive_id ;;
  }

  dimension: account_id {
    type: number
    sql: ${TABLE}.account_id ;;
  }

  dimension: account_manager_id {
    type: string
    sql: ${TABLE}.account_manager_id ;;
  }

  dimension: activated {
    type: number
    sql: ${TABLE}.activated ;;
  }

  dimension: agency_type {
    type: string
    sql: ${TABLE}.agency_type ;;
  }

  dimension: agreed_ad_choices {
    type: number
    sql: ${TABLE}.agreed_ad_choices ;;
  }

  dimension: agreed_exclusivity {
    type: number
    sql: ${TABLE}.agreed_exclusivity ;;
  }

  dimension: agreed_powered_by {
    type: number
    sql: ${TABLE}.agreed_powered_by ;;
  }

  dimension: agreed_repurposing {
    type: number
    sql: ${TABLE}.agreed_repurposing ;;
  }

  dimension: agreed_user_matching {
    type: number
    sql: ${TABLE}.agreed_user_matching ;;
  }

  dimension: blocklist_names {
    type: string
    sql: ${TABLE}.blocklist_names ;;
  }

  dimension: contact_address1 {
    type: string
    sql: ${TABLE}.contact_address1 ;;
  }

  dimension: contact_address2 {
    type: string
    sql: ${TABLE}.contact_address2 ;;
  }

  dimension: contact_city {
    type: string
    sql: ${TABLE}.contact_city ;;
  }

  dimension: contact_country {
    type: string
    sql: ${TABLE}.contact_country ;;
  }

  dimension: contact_email_address {
    type: string
    sql: ${TABLE}.contact_email_address ;;
  }

  dimension: contact_first_name {
    type: string
    sql: ${TABLE}.contact_first_name ;;
  }

  dimension: contact_last_name {
    type: string
    sql: ${TABLE}.contact_last_name ;;
  }

  dimension: contact_name {
    type: string
    sql: ${TABLE}.contact_name ;;
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

  dimension: contract_type {
    type: string
    sql: ${TABLE}.contract_type ;;
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

  dimension: dsp_fee {
    type: number
    sql: ${TABLE}.dsp_fee ;;
  }

  dimension: exchange_fee {
    type: number
    sql: ${TABLE}.exchange_fee ;;
  }

  dimension: exchange_floor {
    type: number
    sql: ${TABLE}.exchange_floor ;;
  }

  dimension_group: fees_effective {
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
    sql: ${TABLE}.fees_effective_date ;;
  }

  dimension: flat_fee {
    type: number
    sql: ${TABLE}.flat_fee ;;
  }

  dimension: gdpr_compliance {
    type: number
    sql: ${TABLE}.gdpr_compliance ;;
  }

  dimension: included_campaigns {
    type: number
    sql: ${TABLE}.included_campaigns ;;
  }

  dimension: is_api_partner {
    type: number
    sql: ${TABLE}.is_api_partner ;;
  }

  dimension: li_payment_terms {
    type: string
    sql: ${TABLE}.li_payment_terms ;;
  }

  dimension: lotame_id {
    type: string
    sql: ${TABLE}.lotame_id ;;
  }

  dimension: marginal_fee {
    type: number
    sql: ${TABLE}.marginal_fee ;;
  }

  dimension: media_group_payment_terms {
    type: string
    sql: ${TABLE}.media_group_payment_terms ;;
  }

  dimension: media_group_type {
    type: string
    sql: ${TABLE}.media_group_type ;;
  }

  dimension: monthly_minimum {
    type: number
    sql: ${TABLE}.monthly_minimum ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: pds_user_id {
    type: string
    sql: ${TABLE}.pds_user_id ;;
  }

  dimension: pmp_ssp_fee {
    type: number
    sql: ${TABLE}.pmp_ssp_fee ;;
  }

  dimension: pr_promotional {
    type: string
    sql: ${TABLE}.pr_promotional ;;
  }

  dimension: rtb_allow {
    type: number
    sql: ${TABLE}.rtb_allow ;;
  }

  dimension: rtb_hide {
    type: number
    sql: ${TABLE}.rtb_hide ;;
  }

  dimension: salesforce_id {
    type: string
    sql: ${TABLE}.salesforce_id ;;
  }

  dimension: self_service {
    type: number
    sql: ${TABLE}.self_service ;;
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

  dimension: tier_type {
    type: string
    sql: ${TABLE}.tier_type ;;
  }

  dimension: trading_desk {
    type: number
    sql: ${TABLE}.trading_desk ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
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
    label: "Media Group ID"
    value_format_name: id
  }

  dimension: version {
    type: number
    sql: ${TABLE}.version ;;
  }

  dimension: whitelist {
    type: string
    sql: ${TABLE}.whitelist ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      name,
      spotfire_username,
      contact_name,
      contact_first_name,
      contact_last_name
    ]
  }
}
