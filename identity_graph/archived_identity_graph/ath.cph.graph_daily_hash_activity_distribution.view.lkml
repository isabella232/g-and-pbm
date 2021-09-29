view: graph_daily_hash_activity_distribution {
  derived_table: {
    sql: SELECT DATE_PARSE(date_p, '%Y%m%d') event_date, mappingtype,  r.days_seen_last_31, mappedehashactivitylast31days[r.days_seen_last_31] cnt_hashes
      FROM "auto_mappings"."hash_stats"
      CROSS JOIN UNNEST(MAP_KEYS(mappedehashactivitylast31days)) as r (days_seen_last_31)
      WHERE mappingtype NOT LIKE '%¤%'
       ;;
  }

  suggestions: no

  dimension_group: event_date {
    type: time
    sql: ${TABLE}.event_date ;;
  }

  dimension: mapping_type {
    type: string
    sql: ${TABLE}.mappingtype ;;
  }

  dimension: days_seen_last_31 {
    type: number
    sql: ${TABLE}.days_seen_last_31 ;;
  }

  measure: cnt_hashes {
    type: sum
    sql: ${TABLE}.cnt_hashes ;;
  }
}
