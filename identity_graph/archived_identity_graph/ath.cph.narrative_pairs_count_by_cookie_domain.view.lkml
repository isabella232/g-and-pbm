view: narrative_pairs_count_by_cookie_domain {
  derived_table: {
    sql: SELECT cookiedomain, COUNT(*) total
      FROM auto_deliverable.narrative_deliverable_pair_with_attributes
      WHERE date_p = '20190921'
      GROUP BY 1
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
