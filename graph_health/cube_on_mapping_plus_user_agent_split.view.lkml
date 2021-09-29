view: cube_on_mapping_plus_user_agent_split {
  derived_table: {
    sql: SELECT * FROM auto_reports.cube_on_mapping_plus_user_agent_split WHERE date_p IN (SELECT date_p FROM auto_reports.cube_on_mapping_plus_user_agent_split group by date_p order by date_p desc limit 30)  ;;
  }
  suggestions: no

  dimension: browser {
    type: string
    sql: ${TABLE}.browser ;;
  }

  dimension: count_cube_on_mapping_plus_user_agent_split {
    type: number
    sql: ${TABLE}."count" ;;
  }

  dimension: date {
    type: string
    sql: ${TABLE}."date" ;;

  }

  dimension: date_p {
    type: string
    sql: ${TABLE}.date_p ;;
  }

  dimension: devicetype {
    type: string
    sql: ${TABLE}.devicetype ;;
  }

  dimension: mappingtype {
    type: string
    sql: ${TABLE}.mappingtype ;;
  }

  dimension: os {
    type: string
    sql: ${TABLE}.os ;;
  }

  dimension: stats_producer_p {
    type: string
    sql: ${TABLE}.stats_producer_p ;;
  }

  dimension: statsproducer {
    type: string
    sql: ${TABLE}.statsproducer ;;
  }

  dimension: statstype {
    type: string
    sql: ${TABLE}.statstype ;;
  }

  dimension: requesttype {
    type: string
    sql: ${TABLE}.requesttype ;;
  }

  measure: count {
    type: sum
    sql: ${TABLE}.count ;;
    value_format_name: decimal_4
    drill_fields: []
  }
}
