view: hash_validity {
  sql_table_name: looker.hash_validity ;;

  dimension_group: event {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.event_date ;;
  }

  dimension: publisher_id {
    type: number
    sql: ${TABLE}.publisher_id ;;
  }

  measure: count_invalid_hashes {
    type: sum
    sql: ${TABLE}.count_invalid_hash ;;
    description: "Number of malformed hashes sent in the last 7 days"
  }

  measure: count_md5_hashes {
    type: sum
    sql: ${TABLE}.count_md5_hash ;;
    description: "Number of MD5 hashes sent in the last 7 days"
  }

  measure: count_sha1_hashes {
    type: sum
    sql: ${TABLE}.count_sha1_hash ;;
    description: "Number of SHA1 hashes sent in the last 7 days"
  }

  measure: count_sha2_hashes {
    type: sum
    sql: ${TABLE}.count_sha2_hash ;;
    description: "Number of SHA2 hashes sent in the last 7 days"
  }

  measure: total_email_hashes {
    type: sum
    sql: ${TABLE}.total_email_hash ;;
    description: "Total number of hashes sent in the last 7 days"
  }

  measure: total_exclusive_email_hashes {
    type: sum
    sql: ${TABLE}.total_exclusive_email_hash ;;
    description: "Total number of hashes sent in the last 7 days that were only seen on this publisher"
  }

  measure: exclusive_hash_ratio {
    type: number
    sql: ${total_exclusive_email_hashes}/NULLIF(${total_email_hashes},0)::FLOAT ;;
    value_format_name: percent_0
    description: "Total Exclusive Email Hash ÷ Total Email Hash"
  }

}
