view: sellable_aggs_pairs_total {
  derived_table: {
    sql: SELECT SUM(algorithm_count) pairs_count
      FROM no_id_logs.sellable_pairs_aggregates
      WHERE event_date =  (SELECT max(event_date) FROM no_id_logs.sellable_pairs_pii)
       ;;
  }

  suggestions: no

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: pairs_count {
    type: sum
    sql: ${TABLE}.pairs_count ;;
  }

  set: detail {
    fields: [pairs_count]
  }
}
