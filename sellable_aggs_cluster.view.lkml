view: sellable_aggs_cluster {
  derived_table: {
    sql: SELECT event_date, cluster_size, sum(clusters) cluster_count
      FROM no_id_logs.sellable_pairs_aggregates
      GROUP BY 1,2
      ORDER BY 1,2
       ;;
  }

  suggestions: no

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: event_date {
    type: string
    sql: ${TABLE}.event_date ;;
  }

  dimension: cluster_size {
    type: string
    sql: ${TABLE}.cluster_size ;;
  }

  measure: cluster_count {
    type: sum
    sql: ${TABLE}.cluster_count ;;
  }

  set: detail {
    fields: [event_date, cluster_size, cluster_count]
  }
}
