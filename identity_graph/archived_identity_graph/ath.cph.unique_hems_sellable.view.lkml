view: unique_hems_sellable {
  derived_table: {
    sql: /*SELECT approx_distinct(cookie) total
      FROM auto_sellable.sellable_pair
      WHERE date_p = '20190910'*/

      SELECT * FROM tmp_looker.unique_hems_sellable
       ;;
  }

  suggestions: no

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: total {
    type: number
    sql: ${TABLE}.total ;;
  }

  set: detail {
    fields: [total]
  }
}
