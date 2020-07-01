view: index_tracking_new_domains_7d {
  derived_table: {
    sql: WITH prev_7d AS (SELECT REGEXP_EXTRACT(referer,'(?:[\w-]+\.)+[\w-]+') refererdomain, count(*) appearances
      FROM prev_auto_logs.idaas_idx_track_log
      WHERE DATE_TRUNC('hour',PARSE_DATETIME(CONCAT(date,time),'yyyyMMddHH:mm:ss.SSS')) >= CURRENT_DATE - INTERVAL '14' DAY
      AND DATE_TRUNC('hour',PARSE_DATETIME(CONCAT(date,time),'yyyyMMddHH:mm:ss.SSS')) <= CURRENT_DATE - INTERVAL '7' DAY
      GROUP BY 1),
      current_7d AS (SELECT REGEXP_EXTRACT(referer,'(?:[\w-]+\.)+[\w-]+') refererdomain, count(*) appearances
      FROM auto_logs.idaas_idx_track_log
      WHERE DATE_TRUNC('hour',PARSE_DATETIME(CONCAT(date,time),'yyyyMMddHH:mm:ss.SSS')) >= CURRENT_DATE - INTERVAL '7' DAY
      GROUP BY 1
      )

      SELECT t1.refererdomain, t1.appearances
      FROM current_7d t1
      LEFT JOIN prev_7d t2 ON t1.refererdomain = t2.refererdomain
      WHERE t2.refererdomain IS NULL
      GROUP BY 1,2
      ORDER BY 2 DESC
       ;;
  }

  suggestions: no

  dimension: refererdomain {
    type: string
    sql: ${TABLE}.refererdomain ;;
  }

  dimension: appearances {
    type: number
    sql: ${TABLE}.appearances ;;
  }

  set: detail {
    fields: [refererdomain, appearances]
  }
}
