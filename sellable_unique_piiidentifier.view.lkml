view: sellable_unique_piiidentifier {
  derived_table: {
    sql: SELECT COUNT(DISTINCT(piiidentifier)) total
      FROM auto_sellable.sellable_pair
      WHERE date_p = '20190910'
       ;;
  }

  suggestions: no

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: total {
    type: sum
    sql: ${TABLE}.total ;;
  }

  set: detail {
    fields: [total]
  }
}
