view: largest_UUIDs_top_20 {
  derived_table: {
    sql: SELECT * FROM auto_clientidentifiers.unified_client_id_health_stats_top_size
WHERE date_p = (SELECT MAX(date_p) FROM auto_clientidentifiers.unified_client_id_health_stats_top_size);;
  }
  suggestions: no

  dimension: unifiedclientid {
    type: string
    sql: ${TABLE}.unifiedclientid ;;
  }

  dimension: size {
    type: number
    sql: ${TABLE}.size ;;
  }

  dimension_group: generation {
    type: time
    sql: DATE_PARSE(${TABLE}.date_p,'%Y%m%d') ;;
    timeframes: [date,month,quarter,year]
  }

}
