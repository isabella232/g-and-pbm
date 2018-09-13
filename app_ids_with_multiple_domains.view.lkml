view: app_ids_with_multiple_domains {
  sql_table_name: dsa.app_ids_with_multiple_domains ;;

  dimension: app_id {
    type: string
    sql: ${TABLE}.app_id ;;
  }

  dimension: domain_name {
    type: string
    sql: ${TABLE}.domain_name ;;
  }

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

  dimension: primary_key {
    type: string
    sql: ${TABLE}.event_date::VARCHAR || ${TABLE}.app_id ;;
    primary_key: yes
    hidden: yes
  }

  measure: page_views {
    type: sum
    sql: ${TABLE}.page_views ;;
  }

  measure: count_app_ids {
    type: count_distinct
    sql: ${app_id} ;;
  }

  measure: domains {
    type: average_distinct
    sql: ${TABLE}.count_domains ;;
    sql_distinct_key: ${primary_key} ;;
    hidden: yes
  }

  measure: count_domains {
    type: count_distinct
    sql: ${domain_name} ;;
  }
}
