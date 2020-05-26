view: cookie_hash_ranks {
  derived_table: {
    sql: /*SELECT CASE WHEN cookiehashrank < 5 THEN CONCAT('0',CAST(cookiehashrank AS VARCHAR))
            WHEN cookiehashrank >=5 AND cookiehashrank <10 THEN '05 to 09'
            WHEN cookiehashrank >= 10 THEN '10+' END cluster_size, COUNT(*) clusters
FROM auto_sellable.sellable_pair
WHERE date_p = '20190910'
GROUP BY 1*/

SELECT * FROM tmp_looker.cookie_hash_ranks
       ;;
  }

  suggestions: no

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: cookiehashrank {
    type: string
    sql: ${TABLE}.cluster_size ;;
    label: "Hash Cluster Size"
  }

  measure: total {
    type: sum
    sql: ${TABLE}.clusters ;;
    label: "Clusters"
  }

  set: detail {
    fields: [cookiehashrank, total]
  }
}
