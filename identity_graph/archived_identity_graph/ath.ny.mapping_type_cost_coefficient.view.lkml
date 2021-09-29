view: mapping_type_cost_coefficient {
  derived_table: {
    sql: SELECT g.*, g.pct_ttl_pairings / a.deduped_wins cost_coeffecient, a.deduped_wins, COALESCE(a.net_revenue_pi,0) net_revenue_pi
      FROM (
        SELECT event_date, mapping_type, pairings, pairings/CAST(SUM(pairings) OVER (PARTITION BY event_date) AS REAL) pct_ttl_pairings
        FROM "default"."no_id_algo_vol_agg_detailed_static"
        WHERE event_date BETWEEN CURRENT_DATE - INTERVAL '56' DAY AND CURRENT_DATE - INTERVAL '1' DAY
        ) g
      LEFT JOIN (
        SELECT event_date, idaas.algo,
        (SUM(advertiser_spent/CARDINALITY(REGEXP_SPLIT(idaas_algo,','))) - SUM(publisher_revenue/CARDINALITY(REGEXP_SPLIT(idaas_algo,','))))/SUM(1/CAST(CARDINALITY(REGEXP_SPLIT(idaas_algo,',')) AS REAL)) net_revenue_pi,
        SUM(1/CAST(CARDINALITY(REGEXP_SPLIT(idaas_algo,',')) AS REAL)) deduped_wins
        FROM ssp_logs.imp
        CROSS JOIN UNNEST(REGEXP_SPLIT(idaas_algo, ',')) as idaas (algo)
        WHERE idaas_algo IS NOT NULL
        AND event_date BETWEEN CURRENT_DATE - INTERVAL '56' DAY AND CURRENT_DATE - INTERVAL '1' DAY
        GROUP BY 1,2
        ) a
      ON g.event_date = a.event_date
      AND g.mapping_type = a.algo
       ;;
  }

  suggestions: no

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: event_date {
    type: date
    sql: ${TABLE}.event_date ;;
  }

  dimension: mapping_type {
    type: string
    sql: ${TABLE}.mapping_type ;;
  }

  measure: pairings {
    type: sum
    sql: ${TABLE}.pairings ;;
  }

  dimension: pct_ttl_pairings {
    type: number
    sql: ${TABLE}.pct_ttl_pairings ;;
    value_format_name: percent_4
  }

  measure: cost_coeffecient {
    type: sum
    sql: ${TABLE}.cost_coeffecient ;;
  }

  measure: deduped_wins {
    type: sum
    sql: ${TABLE}.deduped_wins ;;
  }

  measure: net_revenue_pi {
    type: sum
    sql: ${TABLE}.net_revenue_pi ;;
  }

  set: detail {
    fields: [
      event_date,
      mapping_type,
      pairings,
      pct_ttl_pairings,
      cost_coeffecient,
      deduped_wins,
      net_revenue_pi
    ]
  }
}
