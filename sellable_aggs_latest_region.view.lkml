view: sellable_aggs_latest_region {
  derived_table: {
    sql: SELECT region, sum(region_count) region_count
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

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  measure: region_count {
    type: sum
    sql: ${TABLE}.region_count ;;
  }

  set: detail {
    fields: [region, region_count]
  }
}
