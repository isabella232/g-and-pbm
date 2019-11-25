view: sellable_aggs_maids {
  derived_table: {
    sql: SELECT * FROM no_id_logs.sellable_pairs_cookie
      ;;
  }

  suggestions: no

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: cookiedomain {
    type: string
    sql: ${TABLE}.cookiedomain ;;
  }

  measure: cookie_count {
    type: sum
    sql: ${TABLE}.cookie_count ;;
  }

  dimension: event_date {
    type: string
    sql: ${TABLE}.event_date ;;
  }

  set: detail {
    fields: [cookiedomain, cookie_count, event_date]
  }
}
