view: c_identity_agg_hems_total {
  sql_table_name: auto_bidatapipelines.sellable_pairs_pii_count_info ;;
  suggestions: no
  label: "Available HEMs (Overall)"

  dimension: event_date {
    type: date
    sql: DATE_PARSE(${TABLE}.date_p,'%Y%m%d') ;;
    label: "Generation Date"
    description: "Run date"
  }

  measure: hems {
    type: average
    label: "Count HEMs"
    sql: NULLIF(${TABLE}.piicount,0) ;;
    value_format_name: decimal_0
    description: "Number of sellable HEMs with ≥1 connected third-party ID"
  }
}
