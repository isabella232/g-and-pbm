view: partner_inbound_aggs {
  sql_table_name: auto_reports.detailed_daily_partner_inbound_sync_aggregates ;;
  suggestions: no

  dimension_group: run {
    description: "Date of log file"
    type: time
    timeframes: [date,day_of_month,day_of_week,month,year]
    sql: DATE_PARSE(${TABLE}.date,'%Y%m%d') ;;
  }

  dimension: publisherorappid {
    type: string
    sql: ${TABLE}.publisherorappid ;;
    link: {
      label: "Partner Syncs Explorer"
      url: "/dashboards-next/746?PublisherorAppID={{ value | url_encode }} "
    }
  }

  dimension: bidderuuid {
    type: string
    sql: ${TABLE}.bidderuuid ;;
    link: {
      label: "Partner Syncs Explorer"
      url: "/dashboards-next/746?BidderUUID={{ value | url_encode }} "
    }
  }

  dimension: lidid {
    type: string
    sql: ${TABLE}.lidid ;;
    link: {
      label: "Partner Syncs Explorer"
      url: "/dashboards-next/746?LIDID={{ value | url_encode }} "
    }
  }

  dimension: region {
    type: string
    sql:  ${TABLE}.region ;;
  }

  # Extra Dimensions #

  dimension: valid_bidderuuid {
    type: yesno
    sql: ${TABLE}.bidderuuid IS NOT NULL AND ${TABLE}.bidderuuid <> '';;
  }

  dimension: valid_lidid {
    type: yesno
    sql: ${TABLE}.lidid IS NOT NULL AND ${TABLE}.lidid <> '';;
  }

  measure: partner_count {
    type: count_distinct
    sql: ${TABLE}.publisherorappid;;
    value_format_name: decimal_0
  }

  measure: requests {
    type: sum
    sql:  ${TABLE}.count;;
    drill_fields: [partner_drill*]
  }

  # Drill Measures #

  measure: count {
    hidden: yes
    type: sum
    drill_fields: [partner_drill*]
    sql: ${TABLE}.count ;;
  }


  # Drill field sets #

  set: partner_drill {
    fields: [bidderuuid,lidid, region, requests]
  }

}
