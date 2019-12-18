view: sellable_pairs_aggregates {
  sql_table_name: no_id_logs.sellable_pairs_aggregates ;;
  suggestions: no

# Standard Dimensions #

  dimension: classification_type {
    type: string
    sql: ${TABLE}.algorithmclassification ;;
  }

  dimension: cluster_size {
    type: string
    sql: ${TABLE}.cluster_size ;;
  }

  dimension: cookiedomain {
    type: string
    sql: ${TABLE}.cookiedomain ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
    hidden: yes
  }

  dimension: is_us {
    type: yesno
    sql: ${region} = 'us' ;;
    label: "Is USA based"
  }

  dimension_group: generation {
    type: time
    sql: DATE_PARSE(${TABLE}.event_date,'%Y%m%d') ;;
    timeframes: [date,month,quarter,year]
  }

# Recency Dimensions #

  dimension: recency_deterministic {
    type: number
    sql: ${TABLE}.deterministic ;;
    group_label: "Experimental Dimensions"
  }

  dimension: recency_deterministicandhiaccprobabilistic {
    type: number
    sql: ${TABLE}.deterministicandhiaccprobabilistic ;;
    group_label: "Experimental Dimensions"
  }

  dimension: recency_hiaccprobabilistic {
    type: number
    sql: ${TABLE}.hiaccprobabilistic ;;
    group_label: "Experimental Dimensions"
  }

  dimension: recency_probabilistic {
    type: number
    sql: ${TABLE}.probabilistic ;;
    group_label: "Experimental Dimensions"
  }

  dimension: recency_total {
    type: number
    sql: ${TABLE}.total ;;
    group_label: "Experimental Dimensions"
  }

# Measures #

  measure: count_pairs {
    type: sum
    sql: ${TABLE}.algorithm_count ;;
    value_format_name: decimal_0
  }

}
