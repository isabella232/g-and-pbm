view: c_identity_agg_hems_total {
  sql_table_name: no_id_logs.sellable_pairs_pii ;;
  suggestions: no

  dimension: event_date {
    type: date
    sql: DATE_PARSE(${TABLE}.event_date,'%Y%m%d') ;;
    label: "Generation Date"
  }

  measure: hems {
    type: average
    label: "Count HEMs"
    sql: ${TABLE}.distinctpii_count ;;
  }
}
