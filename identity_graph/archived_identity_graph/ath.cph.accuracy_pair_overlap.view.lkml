view: accuracy_pair_overlap {
  derived_table: {
    sql: WITH pair_ttl AS (
  SELECT DATE_PARSE(date_p,'%Y%m%d') event_date, mappingtype, pairs
  FROM auto_mappings.pair_stats
  WHERE mappingtype NOT LIKE '%¤%'
  GROUP BY 1,2,3
  ),

pair_overlap AS (
SELECT DATE_PARSE(a.date_p,'%Y%m%d') event_date,
/*ARRAY_SORT(ARRAY [a.mappingtype, r.mkeys])[1] map_type_1,
ARRAY_SORT(ARRAY [a.mappingtype, r.mkeys])[2] map_type_2,*/
a.mappingtype map_type_1,
r.mkeys map_type_2,
overlaps[r.mkeys] pair_overlap
FROM auto_mappings.pair_overlaps a
CROSS JOIN UNNEST(MAP_KEYS(MAP_FILTER(a.overlaps, (k,v) -> k NOT LIKE '%¤%'))) as r (mkeys)
WHERE a.mappingtype NOT LIKE '%¤%'
GROUP BY 1,2,3,4
  )

SELECT a.event_date, a.map_type_1, b.pairs map_type_1_pair_ttl, a.map_type_2, a.pair_overlap, a.pair_overlap/CAST(b.pairs AS REAL) pct_overlap
FROM pair_overlap a
LEFT JOIN pair_ttl b
ON a.event_date = b.event_date AND a.map_type_1 = b.mappingtype
       ;;
  }

  suggestions: no

  dimension_group: event_date {
    type: time
    sql: ${TABLE}.event_date ;;
  }

  dimension: primary_mapping_type_classification {
    type: string
    sql: CASE WHEN ${primary_mapping_type} LIKE 'sourced/%' THEN 'sourced'
           WHEN REGEXP_LIKE(${primary_mapping_type},'^(d\/|dr\/|esp)') THEN 'deterministic'
           WHEN REGEXP_LIKE(${primary_mapping_type},'^(3m|acc)') THEN 'high accuracy probabilistic'
           ELSE 'low accuracy probabilistic'
           END ;;
  }

  dimension: primary_mapping_type {
    type: string
    sql: ${TABLE}.map_type_1 ;;
  }

  dimension: secondary_mapping_type {
    type: string
    sql: ${TABLE}.map_type_2 ;;
    description: "Pivot Mapping Type"
  }

  measure: pair_overlap {
    type: average
    sql: ${TABLE}.pair_overlap ;;
    description: "Overlap between two mapping types"
  }

  measure: pct_pair_overlap {
    type: average
    sql: ${TABLE}.pct_overlap ;;
    value_format_name: percent_0
    description: "Percent of primary's cookies shared with the secondary mapping type"
  }

  measure: primary_total_pairs {
    type: average
    sql: ${TABLE}.map_type_1_pair_ttl ;;
    hidden: yes
  }

}
