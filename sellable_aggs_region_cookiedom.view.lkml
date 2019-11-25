view: sellable_aggs_region_cookiedom {
  derived_table: {
    sql: SELECT event_date, cookiedomain, region, SUM(region_count) region_count
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

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  measure: region_count {
    type: sum
    sql: ${TABLE}.region_count ;;
  }

  set: detail {
    fields: [event_date, cookiedomain, region, region_count]
  }
}
