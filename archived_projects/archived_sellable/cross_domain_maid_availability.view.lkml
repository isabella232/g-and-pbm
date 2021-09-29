view: cross_domain_maid_availability {
  derived_table: {
    sql: with base_agg as (
          SELECT REGEXP_EXTRACT(_TABLE_SUFFIX,r"\d{8}$") event_date, region, piiidentifier, ARRAY_AGG(DISTINCT cookieDomain) cookieDomain_array
          FROM `auto_sellable.sellable_pair_with_attributes__*`
          WHERE REGEXP_EXTRACT(_TABLE_SUFFIX,r"\d{8}$") = (SELECT MAX(REGEXP_EXTRACT(_TABLE_SUFFIX,r"\d{8}$")) FROM `auto_sellable.sellable_pair_with_attributes__*`)
          AND cookieHashRank <= 2
          GROUP BY  1,2,3
          )

        SELECT a.event_date, cookieDomain, a.region = 'us' us_based,
          CASE WHEN 'idfa' IN UNNEST(a.cookieDomain_array) AND 'aaid' IN UNNEST(a.cookieDomain_array) THEN 'idfa and aaid'
          WHEN 'idfa' IN UNNEST(a.cookieDomain_array) THEN 'idfa'
          WHEN 'aaid' IN UNNEST(a.cookieDomain_array) THEN 'aaid'
          ELSE 'none' END maid_types,
          COUNT(*) liids
        FROM base_agg a
        CROSS JOIN UNNEST(a.cookieDomain_array) as cookieDomain
        WHERE cookieDomain NOT IN ('aaid','idfa')
        GROUP BY 1,2,3,4 ;;
    datagroup_trigger: new_sellable_pair
  }

  dimension: event_date {
    type: date
    sql: PARSE_DATE('%Y%m%d',${TABLE}.event_date) ;;
  }

  dimension: cookie_domain {
    type: string
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

  dimension: has_maid {
    type: yesno
    sql: ${available_maids} <> 'none' ;;
  }

  dimension: us_based {
    type: yesno
    sql: ${TABLE}.us_based ;;
    label: "USA Based"
  }

  dimension: available_maids {
    type: string
    sql: ${TABLE}.maid_types ;;
  }

  measure: sum_liids {
    type: sum
    sql: ${TABLE}.liids ;;
  }
}
