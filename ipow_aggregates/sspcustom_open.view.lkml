view: sspcustom_open {
  sql_table_name: auto_sspaggregates.sspcustom_open ;;
  suggestions: no

  dimension: date {
    type: string
    sql: ${TABLE}."date" ;;
  }

  dimension: date_p {
    type: string
    sql: ${TABLE}.date_p ;;
  }

  dimension: dev_type {
    type: string
    sql: ${TABLE}.dev_type ;;
  }

  dimension: nbrowser {
    type: string
    sql: ${TABLE}.nbrowser ;;
  }

  dimension: opens {
    type: number
    sql: ${TABLE}.opens ;;
  }

  dimension: publisher_id {
    type: number
    sql: ${TABLE}.publisher_id ;;
  }

  dimension: template_id {
    type: number
    sql: ${TABLE}.template_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
