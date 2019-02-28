view: accuracy_pair_stats {
  derived_table: {
    sql: SELECT DATE_PARSE(date_p,'%Y%m%d') event_date, mappingtype, pairs, accuracy['newslettersendout'] accuracy_newsletter_sendout, accuracy['sessionoverlap'] accuracy_session_overlap, positives['newslettersendout'] cnt_positives_newsletter_sendout, positives['sessionoverlap'] cnt_positives_session_overlap, negatives['newslettersendout'] cnt_negatives_newsletter_sendout, negatives['sessionoverlap'] cnt_negatives_session_overlap
      FROM auto_mappings.pair_stats
      WHERE mappingtype NOT LIKE '%¤%'
       ;;
  }

  suggestions: no

  dimension_group: event_date {
    type: time
    sql: ${TABLE}.event_date ;;
  }

  dimension: mapping_type_classification {
    type: string
    sql: CASE WHEN ${mapping_type} LIKE 'sourced/%' THEN 'sourced'
     WHEN REGEXP_LIKE(${mapping_type},'^(d\/|dr\/|esp)') THEN 'deterministic'
     WHEN REGEXP_LIKE(${mapping_type},'^(3m|acc)') THEN 'high accuracy probabilistic'
     ELSE 'low accuracy probabilistic'
     END ;;
  }

  dimension: mapping_type {
    type: string
    sql: ${TABLE}.mappingtype ;;
  }

  measure: cnt_pairs {
    type: sum
    sql: ${TABLE}.pairs ;;
  }

  measure: accuracy_newsletter_sendout {
    type: average
    sql: ${TABLE}.accuracy_newsletter_sendout ;;
    group_label: "Pair Stats"
    value_format_name: percent_1
  }

  measure: accuracy_session_overlap {
    type: average
    sql: ${TABLE}.accuracy_session_overlap ;;
    group_label: "Pair Stats"
    value_format_name: percent_1
  }

  measure: cnt_positives_newsletter_sendout {
    type: sum
    sql: ${TABLE}.cnt_positives_newsletter_sendout ;;
    hidden: yes
  }

  measure: cnt_positives_session_overlap {
    type: sum
    sql: ${TABLE}.cnt_positives_session_overlap ;;
    hidden: yes
  }

  measure: cnt_negatives_newsletter_sendout {
    type: sum
    sql: ${TABLE}.cnt_negatives_newsletter_sendout ;;
    hidden: yes
  }

  measure: cnt_negatives_session_overlap {
    type: sum
    sql: ${TABLE}.cnt_negatives_session_overlap ;;
    hidden: yes
  }

  measure: pairs_denominator {
    type: number
    sql: CAST(NULLIF(${cnt_pairs},0) AS REAL) ;;
    hidden: yes
  }

  measure: positive_accuracy_newsletter_sendout {
    type: number
    sql: ${cnt_positives_newsletter_sendout}/${pairs_denominator};;
    group_label: "Pair Stats: Newsletter Sendout"
    value_format_name: percent_1
  }

  measure: positive_accuracy_session_overlap {
    type: number
    sql: ${cnt_positives_session_overlap}/${pairs_denominator};;
    group_label: "Pair Stats: Session Overlap"
    value_format_name: percent_1
  }

  measure: negative_accuracy_newsletter_sendout {
    type: number
    sql: ABS(${cnt_negatives_newsletter_sendout}/${pairs_denominator} - 1) ;;
    group_label: "Pair Stats: Newsletter Sendout"
    value_format_name: percent_1
  }

  measure: negative_accuracy_session_overlap {
    type: number
    sql: ABS(${cnt_negatives_session_overlap}/${pairs_denominator} - 1) ;;
    group_label: "Pair Stats: Session Overlap"
    value_format_name: percent_1
  }


}
