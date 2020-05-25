view: third_party_cookie_syncs {
  derived_table: {
    sql: SELECT DATE_PARSE(date,'%Y%m%d') event_date, publisherorappid, identifiertype, requesttype, source, COUNT(*) third_party_cookie_syncs
      FROM auto_logs.idaas_track_log
      WHERE lidid <> '' AND bidderuuid <> ''
      AND DATE_PARSE(CONCAT(year_p,month_p,day_p),'%Y%m%d') BETWEEN CURRENT_DATE - INTERVAL '15' DAY and CURRENT_DATE - INTERVAL '2' DAY
      GROUP BY 1,2,3,4,5
       ;;
  }

  suggestions: no

  dimension_group: event_date {
    type: time
    sql: ${TABLE}.event_date ;;
  }

  dimension: publisher_or_app_id {
    type: string
    sql: ${TABLE}.publisherorappid ;;
    label: "Publisher or App ID"
  }

  dimension: identifier_type {
    type: string
    sql: ${TABLE}.identifiertype ;;
    label: "Bidder Sync ID"
  }

  dimension: request_type {
    type: string
    sql: ${TABLE}.requesttype ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

  measure: third_party_cookie_syncs {
    type: sum
    sql: ${TABLE}.third_party_cookie_syncs ;;
  }

  measure: third_party_cookie_syncs_per_day {
    type: number
    sql: ${third_party_cookie_syncs}/CAST(COUNT(DISTINCT ${event_date_date}) AS REAL) ;;
    value_format_name: decimal_0
  }

}
