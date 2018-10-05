view: segmentation_events {
  sql_table_name: auto_segment.segment_count_derived ;;
  suggestions: no

  dimension_group: event {
    datatype: date
    type: time
    timeframes: [date,week,month,quarter,day_of_month,day_of_week]
    sql: DATE_PARSE(${TABLE}.date_p,'%Y%m%d') ;;
  }

  dimension: identifier_type {
    type: string
    sql: ${TABLE}.identifier_type_p ;;
  }

  dimension: identifiertype {
    type: string
    sql: ${TABLE}.identifiertype ;;
    hidden: yes
  }

  dimension: segment_provider {
    type: string
    sql: ${TABLE}.segment_provider_p ;;
  }

  dimension: segment_id {
    type: string
    sql: ${TABLE}.segmentid ;;
  }

  dimension: segmentprovider {
    type: string
    sql: ${TABLE}.segmentprovider ;;
    hidden: yes
  }

  measure: thirty_day_overlap {
    type: sum
    sql: ${TABLE}.thirtydayoverlap ;;
  }

  measure: events {
    type: sum
    sql: ${TABLE}."count" ;;
  }

  measure: count_segments {
    type: count_distinct
    sql: ${segment_id} ;;
  }
}
