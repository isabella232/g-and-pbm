view: region_counts {
  derived_table: {
    sql: SELECT region,
      COUNT(*) total
      FROM auto_sellable.sellable_pair
      WHERE date_p = '20190910'
      GROUP BY 1
       ;;
  }

  suggestions: no

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  measure: total {
    type: sum
    sql: ${TABLE}.total ;;
  }

  set: detail {
    fields: [region, total]
  }
}
