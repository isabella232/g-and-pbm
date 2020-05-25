view: cookie_hash_ranks_by_cookie_domain {
  derived_table: {
    sql: SELECT * FROM tmp_looker.cookie_hash_ranks_by_cookie_domain
      ;;
  }

  suggestions: no

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: cookiedomain {
    type: string
    sql: ${TABLE}.cookiedomain ;;
  }

  dimension: cluster_size {
    type: string
    sql: ${TABLE}.cluster_size ;;
  }

  measure: clusters {
    type: sum
    sql: ${TABLE}.clusters ;;
  }

  set: detail {
    fields: [cookiedomain, cluster_size, clusters]
  }
}
