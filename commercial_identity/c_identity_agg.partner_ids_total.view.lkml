view: c_identity_agg_partner_ids_total {
  sql_table_name: auto_bidatapipelines.sellable_pairs_cookie_count_by_domain_info ;;
  suggestions: no

  dimension: primary_key {
    type: string
    sql: CONCAT(${cookiedomain},CAST(${generation_date} AS VARCHAR)) ;;
    primary_key: yes
    hidden: yes
  }

  dimension: cookiedomain {
    type: string
    sql: ${TABLE}.selector ;;
    label: "Cookie Domain ID"
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

  # sellable_pairs_cookie
}
