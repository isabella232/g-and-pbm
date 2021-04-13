view: c_identity_domain_relations_latest {
  derived_table: {
    sql: SELECT *
         FROM auto_sellable.unified_sellable_pairs_hem_maid_pairs_info
         WHERE date_p IN (SELECT MAX(date_p) FROM auto_sellable.unified_sellable_pairs_hem_maid_pairs_info);;
  }

  suggestions: no
  label: "Overlaps between Partner Domains"

  dimension: connected_hem_maid_availability {
    type: string
    sql: REPLACE(${TABLE}.connectedhemmaidavailability,'""','None') ;;
    label: "Hem Maid Availability"
  }

  dimension: primary_cdomain {
    type: string
    sql: ${TABLE}.primaryselector ;;
    label: "Primary Cookie Domain ID"
  }

  dimension: secondary_cdomain {
    type: string
    sql: ${TABLE}.secondaryselector ;;
    label: "Secondary Cookie Domain ID"
  }

  dimension_group: generation {
    type: time
    sql: DATE_PARSE(${TABLE}.date_p,'%Y%m%d') ;;
    timeframes: [date,month,quarter,year]
  }

# Measures #

  measure: count_hems {
    type: sum
    sql: ${TABLE}.connectedhems;;
    value_format_name: decimal_0
  }

  measure: count_pairs {
    type: sum
    sql: ${TABLE}.seconddompairs;;
    value_format_name: decimal_0
  }

  measure: avg_hems {
    type: average
    sql: ${TABLE}.connectedhems;;
    value_format_name: decimal_0
  }

  measure: avg_pairs {
    type: average
    sql: ${TABLE}.seconddompairs;;
    value_format_name: decimal_0
  }

  dimension: hashissellable {
    type: string
    sql: ${TABLE}.hashissellable ;;
    label: "Sellable Hash"
    description: "Flag for Sellability of Hash"
  }

}
