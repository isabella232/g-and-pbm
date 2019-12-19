view: sellable_aggs_latest_date {
  derived_table: {
    sql: SELECT MAX(event_date) last_date
      FROM no_id_logs.sellable_pairs_pii
       ;;
  }

  suggestions: no

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: last_date {
    type: date
    sql: DATE_PARSE(${TABLE}.last_date,'%Y%m%d') ;;
  }

  set: detail {
    fields: [last_date]
  }
}