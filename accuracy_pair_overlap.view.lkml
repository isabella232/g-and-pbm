view: accuracy_pair_overlap {
  derived_table: {
    sql: SELECT
      DATE_PARSE(date_p,'%Y%m%d') event_date,
      ARRAY_SORT(ARRAY [mappingtype, r.mkeys])[1] map_type_1,
      ARRAY_SORT(ARRAY [mappingtype, r.mkeys])[2] map_type_2,
      overlaps[r.mkeys] pair_overlap
      FROM "auto_mappings"."pair_overlaps"
      CROSS JOIN UNNEST(MAP_KEYS(MAP_FILTER(overlaps, (k,v) -> k NOT LIKE '%¤%'))) as r (mkeys)
      WHERE mappingtype NOT LIKE '%¤%'
      GROUP BY 1,2,3,4
       ;;
  }

  suggestions: no

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: event_date {
    type: time
    sql: ${TABLE}.event_date ;;
  }

  dimension: map_type_1 {
    type: string
    sql: ${TABLE}.map_type_1 ;;
  }

  dimension: map_type_2 {
    type: string
    sql: ${TABLE}.map_type_2 ;;
  }

  measure: pair_overlap {
    type: sum
    sql: ${TABLE}.pair_overlap ;;
  }

  set: detail {
    fields: [event_date_time, map_type_1, map_type_2, pair_overlap]
  }
}
