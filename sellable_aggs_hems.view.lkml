view: sellable_aggs_hems {
  derived_table: {
    sql: SELECT * FROM no_id_logs.sellable_pairs_pii
      ORDER BY event_date DESC
       ;;
  }

  suggestions: no

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: distinctpii_count {
    type: sum
    sql: ${TABLE}.distinctpii_count ;;
  }

  dimension: event_date {
    type: string
    sql: ${TABLE}.event_date ;;
  }

  set: detail {
    fields: [distinctpii_count, event_date]
  }
}
