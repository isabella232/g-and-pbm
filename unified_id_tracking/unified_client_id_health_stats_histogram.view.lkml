view: unified_client_id_health_stats_histogram {
  derived_table: {
    sql: SELECT *
      FROM auto_clientidentifiers.unified_client_id_health_stats_growth_histogram
      WHERE CAST(date_p AS integer) > (SELECT CAST(max(date_p) AS INTEGER)-7 FROM auto_clientidentifiers.unified_client_id_health_stats_growth_histogram);;
  }
  suggestions: no

  dimension: bin_lower {
    type: number
    sql: ${TABLE}.bin_lower ;;
  }

  dimension: bin_mid {
    type: number
    sql: ${TABLE}.bin_mid ;;
  }

  dimension: bin_upper {
    type: number
    sql: ${TABLE}.bin_upper ;;
  }

  dimension: count_unified_client_id_health_stats_histogram {
    type: number
    sql: ${TABLE}."count" ;;
  }

  dimension_group: generation {
    type: time
    sql: DATE_PARSE(${TABLE}.date_p,'%Y%m%d') ;;
    timeframes: [date,month,quarter,year]
  }

  measure: count {
    type: sum
    sql: ${TABLE}."count" ;;
  }
}
