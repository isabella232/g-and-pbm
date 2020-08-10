view: unified_client_id_health_stats_histogram {
  sql_table_name: auto_clientidentifiers.unified_client_id_health_stats_histogram ;;
  suggestions: no

  dimension: bin_lower {
    type: number
    sql: ${TABLE}.bin_lower ;;
  }

  dimension: bin_mid {
    type: number
    value_format_name: id
    sql: ${TABLE}.bin_mid ;;
  }

  dimension: bin_upper {
    type: number
    sql: ${TABLE}.bin_upper ;;
  }

  dimension_group: generation {
    type: time
    sql: DATE_PARSE(${TABLE}.date_p,'%Y%m%d') ;;
    timeframes: [date,month,quarter,year]
  }

  measure: count_unified_client_id_health_stats_histogram {
    type: sum
    sql: ${TABLE}."count" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
