view: unified_client_id_health_stats_excessive_growth {
  derived_table: {
    sql: SELECT *
FROM auto_clientidentifiers.unified_client_id_health_stats_excessive_growth
WHERE CAST(date_p AS integer) > (SELECT CAST(max(date_p) AS INTEGER)-7 FROM auto_clientidentifiers.unified_client_id_health_stats_excessive_growth);;
  }

  suggestions: no

  dimension_group: generation {
    type: time
    sql: DATE_PARSE(${TABLE}.date_p,'%Y%m%d') ;;
    timeframes: [date,month,quarter,year]
  }

  dimension: unifiedclientid {
    type: string
    sql: ${TABLE}.unifiedclientid ;;
  }

  measure: growth1day {
    type: sum
    sql: ${TABLE}.growth ;;
  }

  measure: size {
    type: sum
    sql: ${TABLE}.size ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
