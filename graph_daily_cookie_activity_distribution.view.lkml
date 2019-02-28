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

  dimension: mapping_type {
    type: string
    sql: ${TABLE}.mappingtype ;;
  }

  dimension: days_seen_last_31 {
    type: number
    sql: ${TABLE}.days_seen_last_31 ;;
  }

  measure: cnt_cookies {
    type: sum
    sql: ${TABLE}.cnt_cookies ;;
  }

}
