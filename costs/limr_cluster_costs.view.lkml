view: limr_cluster_costs {
  derived_table: {
    sql: SELECT usersubcostcenter,
            usercostcenter,
            sum(unblendedcost) cost,
            CAST(min(usagestartdate) AS TIMESTAMP) startdate,
            date_p
          FROM auto_logs.billing_report
          GROUP BY usersubcostcenter, usercostcenter, date_p;;
  }

  dimension: limr_cluster {
    type: string
    sql: ${TABLE}.usersubcostcenter ;;
    primary_key: yes
  }

  dimension: cost_center {
    type: string
    sql: ${TABLE}.usercostcenter ;;
    description: "User filled in cluster cost center"
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
    value_format_name: usd
    hidden: yes
  }

  dimension: report_month {
    type: string
    sql: ${TABLE}.date_p ;;
    description: "Month of report data is derived from."
  }

  dimension_group: start {
    type: time
    timeframes: [raw,date,month,quarter,year,hour_of_day]
    sql: ${TABLE}.startdate ;;
    description: "Start timestamp of LIMR cluster ID"
  }

  measure: sum_cost {
    type: sum
    sql: ${cost} ;;
    value_format_name: usd
  }

}

view: limr_cluster_costs_job_resources {
  extends: [limr_cluster_costs]

  dimension: limr_cluster {
    hidden: yes
  }

  measure: cost_mb {
    label: "Cost (USD)"
    type: number
    sql: SUM(${cost}*${cluster_costs.pct_ttl_lcid_mb});;
    value_format_name: usd
    description: "Cost of item, weighted by MB seconds"
  }

  measure: sum_cost {
    hidden: yes
  }

  dimension: report_month {
    hidden: yes
  }

  dimension: cost_center {
    group_label: "Cluster"
    group_item_label: "Cost Center"

  }
}
