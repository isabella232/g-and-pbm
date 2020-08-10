view: unified_client_id_health_stats_excessive_growth {
  sql_table_name: auto_clientidentifiers.unified_client_id_health_stats_excessive_growth ;;
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
    sql: ${TABLE}.growth1day ;;
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
