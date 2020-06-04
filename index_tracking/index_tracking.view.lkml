view: index_tracking {
  derived_table: {
    sql: SELECT
      DATE_TRUNC('hour',PARSE_DATETIME(CONCAT(date,time),'yyyyMMddHH:mm:ss.SSS')) event_timestamp,
      REGEXP_EXTRACT(referer,'(?:[\w-]+\.)+[\w-]+') refererdomain,
      source,
      clientname,
      countrylookup country,
      lidid <> '' contains_lidid,
      query LIKE 'duid=%' contains_fpc,
      query LIKE '44489=%' contains_tdd,
      mostlikelyemailhash <> '' contains_unifiedid,
      COUNT(*) requests
      FROM auto_logs.idaas_idx_track_log
      WHERE DATE_TRUNC('hour',PARSE_DATETIME(CONCAT(date,time),'yyyyMMddHH:mm:ss.SSS')) >= CURRENT_DATE - INTERVAL '7' DAY
      GROUP BY 1,2,3,4,5,6,7,8,9
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

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
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
    type: yesno
    sql: ${TABLE}.contains_lidid ;;
  }

  dimension: contains_fpc {
    type: yesno
    sql: ${TABLE}.contains_fpc;;
  }

  dimension: contains_tdd {
    type: yesno
    sql: ${TABLE}.contains_tdd;;
  }

  dimension: contains_unifiedid {
    type: yesno
    label: "Contains Emailhash"
    sql: ${TABLE}.contains_unifiedid ;;
  }

  measure: sum_requests {
    type: sum
    sql: ${TABLE}.requests ;;
  }

  measure: sum_valid_requests {
    type: sum
    sql: CASE WHEN ${contains_lidid} OR ${contains_fpc} OR ${contains_tdd} THEN ${TABLE}.requests END ;;
  }

  measure: requests_with_lidid {
    type: sum
    sql: CASE WHEN ${contains_lidid} THEN ${TABLE}.requests END;;
    hidden: yes
  }

  measure: requests_with_fpc {
    type: sum
    sql: CASE WHEN ${contains_fpc} THEN ${TABLE}.requests END;;
    hidden: yes
  }

  measure: requests_with_tdd {
    type: sum
    sql: CASE WHEN ${contains_tdd} THEN ${TABLE}.requests END;;
    hidden: yes
  }

  measure: requests_with_unifiedid {
    type: sum
    sql: CASE WHEN ${contains_unifiedid} THEN ${TABLE}.requests END ;;
    hidden: yes
  }

  measure: pct_requests_with_lidid {
    type: number
    sql: ${requests_with_lidid}/CAST(${sum_requests} AS REAL) ;;
    value_format_name: percent_0
  }

  measure: pct_requests_with_fpc {
    type: number
    sql: ${requests_with_fpc}/CAST(${sum_requests} AS REAL) ;;
    value_format_name: percent_0
  }

  measure: pct_requests_with_tdd {
    type: number
    sql: ${requests_with_tdd}/CAST(${sum_requests} AS REAL) ;;
    value_format_name: percent_0
  }

  measure: pct_requests_with_unifiedid {
    type: number
    label: "Pct Resolved Requests"
    sql: ${requests_with_unifiedid}/CAST(${sum_requests} AS REAL) ;;
    value_format_name: percent_0
  }

  measure: pct__valid_requests_with_unifiedid{
    type: number
    label: "Pct Valid Resolved Requests "
    sql: ${requests_with_unifiedid}/CAST(${sum_valid_requests} AS REAL) ;;
    value_format_name: percent_0
  }
}
