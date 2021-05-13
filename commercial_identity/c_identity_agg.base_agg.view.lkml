view: c_identity_base_agg {
  sql_table_name: auto_sellable.unified_sellable_pairs_aggregates_info ;;
  suggestions: no
  label: "Available Pairs"

# Standard Dimensions #

  dimension: classification_type {
    type: string
    sql: ${TABLE}.algorithmclassification ;;
    description: "Method through which pair was discovered.
    LowAcc: [max, home],
    HiAcc: [3m, acc, accx],
    Deterministic: Directly observed by LI,
    Sourced: Provided by third-party"
  }

  #dimension: cluster_size {
  #  type: string
  #  label: "Cookie Hash Rank"
  #  sql: CAST(${TABLE}.cookiehashrank AS VARCHAR) ;;
  #  description: "Ranking of TPID after sorting.
  #  When generating a sellable dataset, pairs are ranked according to the strength of the recency and classification of the connection.
  #  The dataset is then cut down to a pre-determinied maximum CHR for each HEM. CHR is ranked in descending order, with \"1\" as the best connection."
  #}

  dimension: cookiedomain {
    type: string
    sql: ${TABLE}.selector ;;
    label: "Cookie Domain ID"
    description: "Third-party ID"
  }

  #dimension: region {
  #  type: string
  #  sql: ${TABLE}.region ;;
  #  hidden: yes
    # Is currently hidden because it only contains US vs. NONUS
  #}

  #dimension: is_us {
  #  type: yesno
  #  sql: ${region} = 'us' ;;
  #  label: "Is USA based"
  #  description: "HEM is based within USA borders"
  #}

  dimension_group: generation {
    type: time
    sql: DATE_PARSE(${TABLE}.date_p,'%Y%m%d') ;;
    timeframes: [date,month,quarter,year]
    description: "Run date"
  }

  dimension: hashissellable {
    type: yesno
    sql: ${TABLE}.hashissellable ;;
    label: "Sellable Hash"
    description: "Flag for Sellability of Hash"
  }

  dimension: cookiehashrank {
    type: number
    sql: ${TABLE}.cookiehashrank ;;
    label: "Cookie Hash Rank"
    description: "Ranking of TPID after sorting.
    When generating a sellable dataset, pairs are ranked according to the strength of the recency and classification of the connection.
    The dataset is then cut down to a pre-determinied maximum CHR for each HEM. CHR is ranked in descending order, with \"1\" as the best connection."
  }


# Recency Dimensions #

  #dimension: recency_deterministic {
  #  type: number
  #  sql: ${TABLE}.deterministic ;;
  #  group_label: "Experimental Dimensions"
  #  hidden: yes
  #}

  #dimension: recency_deterministicandhiaccprobabilistic {
  #  type: number
  #  sql: ${TABLE}.deterministicandhiaccprobabilistic ;;
  #  group_label: "Experimental Dimensions"
  #  hidden: yes
  #}

  #dimension: recency_hiaccprobabilistic {
  #  type: number
  #  sql: ${TABLE}.hiaccprobabilistic ;;
  #  group_label: "Experimental Dimensions"
  #  hidden: yes
  #}

  #dimension: recency_probabilistic {
  #  type: number
  #  sql: ${TABLE}.probabilistic ;;
  #  group_label: "Experimental Dimensions"
  #  hidden: yes
  #}

  #dimension: recency_total {
  #  type: number
  #  sql: ${TABLE}.total ;;
  #  group_label: "Experimental Dimensions"
  #  hidden: yes
  #}

# Measures #

  measure: count_pairs {
    type: sum
    sql: ${TABLE}.count ;;
    value_format_name: decimal_0
    description: "Total available HEM:TPID pairs"
  }

  measure: count {
    type: count
    description: "Simple row count, for use in data dictionary"
  }

}
