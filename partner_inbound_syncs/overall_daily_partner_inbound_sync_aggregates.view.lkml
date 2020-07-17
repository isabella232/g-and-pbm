view: overall_daily_partner_inbound_sync_aggregates {
  sql_table_name: auto_reports.overall_daily_partner_inbound_sync_aggregates ;;
  suggestions: no

  dimension: date {
    type: string
    sql: ${TABLE}."date" ;;
  }

  dimension: date_p {
    type: string
    sql: ${TABLE}.date_p ;;
  }

  dimension: distinctbidderuuidcount {
    type: number
    sql: ${TABLE}.distinctbidderuuidcount ;;
  }

  dimension: distinctlididcount {
    type: number
    sql: ${TABLE}.distinctlididcount ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
