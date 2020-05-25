view: algorithm_classification_sellable {
  derived_table: {
    sql: /*SELECT CASE WHEN MOD(algorithmclassification,2) = 1 THEN 'Deterministic'
WHEN MOD(algorithmclassification,8) >=4 THEN 'High Accuracy Probabilistic'
WHEN MOD(algorithmclassification,16) >= 8 THEN 'Low Accuracy Probabilistic'
WHEN algorithmclassification >= 16 THEN 'Sourced'
END AS Algorithm,
COUNT(*) total
FROM auto_sellable.sellable_pair
WHERE date_p = '20190910'
GROUP BY 1*/

SELECT * FROM tmp_looker.algorithm_classification_sellable
       ;;
  }

  suggestions: no

  measure: count {
    type: count
    drill_fields: [detail*]
  }


  dimension: algorithm {
    type: string
    sql: ${TABLE}.algorithm ;;
  }
  measure: total {
    type: sum
    sql: ${TABLE}.total ;;
  }

  set: detail {
    fields: [algorithm, total]
  }
}
