view: sellable_aggs_pairs_best_classification {
  derived_table: {
    sql: SELECT algorithmclassification, SUM(algorithm_count) algo_count
      FROM no_id_logs.sellable_pairs_aggregates
      WHERE event_date = (SELECT max(event_date) FROM no_id_logs.sellable_pairs_aggregates)
      GROUP BY 1
       ;;
  }

  suggestions: no

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: algorithmclassification {
    type: string
    sql: ${TABLE}.algorithmclassification ;;
  }

  measure: algo_count {
    type: sum
    sql: ${TABLE}.algo_count ;;
  }

  set: detail {
    fields: [algorithmclassification, algo_count]
  }
}
