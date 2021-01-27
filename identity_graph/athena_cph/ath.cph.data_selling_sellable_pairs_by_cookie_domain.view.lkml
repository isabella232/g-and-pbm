view: data_selling_sellable_pairs_by_cookie_domain {
  derived_table: {
    sql: SELECT DATE_PARSE(date_p,'%Y%m%d') event_date, cookie_domain_p, COUNT(*) sellable_pairs
      FROM auto_sellable.sellable_pair
      WHERE hashIsSellable
      GROUP BY 1,2
       ;;
  }

  suggestions: no

  dimension_group: event_date {
    type: time
    sql: ${TABLE}.event_date ;;
  }

  dimension: cookie_domain {
    type: string
    sql: ${TABLE}.cookie_domain_p ;;
  }

  measure: sellable_pairs {
    type: sum
    sql: ${TABLE}.sellable_pairs ;;
    value_format_name: decimal_0
  }

  measure: average_sellable_pairs {
    type: average
    sql: ${TABLE}.sellable_pairs ;;
    value_format_name: decimal_0
  }

}
