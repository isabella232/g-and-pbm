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
    sql: DATE_PARSE(${TABLE}.event_date,'%Y%m%d') ;;
    label: "Generation Date"
  }

  measure: hems {
    type: average
    sql: ${TABLE}.pii_count ;;
    label: "Count HEMs"
  }

# sellable_pairs_pii_cookie_domain
}
