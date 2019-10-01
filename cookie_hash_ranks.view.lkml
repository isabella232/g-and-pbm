view: cookie_hash_ranks {
  derived_table: {
    sql: SELECT CAST(cookiehashrank AS VARCHAR) cookiehashrank, COUNT(*) total
      FROM auto_sellable.sellable_pair
      WHERE date_p = '20190910'
      AND cookiehashrank IN (1,2,3,4)
      GROUP BY 1
      UNION
      SELECT '5 to 9' cookiehashrank, COUNT(*) total
      FROM auto_sellable.sellable_pair
      WHERE date_p = '20190910'
      AND cookiehashrank IN (5,6,7,8,9)
      UNION
      SELECT '10 or more' cookiehashrank, COUNT(*) total
      FROM auto_sellable.sellable_pair
      WHERE date_p = '20190910'
      AND cookiehashrank NOT IN (1,2,3,4,5,6,7,8,9)
       ;;
  }

  suggestions: no

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: cookiehashrank {
    type: string
    sql: ${TABLE}.cookiehashrank ;;
  }

  measure: total {
    type: sum
    sql: ${TABLE}.total ;;
  }

  set: detail {
    fields: [cookiehashrank, total]
  }
}
