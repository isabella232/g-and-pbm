view: mapping_type_click_performance_rtb {
  derived_table: {
    sql: SELECT PARSE_DATE('%Y%m%d',REGEXP_EXTRACT(a._TABLE_SUFFIX,r"(\d{8})$")) event_date,
      a.root.bidder_id,
      a.root.dev_type,
      a.root.dev_model,
      a.root.os_version,
      idaas_algo,
      ARRAY_LENGTH(SPLIT(a.root.idaas_algo,',')) = 1 unique_pairing,
      a.root.idaas_v,
      a.root.idaas_group,
      COUNT(*) impressions,
      SUM(a.root.advertiser_spent) advertiser_spend,
      SUM(a.root.publisher_revenue) publisher_revenue,
      SUM(b.clicks) clicks
      FROM `userver_logs_ssp.imp_*` a
      LEFT JOIN (
       SELECT PARSE_DATE('%Y%m%d',REGEXP_EXTRACT(_TABLE_SUFFIX,r"(\d{8})$")) event_date, root.decision_id, root.redecision_attempt, root.creative_id, root.md5, COUNT(*) clicks
       FROM `userver_logs_ssp.click_*`
       WHERE PARSE_DATE('%Y%m%d',REGEXP_EXTRACT(_TABLE_SUFFIX,r"(\d{8})$")) >= DATE_SUB(CURRENT_DATE(), INTERVAL 28 DAY)
       AND REGEXP_CONTAINS(_TABLE_SUFFIX, r"^[A-Za-z0-9]{5}_[\d]{8}")
       GROUP BY 1,2,3,4,5
        ) b
      ON a.root.decision_id = b.decision_id
      AND a.root.md5 = b.md5
      AND a.root.redecision_attempt = b.redecision_attempt
      AND a.root.creative_id = b.creative_id
      CROSS JOIN UNNEST(SPLIT(a.root.idaas_algo,',')) AS idaas_algo
      WHERE a.root.bidder_id NOT IN (1118,88048)
      AND REGEXP_CONTAINS(a._TABLE_SUFFIX, r"^[A-Za-z0-9]{5}_[\d]{8}")
      AND a.root.advertiser_spent > 0
      AND PARSE_DATE('%Y%m%d',REGEXP_EXTRACT(a._TABLE_SUFFIX,r"(\d{8})$")) >= DATE_SUB(CURRENT_DATE(), INTERVAL 28 DAY)
      AND a.root.demand_type = 'default'
      AND a.root.pricing_type = 'CPMVbid'
      AND (PARSE_DATE('%Y%m%d',REGEXP_EXTRACT(a._TABLE_SUFFIX,r"(\d{8})$")) >= b.event_date OR b.event_date IS NULL)
      GROUP BY 1,2,3,4,5,6,7,8,9
       ;;

    datagroup_trigger: new_imp_day_data
  }

  suggestions: no

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: event {
    type: time
    sql: ${TABLE}.event_date ;;
    timeframes: [date,day_of_week,week,month]
    convert_tz: no
    datatype: date
  }

  dimension: bidder_id {
    type: number
    sql: ${TABLE}.bidder_id ;;
  }

  dimension: device_type {
    type: string
    sql: ${TABLE}.dev_type ;;
    group_label: "Device"
  }

  dimension: device_model {
    type: string
    sql: ${TABLE}.dev_model ;;
    group_label: "Device"
  }

  dimension: operating_system_version {
    type: string
    sql: ${TABLE}.os_version ;;
    group_label: "Device"
  }

  dimension: algorithm_name {
    type: string
    sql: ${TABLE}.idaas_algo ;;
    group_label: "Algorithm"
  }

  dimension: unique_algorithm_pairing {
    type: yesno
    sql: ${TABLE}.unique_pairing ;;
    group_label: "Algorithm"
    description: "Impression was credited to only one algorithm type"
  }

  dimension: idaas_version {
    type: number
    label: "IDaaS Version"
    sql: ${TABLE}.idaas_v ;;
    group_label: "IDaaS"
  }

  dimension: experimentation_group {
    type: string
    sql: ${TABLE}.idaas_group ;;
    group_label: "IDaaS"
  }

  dimension: is_deterministic_algorithm {
    type: yesno
    sql: ${algorithm_name} LIKE 'd/%' AND ${algorithm_name} <> 'd/sourced' ;;
    description: "Algorithm generates pairings from deterministic methods using first party data"
    hidden: yes
  }

  dimension: is_third_party_algorithm {
    type: yesno
    sql: ${algorithm_name} IN ('d/sourced','lrxd') ;;
    description: "Algorithm sources pairings from third party providers"
    hidden: yes

  }

  dimension: is_probability_algorithm {
    type: yesno
    sql: NOT(${is_deterministic_algorithm} OR ${is_third_party_algorithm}) ;;
    description: "Algorithm generates pairings from probabilistic methods using first party data"
    hidden: yes
  }

  dimension: algorithm_classification_type {
    type: string
    sql: CASE WHEN ${is_third_party_algorithm} THEN 'Third Party Type'
              WHEN ${is_deterministic_algorithm} THEN 'First Party Deterministic Type'
              WHEN ${is_probability_algorithm} THEN 'Probabilistic Type'
              ELSE 'No Type'
              END ;;
    description: "General algorithm groupings based on how pairings are generated"
  }

  measure: impressions {
    type: sum
    sql: ${TABLE}.impressions ;;
  }

  measure: gross_revenue {
    type: sum
    sql: ${TABLE}.advertiser_spend ;;
  }

  measure: clicks {
    type: sum
    sql: ${TABLE}.clicks ;;
  }

  measure: cost_per_click {
    type: number
    sql: ${gross_revenue}/CAST(NULLIF(${clicks},0) AS FLOAT64) ;;
    value_format_name: usd
  }

  measure: click_through_rate {
    type: number
    sql: ${clicks}/CAST(NULLIF(${impressions},0) AS FLOAT64) ;;
    value_format_name: percent_2
  }

  measure: gross_ecpm {
    type: number
    sql: ${gross_revenue}/CAST(NULLIF(${impressions},0) AS FLOAT64) * 1000;;
    value_format_name: usd
    label: "Gross eCPM"
  }

  measure: net_revenue {
    type: sum
    sql: ${TABLE}.publisher_revenue ;;
    value_format_name: usd
  }

  measure: margin_per_impression {
    type: number
    sql: (${gross_revenue} - ${net_revenue})/CAST(NULLIF(${impressions},0) AS FLOAT64) ;;
  }

  measure: count_classes {
    type: count_distinct
    sql: ${algorithm_name} ;;
  }

  set: detail {
    fields: [
      event_date,
      bidder_id,
      device_type,
      device_model,
      operating_system_version,
      algorithm_name,
      unique_algorithm_pairing,
      idaas_version,
      experimentation_group
    ]
  }
}
