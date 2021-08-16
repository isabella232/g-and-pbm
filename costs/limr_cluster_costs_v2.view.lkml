view: limr_cluster_costs_v2 {
  derived_table: {
    sql: SELECT * FROM "metrics"."cost_center_cost" where cast(job_start_date as timestamp) > cast(current_date - interval '90' day as timestamp)
      ;;
  }

  suggestions: no

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: job_start_date {
    type: string
    sql: ${TABLE}.job_start_date ;;
  }

  dimension: cost_center {
    type: string
    sql: ${TABLE}.cost_center ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  set: detail {
    fields: [job_start_date, cost_center, cost]
  }
}
