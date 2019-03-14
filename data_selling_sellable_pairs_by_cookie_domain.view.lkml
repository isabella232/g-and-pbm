view: data_selling_sellable_pairs_by_cookie_domain {
  derived_table: {
    sql: SELECT DATE_PARSE(date_p,'%Y%m%d') event_date, cookie_domain_p, COUNT(*) sellable_pairs
      FROM auto_sellable.sellable_pair
      GROUP BY 1,2
       ;;
  }

  suggestions: no

  dimension_group: event_date {
    type: time
    sql: ${TABLE}.event_date ;;
  }

  dimension: cookie_domain_name {
    type: string
    sql: CASE ${cookie_domain} WHEN '2380' THEN 'Centro'
                            WHEN '1118' THEN 'LiveIntent DSP'
                            WHEN '98029' THEN 'BidSwitch Native'
                            WHEN '88068' THEN 'Taboola'
                            WHEN '7156' THEN 'MediaMath'
                            WHEN '44489' THEN 'The Trade Desk'
                            WHEN '98254' THEN 'Zemata'
                            WHEN '111047' THEN 'AppNexus Native'
                            WHEN '71340' THEN 'Criteo'
                            WHEN '78877' THEN 'Sociomantic'
                            WHEN '5298' THEN 'BidSwitch'
                            WHEN '105664' THEN 'Criteo UK'
                            WHEN '106904' THEN 'Adara'
                            ELSE ${cookie_domain} END;;
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
