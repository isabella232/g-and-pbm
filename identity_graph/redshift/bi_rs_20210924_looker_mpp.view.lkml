view: bi_rs_20210924_looker_mpp {
  sql_table_name: looker.bi_rs_20210924_looker_mpp ;;

  dimension: bsn_imps {
    type: number
    sql: ${TABLE}.bsn_imps ;;
  }

  dimension: decisions {
    type: number
    sql: ${TABLE}.decisions ;;
  }

  dimension: default_clicks {
    type: number
    sql: ${TABLE}.default_clicks ;;
  }

  dimension: default_imps {
    type: number
    sql: ${TABLE}.default_imps ;;
  }

  dimension: default_rev {
    type: number
    sql: ${TABLE}.default_rev ;;
  }

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

  dimension: imps {
    type: number
    sql: ${TABLE}.imps ;;
  }

  dimension: mm_imps {
    type: number
    sql: ${TABLE}.mm_imps ;;
  }

  dimension: noads {
    type: number
    sql: ${TABLE}.noads ;;
  }

  dimension: os {
    type: string
    sql: ${TABLE}.os ;;
  }

  dimension: ttd_imps {
    type: number
    sql: ${TABLE}.ttd_imps ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
