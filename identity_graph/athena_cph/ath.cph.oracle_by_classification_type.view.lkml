view: oracle_by_classification_type {
  derived_table: {
    sql: SELECT 'oracle' company ,classification, COUNT(*) total FROM auto_deliverable.oracle_deliverable_pair_with_attributes WHERE date_p = '20190915' GROUP BY 2
      ;;
  }

  suggestions: no

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: company {
    type: string
    sql: ${TABLE}.company ;;
  }

  dimension: classification {
    type: string
    sql: ${TABLE}.classification ;;
  }

  measure: total {
    type: sum
    sql: ${TABLE}.total ;;
  }

  set: detail {
    fields: [company, classification, total]
  }
}
