view: unique_pairs_sellable_by_cookie_domain {
  derived_table: {
    sql: SELECT * FROM tmp_looker.sellable_unique_pairs_by_cookie_domain
      ;;
  }

  suggestions: no

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: cookiedomain {
    type: string
    sql: ${TABLE}.cookiedomain ;;
  }

  measure: total {
    type: sum
    sql: ${TABLE}.total ;;
  }

  set: detail {
    fields: [cookiedomain, total]
  }
}
