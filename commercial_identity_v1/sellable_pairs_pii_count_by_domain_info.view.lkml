view: sellable_pairs_pii_count_by_domain_info {
  sql_table_name: auto_bidatapipelines.sellable_pairs_pii_count_by_domain_info ;;
  suggestions: no

  dimension: cookiedomain {
    type: string
    sql: ${TABLE}.cookiedomain ;;
    label: "Cookie Domain ID"
  }

  dimension: event_date {
    type: date
    sql: DATE_PARSE(${TABLE}.date_p, '%Y%m%d') ;;
    label: "Generation Date"
  }

  measure: hems {
    type:  average
    sql: ${TABLE}.piicount ;;
    label: "Count HEMs"
    value_format_name: decimal_0
  }
}
