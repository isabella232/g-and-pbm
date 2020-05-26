view: narrative_thirdpartyids_hems {
  derived_table: {
    sql: SELECT approx_distinct(cookie) hems, approx_distinct(piiidentifier) third_party_ids
      FROM auto_deliverable.narrative_deliverable_pair_with_attributes
      WHERE date_p = '20190921'
       ;;
  }

  suggestions: no

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: hems {
    type: sum
    sql: ${TABLE}.hems ;;
  }

  measure: third_party_ids {
    type: sum
    sql: ${TABLE}.third_party_ids ;;
  }

  set: detail {
    fields: [hems, third_party_ids]
  }
}
