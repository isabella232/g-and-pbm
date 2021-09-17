view: partner_cookie_stats {
  sql_table_name: auto_dmps.partner_cookie_stats ;;
  suggestions: no

  dimension: date_p {

    type: string
    sql: ${TABLE}.date_p ;;
  }

  dimension: dayssincelastwrite {
    type: number
    sql: ${TABLE}.dayssincelastwrite ;;
  }

  dimension: domain {
    type: string
    sql: ${TABLE}.domain ;;
  }

  dimension: firstseenat {
    type: string
    sql: ${TABLE}.firstseenat ;;
  }

  dimension: lastbid {
    type: number
    value_format_name: id
    sql: ${TABLE}.lastbid ;;
  }

  dimension: lastseenat {
    type: string
    sql: ${TABLE}.lastseenat ;;
  }

  dimension: numbids {
    type: string
    sql: ${TABLE}.numbids ;;
  }

  dimension: numdeleted {
    type: number
    sql: ${TABLE}.numdeleted ;;
  }

  dimension: numnew {
    type: number
    sql: ${TABLE}.numnew ;;
  }

  dimension: reqtypemap {
    type: string
    sql: ${TABLE}.reqtypemap ;;
  }

  dimension: totalcount {
    type: number
    sql: ${TABLE}.totalcount ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
