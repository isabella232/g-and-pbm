view: sellable_cookie_domain_cluster_size {
  derived_table: {
    sql: with base_agg as (
        SELECT REGEXP_EXTRACT(_TABLE_SUFFIX,r"\d{8}$") event_date, cookieDomain,
        cookie, region, MAX(cookieHashRank) cluster_size
        FROM `auto_sellable.sellable_pair__*`
        WHERE REGEXP_EXTRACT(_TABLE_SUFFIX,r"\d{8}$") = (SELECT MAX(REGEXP_EXTRACT(_TABLE_SUFFIX,r"\d{8}$")) FROM `auto_sellable.sellable_pair__*`)
        GROUP BY  1,2,3,4
      )

        SELECT cookieDomain, region = 'us' us_based, cluster_size, COUNT(*) clusters
        FROM base_agg
        GROUP BY 1,2,3 ;;
  datagroup_trigger: new_sellable_pair
  }

  dimension: event_date {
    type: date
    sql: PARSE_DATE('%Y%m%d',${TABLE}.event_date) ;;
  }

  dimension: cookie_domain {
    type: string
    label: "Cookie Domain ID"
    sql: ${TABLE}.cookieDomain ;;
  }

  dimension: cookie_domain_name {
    type: string
    sql: CASE ${cookie_domain}
          WHEN '7156' THEN 'MediaMath'
          WHEN '88068' THEN 'Taboola'
          WHEN '5298' THEN 'BidSwitch'
          WHEN '44489' THEN 'The Trade Desk'
          WHEN '91218' THEN 'AppNexus'
          WHEN '79701' THEN 'Datalogix'
          WHEN '82775' THEN 'Adobe'
          WHEN '82774' THEN 'BlueKai'
          WHEN '71340' THEN 'Criteo s2s'
          WHEN '127211' THEN 'Lotame'
          WHEN '177716' THEN 'Conversant'
          WHEN '100905' THEN 'Neustar'
          ELSE ${cookie_domain}
          END;;
  }

  dimension: us_based {
    type: yesno
    sql: ${TABLE}.us_based ;;
    label: "USA Based"
  }

  dimension: cluster_size {
    type: number
    sql: ${TABLE}.cluster_size ;;
    value_format_name: decimal_0
  }

  dimension: cluster_size_tier {
    type: tier
    tiers: [1,2,3,4,5,6,7,8,9,10,25,50,100,500]
    style: integer
    sql: ${cluster_size} ;;
  }

  dimension: is_maid {
    type: yesno
    sql: ${cookie_domain} IN ('aaid','idfa') ;;
  }

  measure: sum_clusters {
    type: sum
    sql: ${TABLE}.clusters ;;
    value_format_name: decimal_0
  }
}
