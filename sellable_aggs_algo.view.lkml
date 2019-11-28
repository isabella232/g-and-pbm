view: sellable_aggs_algo {
  derived_table: {
    sql: SELECT event_date, algorithmclassification, SUM(algorithm_count) algo_count
      FROM no_id_logs.sellable_pairs_aggregates
      GROUP BY 1,2
      ORDER BY 1,2
       ;;
  }

  suggestions: no

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: event_date {
    type: string
    sql: ${TABLE}.event_date ;;
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
    fields: [event_date, algorithmclassification, algo_count]
  }
}
