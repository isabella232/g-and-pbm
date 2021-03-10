view: narrative_unique_pairs {
  derived_table: {
    sql: SELECT COUNT(*) total
      FROM auto_deliverable.narrative_deliverable_pair_with_attributes
      WHERE date_p = '20190921'
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
