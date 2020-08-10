view: sellable_pairs_pii_count_info {
  sql_table_name: auto_bidatapipelines.sellable_pairs_pii_count_info ;;
  suggestions: no

  dimension: event_date {
    type: date
    sql: DATE_PARSE(${TABLE}.date_p,'%Y%m%d') ;;
    label: "Generation Date"
  }

  measure: hems {
    type: average
    label: "Count HEMs"
    sql: NULLIF(${TABLE}.piicount,0) ;;
    value_format_name: decimal_0
  }
}
