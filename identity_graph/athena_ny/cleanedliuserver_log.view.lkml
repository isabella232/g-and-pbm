view: cleanedliuserver_log {
  sql_table_name: auto_logs.cleanedliuserver_log ;;
  suggestions: no

  dimension: date_p {
    type: string
    sql: ${TABLE}.date_p ;;
  }

  dimension: identifier {
    type: string
    sql: ${TABLE}.identifier ;;
  }

  dimension: log {
    type: string
    sql: ${TABLE}.log ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
