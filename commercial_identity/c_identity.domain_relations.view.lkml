view: c_identity_domain_relations {
  sql_table_name: auto_bidatapipelines.sellable_pairs_hem_maid_pairs_info ;;
  suggestions: no

  dimension: connected_hem_maid_availability {
    type: string
    sql: REPLACE(${TABLE}.connectedhemmaidavailability,'""','None') ;;
    label: "MAID Type"
    description: "Classification of available MAID types in overlap"
  }

  dimension: primary_cdomain {
    type: string
    sql: ${TABLE}.primaryselector ;;
    label: "Primary Cookie Domain"
    description: "First third-party domain to be compared (x-axis)"
  }

  dimension: secondary_cdomain {
    type: string
    sql: ${TABLE}.secondaryselector ;;
    label: "Secondary Cookie Domain"
    description: "Second third-party domain to be compared (y-axis)"
  }

  dimension_group: generation {
    type: time
    sql: DATE_PARSE(${TABLE}.date_p,'%Y%m%d') ;;
    timeframes: [date,month,quarter,year]
    description: "Run date"
  }

# Measures #

  measure: count_hems {
    type: sum
    sql: ${TABLE}.connectedhems;;
    value_format_name: decimal_0
    label: "Count HEMs"
    description: "Distinct number of sellable HEMs with ≥1 connection between both domains"
  }

  measure: count_pairs {
    type: sum
    sql: ${TABLE}.seconddompairs;;
    value_format_name: decimal_0
    description: "Number of sellable pairs with ≥1 connection between both domains"
  }

}
