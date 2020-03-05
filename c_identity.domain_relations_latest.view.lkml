view: c_identity_domain_relations_latest {
  derived_table: {
    sql: SELECT * FROM no_id_logs.sellable_pairs_hem_maid WHERE event_date IN (SELECT MAX(event_date) FROM no_id_logs.sellable_pairs_hem_maid);;
  }

  suggestions: no

  dimension: connected_hem_maid_availability {
    type: string
    sql: REPLACE(${TABLE}.connected_hem_maid_availability,'""','None') ;;
    label: "Hem Maid Availability"
  }

  dimension: primary_cdomain {
    type: string
    sql: ${TABLE}.primary_cdomain ;;
    label: "Primary Cookie Domain ID"
  }

  dimension: secondary_cdomain {
    type: string
    sql: ${TABLE}.secondary_cdomain ;;
    label: "Secondary Cookie Domain ID"
  }

  dimension_group: generation {
    type: time
    sql: DATE_PARSE(${TABLE}.event_date,'%Y%m%d') ;;
    timeframes: [date,month,quarter,year]
  }

# Measures #

  measure: count_hems {
    type: sum
    sql: ${TABLE}.connected_hems;;
    value_format_name: decimal_0
  }

  measure: count_pairs {
    type: sum
    sql: ${TABLE}.second_dom_pairs;;
    value_format_name: decimal_0
  }

  measure: avg_hems {
    type: average
    sql: ${TABLE}.connected_hems;;
    value_format_name: decimal_0
  }

  measure: avg_pairs {
    type: average
    sql: ${TABLE}.second_dom_pairs;;
    value_format_name: decimal_0
  }

}
