view: index_tracking {
  derived_table: {
    sql: SELECT
      DATE_TRUNC('hour',PARSE_DATETIME(CONCAT(date,time),'yyyyMMddHH:mm:ss.SSS')) event_timestamp,
      refererapexdomain refererdomain,
      source,
      clientname,
      countrylookup country,
      lidid <> '' contains_lidid,
      query LIKE '%duid=%' contains_fpc,
      query LIKE '%44489=%' contains_tdd,
      mostlikelyemailhash <> '' contains_unifiedid,
      CASE WHEN usedidentifier <> '' AND query LIKE CONCAT('%duid=',usedidentifier,'%') THEN 'FPC'
      WHEN usedidentifier <> '' AND query LIKE CONCAT('%44489=',regexp_extract(usedidentifier, '44489\/(.*)', 1),'%') THEN 'TDD'
      WHEN usedidentifier <> '' AND lidid = usedidentifier THEN 'LIDID' ELSE 'none' END id_used,
      COUNT(*) requests
      FROM auto_logs.idaas_idx_track_log
      WHERE DATE_TRUNC('hour',PARSE_DATETIME(CONCAT(date,time),'yyyyMMddHH:mm:ss.SSS')) >= CURRENT_DATE - INTERVAL '30' DAY
      GROUP BY 1,2,3,4,5,6,7,8,9,10
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
    link: {
      label: "Apex Domain Breakdown"
      url: "/dashboards-next/737?Apex+Domain={{ value | url_encode }} "
    }
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source;;
    suggestions: ["ie","prebid",""]
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

  # dimension used to determine which id was used to resolve to a nonID
  dimension: id_used {
    type: string
    sql: ${TABLE}.id_used ;;
  }

  measure: sum_requests {
    type: sum
    sql: ${TABLE}.requests ;;
  }

  measure: sum_valid_requests {
    type: sum
    sql: CASE WHEN ${contains_fpc} THEN ${TABLE}.requests END ;;
  }

  measure: sum_invalid_requests {
    type: sum
    sql: CASE WHEN ${contains_fpc} = FALSE THEN ${TABLE}.requests END ;;
  }

  # Combinations of IDs the requests come with FPC LIDID TDD
  measure: requests_with_lidid {
    type: sum
    sql: CASE WHEN ${contains_lidid} THEN ${TABLE}.requests END;;
  }

  measure: requests_with_lidid_only {
    type: sum
    sql: CASE WHEN ${contains_lidid} AND ${contains_fpc} = FALSE AND ${contains_tdd} = FALSE THEN ${TABLE}.requests END;;
  }

  measure: requests_with_fpc {
    type: sum
    sql: CASE WHEN ${contains_fpc} THEN ${TABLE}.requests END;;
  }

  measure: requests_with_fpc_only {
    type: sum
    sql: CASE WHEN ${contains_fpc} AND ${contains_lidid} = FALSE AND ${contains_tdd} = FALSE THEN ${TABLE}.requests END;;
  }

  measure: requests_with_tdd {
    type: sum
    sql: CASE WHEN ${contains_tdd} THEN ${TABLE}.requests END;;
  }

  measure: requests_with_tdd_only {
    type: sum
    sql: CASE WHEN ${contains_tdd} AND ${contains_lidid} = FALSE AND ${contains_fpc} = FALSE THEN ${TABLE}.requests END;;
  }

  measure: requests_with_unifiedid {
    type: sum
    sql: CASE WHEN ${contains_unifiedid} AND (${contains_fpc} OR ${contains_tdd}) THEN ${TABLE}.requests END ;;
    hidden: yes
  }

  measure: requests_with_nonid {
    type: sum
    sql: CASE WHEN ${id_used} <> 'none' AND ${contains_fpc} THEN ${TABLE}.requests END ;;
    hidden: yes
  }

  measure: requests_with_lidid_and_fpc {
    type: sum
    sql: CASE WHEN ${contains_lidid} AND ${contains_fpc} AND ${contains_tdd} = FALSE THEN ${TABLE}.requests END;;
  }

  measure: requests_with_lidid_and_tdd {
    type: sum
    sql: CASE WHEN ${contains_lidid} AND ${contains_tdd} AND ${contains_fpc} = FALSE THEN ${TABLE}.requests END;;
  }

  measure: requests_with_tdd_and_fpc {
    type: sum
    sql: CASE WHEN ${contains_lidid} = FALSE AND ${contains_tdd} AND ${contains_fpc} THEN ${TABLE}.requests END;;
  }

  measure: requests_with_lidid_tdd_fpc {
    type: sum
    sql: CASE WHEN ${contains_lidid} AND ${contains_fpc} AND ${contains_tdd} THEN ${TABLE}.requests END;;
  }

# Percent of total for ID and resolution combinations
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
    label: "Pct Valid Resolved Requests"
    sql: ${requests_with_nonid}/CAST(${sum_valid_requests} AS REAL) ;;
    value_format_name: percent_0
  }

  measure: requests_resolved_w_TDD {
    type: sum
    sql:CASE WHEN ${id_used} = 'TDD' AND ${contains_fpc} THEN ${TABLE}.requests END;;
    value_format_name: decimal_0
  }

  measure: resolution_rate_TDD {
    type: number
    label: "Pct Valid requests resolved with TDD"
    sql: ${requests_resolved_w_TDD} /CAST(${sum_valid_requests} AS REAL) ;;
    value_format_name: percent_0
  }

  measure: requests_resolved_w_LIDID {
    type: sum
    sql:CASE WHEN ${id_used} = 'LIDID' AND ${contains_fpc} THEN ${TABLE}.requests END;;
    value_format_name: decimal_0
  }

  measure: resolution_rate_LIDID {
    type: number
    label: "Pct Valid requests resolved with LIDID"
    sql: ${requests_resolved_w_LIDID} /CAST(${sum_valid_requests} AS REAL) ;;
    value_format_name: percent_0
  }

  measure: requests_resolved_w_FPC {
    type: sum
    sql:CASE WHEN ${id_used} = 'FPC' AND ${contains_fpc} THEN ${TABLE}.requests END;;
    value_format_name: decimal_0
  }

  measure: resolution_rate_FPC {
    type: number
    label: "Pct Valid requests resolved with FPC"
    sql: ${requests_resolved_w_FPC} /CAST(${sum_valid_requests} AS REAL) ;;
    value_format_name: percent_0
  }
}
