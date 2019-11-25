view: sellable_agg_max_date {
  derived_table: {
    sql: SELECT max(event_date) max_date
      FROM no_id_logs.sellable_pairs_aggregates
       ;;
  }

  suggestions: no

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: max_date {
    type: string
    sql: ${TABLE}.max_date ;;
  }

  set: detail {
    fields: [max_date]
  }
}
