view: sellable_pairs_aggregates_info {
  sql_table_name: auto_bidatapipelines.sellable_pairs_aggregates_info ;;
  suggestions: no

  # Standard Dimensions #

  dimension: classification_type {
    type: string
    sql: ${TABLE}.algorithmclassification ;;
  }

  dimension: cookiedomain {
    type: string
    sql: ${TABLE}.cookiedomain ;;
    label: "Cookie Domain ID"
  }

  dimension: cookiehashrank {
    type: number
    sql: ${TABLE}.cookiehashrank ;;
  }

  dimension: date {
    type: string
    sql: ${TABLE}."date" ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
    hidden: yes
  }

  dimension: is_us {
    type: yesno
    sql: ${TABLE}.region = 'us';;
    label: "Is USA based"
  }

  dimension_group: generation {
    type: time
    sql: DATE_PARSE(${TABLE}.date_p,'%Y%m%d') ;;
    timeframes: [date,month,quarter,year]
  }

# Measures #

  measure: count_pairs {
    type: sum
    sql: ${TABLE}.count ;;
    value_format_name: decimal_0
  }
}
