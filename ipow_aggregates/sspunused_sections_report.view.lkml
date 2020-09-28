view: sspunused_sections_report {
  sql_table_name: auto_sspaggregates.sspunused_sections_report ;;
  suggestions: no

  dimension: date_p {
    type: string
    sql: ${TABLE}.date_p ;;
  }

  dimension: decisions {
    type: number
    sql: ${TABLE}.decisions ;;
  }

  dimension: impressions {
    type: number
    sql: ${TABLE}.impressions ;;
  }

  dimension: placement_id {
    type: string
    sql: ${TABLE}.placement_id ;;
  }

  dimension: section_id {
    type: string
    sql: ${TABLE}.section_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
