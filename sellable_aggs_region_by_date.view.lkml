view: sellable_aggs_region_by_date {
  derived_table: {
    sql: SELECT event_date, region, SUM(region_count) region_count
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

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  measure: region_count {
    type: sum
    sql: ${TABLE}.region_count ;;
  }

  set: detail {
    fields: [event_date, region, region_count]
  }
}
