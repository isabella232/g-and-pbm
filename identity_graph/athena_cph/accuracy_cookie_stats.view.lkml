view: accuracy_cookie_stats {
  derived_table: {
    sql: SELECT DATE_PARSE(date_p,'%Y%m%d') event_date, mappingtype, identifiers,
      mappedidentifierestimatedtobecommercial._2 pct_estimated_to_be_commercial, mappedidentifierisverified._2 pct_is_verified, mappedidentifieristhirdparty._2 pct_is_third_party, mappedidentifierseenafter._2 pct_is_seen_after,
      mappedidentifierhashighbids._2 pct_high_bids, mappedidentifierhasextremebids._2 pct_extreme_bids
      FROM "auto_mappings"."cookie_stats"
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

  measure: cnt_cookies {
    type: sum
    sql: ${TABLE}.cookies ;;
  }

  measure: pct_estimated_to_be_commercial {
    type: average
    sql: ${TABLE}.pct_estimated_to_be_commercial ;;
    value_format_name: percent_1
  }

  measure: pct_is_verified {
    type: average
    sql: ${TABLE}.pct_is_verified ;;
    value_format_name: percent_1
  }

  measure: pct_is_third_party {
    type: average
    sql: ${TABLE}.pct_is_third_party ;;
    value_format_name: percent_1
  }

  measure: pct_is_seen_after {
    type: average
    sql: ${TABLE}.pct_is_seen_after ;;
    value_format_name: percent_1
  }

  measure: pct_high_bids {
    type: average
    sql: ${TABLE}.pct_high_bids ;;
    value_format_name: percent_1
  }

  measure: pct_extreme_bids {
    type: average
    sql: ${TABLE}.pct_extreme_bids ;;
    value_format_name: percent_1
  }

}

view: accuracy_cookie_stats_modified {
  extends: [accuracy_cookie_stats]

  dimension: mapping_type {
    hidden: yes
  }

  dimension: event_date {
    hidden: yes
  }

  measure: cnt_cookies {
    type: sum
    sql: ${TABLE}.cookies ;;
  }

  measure: pct_estimated_to_be_commercial {
    group_label: "Cookie Stats"
  }

  measure: pct_is_verified {
    group_label: "Cookie Stats"
  }

  measure: pct_is_third_party {
    group_label: "Cookie Stats"
  }

  measure: pct_is_seen_after {
    group_label: "Cookie Stats"
  }

  measure: pct_high_bids {
    group_label: "Cookie Stats"
  }

  measure: pct_extreme_bids {
    group_label: "Cookie Stats"
  }
}
