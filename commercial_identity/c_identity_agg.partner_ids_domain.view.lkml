view: c_identity_agg_partner_ids_domain {
  sql_table_name: no_id_logs.sellable_pairs_pii_cookie_domain ;;
  suggestions: no

  dimension: cookiedomain {
    type: string
    sql: ${TABLE}.cookiedomain ;;
    label: "Cookie Domain ID"
  }

  dimension: event_date {
    type: date
    sql: DATE_PARSE(${TABLE}.date_p,'%Y%m%d') ;;
    label: "Generation Date"
  }

  measure: hems {
    type: average
    sql: ${TABLE}.piicount ;;
    label: "Count HEMs"
    value_format_name: decimal_0
  }
}
