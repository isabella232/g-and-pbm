view: sellable_aggs_third_partyids_total {
  derived_table: {
    sql: SELECT sum(cookie_count) third_party_IDs
      FROM no_id_logs.sellable_pairs_cookie
      WHERE event_date = (SELECT max(event_date) FROM no_id_logs.sellable_pairs_cookie)
       ;;
  }

  suggestions: no

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: third_party_ids {
    type: sum
    sql: ${TABLE}.third_party_IDs ;;
  }

  set: detail {
    fields: [third_party_ids]
  }
}
