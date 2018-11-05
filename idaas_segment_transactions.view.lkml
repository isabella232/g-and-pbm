view: idaas_segment_transactions {
  sql_table_name: dsa.idaas_segment_transactions ;;

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

  dimension: identifiertype {
    type: string
    sql: ${TABLE}.identifiertype ;;
  }

  dimension: operation {
    type: string
    sql: ${TABLE}.operation ;;
  }

  dimension: provider {
    type: string
    sql: ${TABLE}.provider ;;
  }

  measure: transactions {
    type: sum
    sql: ${TABLE}.transactions ;;
  }

  measure: identifiers {
    type: sum
    sql: ${TABLE}.identifiers ;;
  }

  measure: distinct_segments {
    type: sum
    sql: ${TABLE}.distinct_segments ;;
  }
}
