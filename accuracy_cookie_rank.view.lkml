view: accuracy_cookie_rank {
  derived_table: {
    sql: SELECT DATE_PARSE(date_p,'%Y%m%d') event_date, mappingtype, r.attached_hashes, rankcounts[r.attached_hashes] cnt_hashes
      FROM "auto_mappings"."cookie_rank"
      CROSS JOIN UNNEST(MAP_KEYS(rankcounts)) as r (attached_hashes)
      WHERE mappingtype NOT LIKE '%¤%'
       ;;
  }

  suggestions: no

  dimension_group: event_date {
    type: time
    sql: ${TABLE}.event_date ;;
  }

  dimension: mappingtype {
    type: string
    sql: ${TABLE}.mappingtype ;;
  }

  dimension: attached_hashes {
    type: number
    sql: ${TABLE}.attached_hashes ;;
  }

  measure: avg_cnt_hashes {
    type: average
    sql: ${TABLE}.cnt_hashes ;;
  }

}
