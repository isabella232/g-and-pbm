view: c_identity_agg_partner_ids_domain {
  sql_table_name: auto_bidatapipelines.sellable_pairs_pii_count_by_domain_info ;;
  suggestions: no
  label: "Available HEMs (by Third-Party Domain)"

  dimension: cookiedomain {
    type: string
    sql: ${TABLE}.selector ;;
    label: "Cookie Domain ID"
    description: "Third-party ID"
  }

  dimension: event_date {
    type: date
    sql: DATE_PARSE(${TABLE}.date_p,'%Y%m%d') ;;
    label: "Generation Date"
    description: "Run date"
  }

  measure: hems {
    type: average
    sql: ${TABLE}.piicount ;;
    label: "Count HEMs"
    value_format_name: decimal_0
    description: "Number of sellable HEMs with ≥1 connected ID"
  }
}
