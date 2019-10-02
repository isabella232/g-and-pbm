view: algorithm_classification_sellable {
  derived_table: {
    sql: SELECT algorithmclassification,
CASE WHEN algorithmclassification = 1 THEN 'Deterministic'
WHEN algorithmclassification = 4 THEN 'High Accuracy Probabilistic'
WHEN algorithmclassification = 8 THEN 'Low Accuracy Probabilistic'
WHEN algorithmclassification = 16 THEN 'Sourced'
END AS Algorithm,
COUNT(*) total
FROM auto_sellable.sellable_pair
WHERE date_p = '20190910'
AND algorithmclassification IN (1,4,8,16)
GROUP BY 1,2
       ;;
  }

  suggestions: no

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: algorithmclassification {
    type: number
    sql: ${TABLE}.algorithmclassification ;;
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
    fields: [algorithmclassification, total]
  }
}
