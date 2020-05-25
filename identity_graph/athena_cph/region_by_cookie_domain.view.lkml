view: region_by_cookie_domain {
  derived_table: {
    sql: SELECT *
      FROM tmp_looker.region_by_cookie_domain
       ;;
  }

  suggestions: yes

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: cookiedomain {
    type: string
    sql: ${TABLE}.cookiedomain ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  measure: total {
    type: sum
    sql: ${TABLE}.total ;;
  }

  set: detail {
    fields: [cookiedomain, region, total]
  }
}
