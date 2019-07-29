view: sellable_pairs_by_cookie_domain {
  derived_table: {
    sql: SELECT REGEXP_EXTRACT(_TABLE_SUFFIX,r"\d{8}$") event_date, region = 'nonus' nonUS,
    cookieDomain, COUNT(DISTINCT piiidentifier) hashes, COUNT(DISTINCT cookie) partner_id, COUNT(*) pairs
    FROM `auto_sellable.sellable_pair__*`
    WHERE REGEXP_EXTRACT(_TABLE_SUFFIX,r"\d{8}$") = (SELECT MAX(REGEXP_EXTRACT(_TABLE_SUFFIX,r"\d{8}$")) FROM `auto_sellable.sellable_pair__*`)
    GROUP BY 1,2,3;;

    datagroup_trigger: new_sellable_pair
  }

  dimension: event_date {
    type: date
    sql: PARSE_DATE('%Y%m%d',${TABLE}.event_date) ;;
  }

  dimension: pair_us_based {
    type: yesno
    sql: NOT(${TABLE}.nonUS) ;;
    label: "Pair USA Based"
  }

  dimension: cookie_domain {
    type: string
    label: "Cookie Domain ID"
    sql: ${TABLE}.cookieDomain ;;
  }

  dimension: is_maid {
    type: yesno
    sql: ${cookie_domain} IN ('aaid','idfa') ;;
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

  measure: sum_hashes {
    type: sum
    sql: ${TABLE}.hashes ;;
    value_format_name: decimal_0
  }

  measure: sum_partner_id {
    type: sum
    sql: ${TABLE}.partner_id ;;
    value_format_name: decimal_0
  }

  measure: sum_pairs {
    type: sum
    sql: ${TABLE}.pairs ;;
    value_format_name: decimal_0
  }

  }
