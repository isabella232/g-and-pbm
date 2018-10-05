view: intelligent_tracking_prevention {
  derived_table: {
    sql: SELECT a.*, b.conversion_hits
      FROM
      (SELECT
      PARSE_DATE('%Y%m%d',REGEXP_EXTRACT(_TABLE_SUFFIX,r"(\d{8})$")) event_date,
      REGEXP_EXTRACT(root.request.useragent, r"\(([^;\)]*)") operating_system,
      REGEXP_EXTRACT(root.request.useragent, r"\([^;]*;([^;\)]*)") os_version,
      REGEXP_CONTAINS(root.request.useragent,r"Firefox/") is_firefox,
      REGEXP_CONTAINS(root.request.useragent,r"Chrome/") is_chrome,
      NOT(REGEXP_CONTAINS(root.request.useragent,r"Firefox/") OR REGEXP_CONTAINS(root.request.useragent,r"Chrome/"))
      AND REGEXP_CONTAINS(root.request.useragent,r"Safari/") is_safari,
      IFNULL(REGEXP_EXTRACT(root.request.useragent,r"Version/(\S*)\s"),'Not Safari') safari_browser_version,
      root.conversion_id,
      COUNT(*) pixel_hits FROM `userver_logs_ssp.pixel_*`
      WHERE root.conversion_id IN
        (SELECT root.conversion_id
         FROM `userver_logs_ssp.conv_*`
         WHERE PARSE_DATE('%Y%m%d',REGEXP_EXTRACT(_TABLE_SUFFIX,r"(\d{8})$")) > DATE_SUB(CURRENT_DATE, INTERVAL 28 DAY)
         AND REGEXP_CONTAINS(_TABLE_SUFFIX, r"^[A-z0-9]{5}_[\d]{8}")
         GROUP BY 1
         HAVING COUNT(DISTINCT root.campaign_id) = 1
         )
      AND (REGEXP_CONTAINS(root.request.useragent,r"Firefox/") OR REGEXP_CONTAINS(root.request.useragent,r"Chrome/") OR REGEXP_CONTAINS(root.request.useragent,r"Safari/"))
      AND PARSE_DATE('%Y%m%d',REGEXP_EXTRACT(_TABLE_SUFFIX,r"(\d{8})$")) > DATE_SUB(CURRENT_DATE, INTERVAL 28 DAY)
      GROUP BY 1,2,3,4,5,6,7,8) a
      LEFT JOIN
      (SELECT
      PARSE_DATE('%Y%m%d',REGEXP_EXTRACT(_TABLE_SUFFIX,r"(\d{8})$")) event_date,
      REGEXP_EXTRACT(root.request.useragent, r"\(([^;\)]*)") operating_system,
      REGEXP_EXTRACT(root.request.useragent, r"\([^;]*;([^;\)]*)") os_version,
      REGEXP_CONTAINS(root.request.useragent,r"Firefox/") is_firefox,
      REGEXP_CONTAINS(root.request.useragent,r"Chrome/") is_chrome,
      NOT(REGEXP_CONTAINS(root.request.useragent,r"Firefox/") OR REGEXP_CONTAINS(root.request.useragent,r"Chrome/"))
      AND REGEXP_CONTAINS(root.request.useragent,r"Safari/") is_safari,
      IFNULL(REGEXP_EXTRACT(root.request.useragent,r"Version/(\S*)\s"),'Not Safari') safari_browser_version,
      root.conversion_id,
      COUNT(*) conversion_hits FROM `userver_logs_ssp.conv_*`
      WHERE (REGEXP_CONTAINS(root.request.useragent,r"Firefox/") OR REGEXP_CONTAINS(root.request.useragent,r"Chrome/") OR REGEXP_CONTAINS(root.request.useragent,r"Safari/"))
      AND PARSE_DATE('%Y%m%d',REGEXP_EXTRACT(_TABLE_SUFFIX,r"(\d{8})$")) > DATE_SUB(CURRENT_DATE, INTERVAL 28 DAY)
      AND REGEXP_CONTAINS(_TABLE_SUFFIX, r"^[A-z0-9]{5}_[\d]{8}")
      GROUP BY 1,2,3,4,5,6,7,8) b
      ON a.event_date = b.event_date
      AND a.operating_system = b.operating_system
      AND a.os_version = b.os_version
      AND a.is_firefox = b.is_firefox
      AND a.is_chrome = b.is_chrome
      AND a.is_safari = b.is_safari
      AND a.safari_browser_version = b.safari_browser_version
      ANd a.conversion_id = b.conversion_id
       ;;

    datagroup_trigger: new_conv_day_data
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: event {
    type: time
    timeframes: [date,day_of_week,week,month]
    sql: CAST(${TABLE}.event_date AS TIMESTAMP) ;;
  }

  dimension: operating_system {
    type: string
    sql: ${TABLE}.operating_system ;;
  }

  dimension: os_version {
    type: string
    sql: ${TABLE}.os_version ;;
  }

  dimension: is_firefox {
    type: yesno
    sql: ${TABLE}.is_firefox ;;
  }

  dimension: is_chrome {
    type: yesno
    sql: ${TABLE}.is_chrome ;;
  }

  dimension: is_safari {
    type: yesno
    sql: ${TABLE}.is_safari ;;
  }

  dimension: safari_browser_version {
    type: string
    sql: ${TABLE}.safari_browser_version ;;
  }

  dimension: conversion_id {
    type: number
    sql: ${TABLE}.conversion_id ;;
    hidden: yes
  }

  measure: pixel_impressions {
    type: sum
    sql: ${TABLE}.pixel_hits ;;
  }

  measure: conversion_impressions {
    type:sum
    sql: ${TABLE}.conversion_hits ;;
  }

  measure: conversion_to_pixel_ratio {
    type: number
    sql: ${conversion_impressions}/CAST(NULLIF(${pixel_impressions}+${conversion_impressions},0) AS FLOAT64) ;;
    value_format_name: percent_2
    description: "Conversion Impressions ÷ Pixel Impressions"
  }

  set: detail {
    fields: [
      event_date,
      operating_system,
      os_version,
      is_firefox,
      is_chrome,
      is_safari,
      safari_browser_version,
      conversion_id
    ]
  }
}
