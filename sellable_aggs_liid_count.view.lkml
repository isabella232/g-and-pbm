view: sellable_aggs_liid_count {
  derived_table: {
    sql: SELECT distinctpii_count
      FROM no_id_logs.sellable_pairs_pii
      WHERE event_date = (SELECT max(event_date) FROM no_id_logs.sellable_pairs_pii)
       ;;
  }

  suggestions: no

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: distinctpii_count {
    type: sum
    sql: ${TABLE}.distinctpii_count ;;
  }

  set: detail {
    fields: [distinctpii_count]
  }
}
