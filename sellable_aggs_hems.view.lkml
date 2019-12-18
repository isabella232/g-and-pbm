view: sellable_aggs_hems {
  derived_table: {
    sql: SELECT * FROM no_id_logs.sellable_pairs_pii
      ORDER BY event_date DESC
       ;;
  }

  suggestions: no

  measure: count {
    type: count
  }

  measure: distinctpii_count {
    type: sum
    sql: ${TABLE}.distinctpii_count ;;
  }

  dimension_group: event_date {
    type: time
    sql: DATE_PARSE(${TABLE}.event_date,'%Y%m%d') ;;
  }
}
