view: sellable_pairs_cookie_count_by_domain_info {
  sql_table_name: auto_bidatapipelines.sellable_pairs_cookie_count_by_domain_info ;;
  suggestions: no

  dimension: cookiedomain {
    type: string
    sql: ${TABLE}.cookiedomain ;;
  }

  dimension_group: generation {
    type: time
    sql: DATE_PARSE(${TABLE}.date_p,'%Y%m%d') ;;
    timeframes: [date,month,quarter,year]
  }

  measure: count_partner_id {
    type: sum
    sql: ${TABLE}.cookiecount ;;
    label: "Count Partner IDs"
    value_format_name: decimal_0
  }
}
