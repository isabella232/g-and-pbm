view: sellable_aggs_clustersize_general {
  derived_table: {
    sql: SELECT cluster_size, sum(clusters) region_count
      FROM no_id_logs.sellable_pairs_aggregates
      WHERE event_date = (SELECT max(event_date) FROM no_id_logs.sellable_pairs_aggregates)
      GROUP BY 1
       ;;
  }

  suggestions: no

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: cluster_size {
    type: string
    sql: ${TABLE}.cluster_size ;;
  }

  measure: region_count {
    type: sum
    sql: ${TABLE}.region_count ;;
  }

  set: detail {
    fields: [cluster_size, region_count]
  }
}
