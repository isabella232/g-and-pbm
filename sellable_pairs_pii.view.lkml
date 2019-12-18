view: sellable_pairs_pii {
  sql_table_name: no_id_logs.sellable_pairs_pii ;;
  suggestions: no

  dimension: event_date {
    type: date
    sql: DATE_PARSE(${TABLE}.event_date,'%Y%m%d') ;;
  }

  measure: hems {
    type: average
    label: "HEMs"
    sql: ${TABLE}.distinctpii_count ;;
  }
}
