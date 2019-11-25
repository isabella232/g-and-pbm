view: sellable_aggs_total {
  derived_table: {
    sql: SELECT event_date, cookiedomain, total bucket, SUM(total_count) total_count
      FROM no_id_logs.sellable_pairs_aggregates
      GROUP BY 1,2,3
      ORDER BY 1,2,3
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

  dimension: cookiedomain {
    type: string
    sql: ${TABLE}.cookiedomain ;;
  }

  dimension: bucket {
    type: number
    sql: ${TABLE}.bucket ;;
  }

  measure: total_count {
    type: sum
    sql: ${TABLE}.total_count ;;
  }

  set: detail {
    fields: [event_date, cookiedomain, bucket, total_count]
  }
}
