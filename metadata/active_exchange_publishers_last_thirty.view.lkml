view: active_exchange_publishers_last_thirty {

  derived_table: {
    sql: SELECT CAST(publisher_id AS BIGINT) publisher_id, SUM(impressions) impressions_last_30
         FROM "auto_sspaggregates"."sspcustom_exact"
         WHERE DATE_PARSE(date_p,'%Y-%m-%d')
          BETWEEN CURRENT_DATE - INTERVAL '30' DAY AND CURRENT_DATE - INTERVAL '1' DAY
         GROUP BY 1 ;;
  }

  dimension: publisher_id {
    type: number
    sql: ${TABLE}.publisher_id ;;
    value_format_name: id
    primary_key: yes
  }

  dimension: total_impressions_last_thirty {
    sql: ${TABLE}.impressions_last_30 ;;
    type: number
    label: "Total Impressions (Last 30 Days)"
    description: "Exchange impressions, with no filtering except for date"
  }
}
