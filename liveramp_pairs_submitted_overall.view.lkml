view: liveramp_pairs_submitted_overall {
  derived_table: {
    sql: SELECT event_date, COUNT(DISTINCT emailHash_pair) distinct_pairings_submitted,
                    COUNT(DISTINCT CASE WHEN log_type = 'track' THEN emailHash_pair END) distinct_email_pairings_submitted,
                    COUNT(DISTINCT CASE WHEN log_type = 'sync' THEN emailHash_pair END) distinct_web_pairings_submitted
FROM
(SELECT * FROM
(SELECT
PARSE_DATE('%Y%m%d',date) date, 'sync' as log_type,
CONCAT(email_hash,lidid) emailHash_pair,
GENERATE_DATE_ARRAY(PARSE_DATE('%Y%m%d',date),LEAST(DATE_SUB(DATE_ADD(DATE_TRUNC(PARSE_DATE('%Y%m%d',date), MONTH), INTERVAL 1 MONTH), INTERVAL 1 DAY),DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY))) event_date_array
FROM `elite-contact-671.noid.sync_logs_*`
WHERE (sync_type = 'sync' OR source = 'safe_rtb')
AND pixel LIKE '%ei.rlcdn.com%'
AND DATE_TRUNC(PARSE_DATE('%Y%m%d',REGEXP_EXTRACT(_TABLE_SUFFIX,r"(\d{8})$")), MONTH) >= DATE_SUB(DATE_TRUNC(DATE_ADD(CURRENT_DATE(), INTERVAL -1 DAY), MONTH), INTERVAL 1 MONTH)
AND PARSE_DATE('%Y%m%d',date) < CURRENT_DATE()
)
UNION ALL
(SELECT
PARSE_DATE('%Y%m%d',date) date, 'track' as log_type,
CONCAT(md5,cookie) emailHash_pair,
GENERATE_DATE_ARRAY(PARSE_DATE('%Y%m%d',date),LEAST(DATE_SUB(DATE_ADD(DATE_TRUNC(PARSE_DATE('%Y%m%d',date), MONTH), INTERVAL 1 MONTH), INTERVAL 1 DAY),DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY))) event_date_array
FROM `elite-contact-671.noid.track_logs_*`
WHERE source = 'safe_rtb'
AND DATE_TRUNC(PARSE_DATE('%Y%m%d',REGEXP_EXTRACT(_TABLE_SUFFIX,r"(\d{8})$")), MONTH) >= DATE_SUB(DATE_TRUNC(DATE_ADD(CURRENT_DATE(), INTERVAL -1 DAY), MONTH), INTERVAL 1 MONTH)
AND PARSE_DATE('%Y%m%d',date) < CURRENT_DATE()
)
) a,
UNNEST(event_date_array) as event_date
GROUP BY 1
 ;;

datagroup_trigger: new_sync_day
  }

  dimension_group: event {
    type: time
    sql: ${TABLE}.event_date ;;
    timeframes: [date,day_of_month,week,month]
    convert_tz: no
    datatype: date
  }

  measure: pairings_total {
    type: max
    sql: ${TABLE}.distinct_pairings_submitted ;;
  }

  measure: pairings_track_log {
    type: max
    sql: ${TABLE}.distinct_email_pairings_submitted ;;
  }

  measure: pairings_sync_log {
    type: max
    sql: ${TABLE}.distinct_web_pairings_submitted ;;
  }

  set: detail {
    fields: [event_date]
  }
}
