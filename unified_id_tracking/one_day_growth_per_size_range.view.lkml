view: one_day_growth_per_size_range {
  derived_table: {
    sql: SELECT *, ROUND(mean_growth,7) mean_growth_rounded
  FROM auto_clientidentifiers.unified_client_id_health_stats_mean_growth
  WHERE CAST(date_p AS integer) > (SELECT CAST(max(date_p) AS INTEGER)-7 FROM auto_clientidentifiers.unified_client_id_health_stats_mean_growth);;
  }
  suggestions: no

  dimension: size_lower {
    type: number
    sql: ${TABLE}.size_lower ;;
  }

  dimension: size_upper {
    type: number
    sql: ${TABLE}.size_upper ;;
  }

  dimension: bin_elements {
    type: number
    sql: ${TABLE}.bin_elements ;;
  }

  dimension: mean_growth {
    type: number
    sql: ${TABLE}.mean_growth_rounded ;;
  }

  dimension_group: generation {
    type: time
    sql: DATE_PARSE(${TABLE}.date_p,'%Y%m%d') ;;
    timeframes: [date,month,quarter,year]
    full_suggestions: yes
  }
}
