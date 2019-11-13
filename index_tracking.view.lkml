view: index_tracking {
  derived_table: {
    sql: SELECT
      DATE_TRUNC('hour',PARSE_DATETIME(CONCAT(date,time),'yyyyMMddHH:mm:ss.SSS')) event_timestamp,
      REGEXP_EXTRACT(referer,'(?:[\w-]+\.)+[\w-]+') refererdomain,
      clientname,
      countrylookup country,
      lidid <> '' contains_lidid,
      unifiedid <> '' contains_unifiedid,
      COUNT(*) requests
      FROM auto_logs.idaas_idx_track_log
      WHERE DATE_TRUNC('hour',PARSE_DATETIME(CONCAT(date,time),'yyyyMMddHH:mm:ss.SSS')) >= CURRENT_DATE - INTERVAL '7' DAY
      GROUP BY 1,2,3,4,5,6
       ;;
  }

  suggestions: no

  dimension_group: event_timestamp {
    type: time
    sql: ${TABLE}."event_timestamp" ;;
  }

  dimension: refererdomain {
    type: string
    sql: ${TABLE}.refererdomain ;;
  }

  dimension: clientname {
    type: string
    sql: ${TABLE}.clientname ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: contains_lidid {
    type: string
    sql: ${TABLE}.contains_lidid ;;
  }

  dimension: contains_unifiedid {
    type: string
    sql: ${TABLE}.contains_unifiedid ;;
  }

  measure: sum_requests {
    type: sum
    sql: ${TABLE}.requests ;;
  }
}
