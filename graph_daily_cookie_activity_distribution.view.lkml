view: graph_daily_cookie_activity_distribution {
  derived_table: {
    sql: SELECT DATE_PARSE(date_p, '%Y%m%d') event_date, mappingtype,  r.days_seen_last_31, mappedcookieactivitylast31days[r.days_seen_last_31] cnt_cookies
      FROM "auto_mappings"."cookie_stats"
      CROSS JOIN UNNEST(MAP_KEYS(mappedcookieactivitylast31days)) as r (days_seen_last_31)
      WHERE mappingtype NOT LIKE '%¤%'
       ;;
  }

  suggestions: no

  dimension_group: event_date {
    type: time
    sql: ${TABLE}.event_date ;;
  }

  dimension: mapping_type_classification {
    type: string
    sql: CASE WHEN ${mapping_type} LIKE 'sourced/%' THEN 'sourced'
           WHEN REGEXP_LIKE(${mapping_type},'^(d\/|dr\/|esp)') THEN 'deterministic'
           WHEN REGEXP_LIKE(${mapping_type},'^(3m|acc)') THEN 'high accuracy probabilistic'
           ELSE 'low accuracy probabilistic'
           END ;;
  }

  dimension: mapping_type {
    type: string
    sql: ${TABLE}.mappingtype ;;
  }

  dimension: days_seen_last_31_reduced {
    type: string
    sql: CASE WHEN ${days_seen_last_31} = 0 THEN 'Not Seen'
              WHEN ${days_seen_last_31} = 1 THEN 'Seen 01 Day'
              WHEN ${days_seen_last_31} = 2 THEN 'Seen 02 Days'
              WHEN ${days_seen_last_31} = 3 THEN 'Seen 03 Days'
              WHEN ${days_seen_last_31} BETWEEN 4 AND 7 THEN 'Seen 04-07 Days'
              WHEN ${days_seen_last_31} BETWEEN 8 AND 14 THEN 'Seen 08-14 Days'
              WHEN ${days_seen_last_31} BETWEEN 15 AND 21 THEN 'Seen 15-21 Days'
              ELSE 'Seen 22-30 Days'
              END;;
  }

  dimension: days_seen_last_31 {
    type: number
    sql: ${TABLE}.days_seen_last_31 ;;
  }

  measure: avg_cnt_cookies {
    type: number
    sql: ROUND(SUM(${TABLE}.cnt_cookies)/CAST(COUNT(DISTINCT ${event_date_raw}) AS REAL),0) ;;
  }

}
