view: c_identity_base_agg {
  sql_table_name: auto_bidatapipelines.sellable_pairs_aggregates_info ;;
  suggestions: no

# Standard Dimensions #

  dimension: classification_type {
    type: string
    sql: ${TABLE}.algorithmclassification ;;
  }

  dimension: cluster_size {
    type: string
    #sql: ${TABLE}.cluster_size ;;
    # was this messed up when we moved over?
    sql: CAST(${TABLE}.cookiehashrank AS VARCHAR) ;;
  }

  dimension: cookiedomain {
    type: string
    sql: ${TABLE}.cookiedomain ;;
    label: "Cookie Domain ID"
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
    sql: DATE_PARSE(${TABLE}.date_p,'%Y%m%d') ;;
    timeframes: [date,month,quarter,year]
  }

# Recency Dimensions #

  dimension: recency_deterministic {
    type: number
    sql: ${TABLE}.deterministic ;;
    group_label: "Experimental Dimensions"
    hidden: yes
  }

  dimension: recency_deterministicandhiaccprobabilistic {
    type: number
    sql: ${TABLE}.deterministicandhiaccprobabilistic ;;
    group_label: "Experimental Dimensions"
    hidden: yes
  }

  dimension: recency_hiaccprobabilistic {
    type: number
    sql: ${TABLE}.hiaccprobabilistic ;;
    group_label: "Experimental Dimensions"
    hidden: yes
  }

  dimension: recency_probabilistic {
    type: number
    sql: ${TABLE}.probabilistic ;;
    group_label: "Experimental Dimensions"
    hidden: yes
  }

  dimension: recency_total {
    type: number
    sql: ${TABLE}.total ;;
    group_label: "Experimental Dimensions"
    hidden: yes
  }

# Measures #

  measure: count_pairs {
    type: sum
    sql: ${TABLE}.count ;;
    value_format_name: decimal_0
  }

}
