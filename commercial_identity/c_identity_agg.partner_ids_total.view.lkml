view: c_identity_agg_partner_ids_total {
  sql_table_name: no_id_logs.sellable_pairs_cookie ;;
  suggestions: no

  dimension: cookiedomain {
    type: string
    sql: ${TABLE}.cookiedomain ;;
    label: "Cookie Domain ID"
  }

  dimension_group: generation {
    type: time
    sql: DATE_PARSE(${TABLE}.event_date,'%Y%m%d') ;;
    timeframes: [date,month,quarter,year]
  }

  measure: count_partner_id {
    type: sum
    sql: ${TABLE}.cookie_count ;;
    label: "Count Partner IDs"
    value_format_name: decimal_0
  }

  # sellable_pairs_cookie
}
