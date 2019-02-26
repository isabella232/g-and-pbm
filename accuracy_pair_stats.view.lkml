view: accuracy_pair_stats {
  derived_table: {
    sql: SELECT DATE_PARSE(date_p,'%Y%m%d') event_date, mappingtype, pairs, accuracy['newslettersendout'] accuracy_newsletter_sendout, accuracy['sessionoverlap'] accuracy_session_overlap, positives['newslettersendout'] cnt_positives_newsletter_sendout, positives['sessionoverlap'] cnt_positives_session_overlap, negatives['newslettersendout'] cnt_negatives_newsletter_sendout, negatives['sessionoverlap'] cnt_negatives_session_overlap
      FROM auto_mappings.pair_stats
      WHERE mappingtype NOT LIKE '%¤%'
       ;;
  }

  suggestions: no

  measure: count {
    type: count
  }

  dimension_group: event_date {
    type: time
    sql: ${TABLE}.event_date ;;
  }

  dimension: mappingtype {
    type: string
    sql: ${TABLE}.mappingtype ;;
  }

  measure: pairs {
    type: sum
    sql: ${TABLE}.pairs ;;
  }

  measure: accuracy_newsletter_sendout {
    type: average
    sql: ${TABLE}.accuracy_newsletter_sendout ;;
    group_label: "General"
    value_format_name: percent_1
  }

  measure: accuracy_session_overlap {
    type: average
    sql: ${TABLE}.accuracy_session_overlap ;;
    group_label: "General"
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
    sql: CAST(NULLIF(${pairs},0) AS REAL) ;;
    hidden: yes
  }

  measure: positive_accuracy_newsletter_sendout {
    type: number
    sql: ${cnt_positives_newsletter_sendout}/${pairs_denominator};;
    group_label: "Newsletter Sendout"
    value_format_name: percent_1
  }

  measure: positive_accuracy_session_overlap {
    type: number
    sql: ${cnt_positives_session_overlap}/${pairs_denominator};;
    group_label: "Session Overlap"
    value_format_name: percent_1
  }

  measure: negative_accuracy_newsletter_sendout {
    type: number
    sql: ABS(${cnt_negatives_newsletter_sendout}/${pairs_denominator} - 1) ;;
    group_label: "Newsletter Sendout"
    value_format_name: percent_1
  }

  measure: negative_accuracy_session_overlap {
    type: number
    sql: ABS(${cnt_negatives_session_overlap}/${pairs_denominator} - 1) ;;
    group_label: "Session Overlap"
    value_format_name: percent_1
  }


}
