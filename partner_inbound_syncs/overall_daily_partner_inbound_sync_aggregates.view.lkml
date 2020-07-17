view: overall_daily_partner_inbound_sync_aggregates {
  sql_table_name: auto_reports.overall_daily_partner_inbound_sync_aggregates ;;
  suggestions: no

  dimension: date {
    type: date
    sql: date_parse(${TABLE}.date,'%Y%m%d') ;;
  }

  dimension: date_p {
    type: string
    sql: ${TABLE}.date_p ;;
  }

  measure: distinctbidderuuidcount {
    type: sum
    sql: ${TABLE}.distinctbidderuuidcount ;;
  }

  measure: distinctlididcount {
    type: sum
    sql: ${TABLE}.distinctlididcount ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
