view: unique_publisher_hashes {
  derived_table: {
    sql: SELECT publisher_id, COUNT(email_hash) count_email_hash, COUNT(CASE WHEN count_publishers = 1 THEN email_hash END) unique_email_hashes
      FROM
      (SELECT COALESCE(a.root.md5,a.root.sha1,a.root.sha2) email_hash, ARRAY_LENGTH(ARRAY_AGG(DISTINCT a.root.publisher_id)) count_publishers,
      ARRAY_AGG(DISTINCT a.root.publisher_id) publisher_array
      FROM `userver_logs_ssp.imp_*` a
      WHERE REGEXP_CONTAINS(a._TABLE_SUFFIX, r"^[A-Za-z0-9]{5}_[\d]{8}")
      AND PARSE_DATE('%Y%m%d',REGEXP_EXTRACT(a._TABLE_SUFFIX,r"(\d{8})$")) BETWEEN DATE_SUB(CURRENT_DATE(),INTERVAL 28 DAY) AND DATE_SUB(CURRENT_DATE(),INTERVAL 1 DAY)
      GROUP BY 1) pub
      CROSS JOIN UNNEST(publisher_array) as publisher_id
      GROUP BY 1
       ;;
  datagroup_trigger: new_imp_day
  }


  dimension: publisher_id {
    type: number
    sql: ${TABLE}.publisher_id ;;
  }

  measure: total_served_email_hashes {
    type: sum
    sql: ${TABLE}.count_email_hash ;;
  }

  measure: served_exclusive_email_hashes {
    type: sum
    sql: ${TABLE}.unique_email_hashes ;;
  }

  measure: exclusive_hash_rate {
    type: number
    sql: ${served_exclusive_email_hashes}/CAST(NULLIF(${total_served_email_hashes},0) AS FLOAT64) ;;
    value_format_name: percent_0
    description: "Exclusive Email Hashes ÷ Total Served Email Hashes"
  }
}
