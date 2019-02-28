view: accuracy_hash_rank {
  derived_table: {
    sql: SELECT DATE_PARSE(date_p,'%Y%m%d') event_date, mappingtype, r.attached_cookies, rankcounts[r.attached_cookies] cnt_hashes
      FROM auto_mappings.hash_rank
      CROSS JOIN UNNEST(MAP_KEYS(rankcounts)) as r (attached_cookies)
      WHERE mappingtype NOT LIKE '%¤%'
       ;;
  }

  suggestions: no

  dimension_group: event {
    type: time
    sql: ${TABLE}.event_date ;;
  }

  dimension: mappingtype {
    type: string
    sql: ${TABLE}.mappingtype ;;
  }

  dimension: attached_cookies {
    type: number
    sql: ${TABLE}.attached_cookies ;;
  }

  measure: cnt_hashes {
    type: sum
    sql: ${TABLE}.cnt_hashes ;;
  }

}
