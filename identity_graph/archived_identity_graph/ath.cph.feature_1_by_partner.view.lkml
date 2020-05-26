view: feature_1_by_partner {
  derived_table: {
    sql: SELECT 'narrative' company,
      SUM(CASE WHEN hip >0 AND hip <0.025 THEN 1 ELSE 0 END) bucket_1,
      SUM(CASE WHEN hip >=0.025 AND hip <0.05 THEN 1 ELSE 0 END) bucket_2,
      SUM(CASE WHEN hip >=0.05 AND hip <0.075 THEN 1 ELSE 0 END) bucket_3,
      SUM(CASE WHEN hip >=0.075 AND hip <0.1 THEN 1 ELSE 0 END) bucket_4,
      SUM(CASE WHEN hip >=0.1 AND hip <0.125 THEN 1 ELSE 0 END) bucket_5,
      SUM(CASE WHEN hip >=0.125 AND hip <0.15 THEN 1 ELSE 0 END) bucket_6,
      SUM(CASE WHEN hip >=0.15 AND hip <0.175 THEN 1 ELSE 0 END) bucket_7,
      SUM(CASE WHEN hip >=0.175 AND hip <0.2 THEN 1 ELSE 0 END) bucket_8,
      SUM(CASE WHEN hip >=0.2 AND hip <0.225 THEN 1 ELSE 0 END) bucket_9,
      SUM(CASE WHEN hip >=0.225 AND hip <0.25 THEN 1 ELSE 0 END) bucket_10,
      SUM(CASE WHEN hip >=0.25 AND hip <0.275 THEN 1 ELSE 0 END) bucket_11,
      SUM(CASE WHEN hip >=0.275 AND hip <0.3 THEN 1 ELSE 0 END) bucket_12,
      SUM(CASE WHEN hip >=0.3 AND hip <0.325 THEN 1 ELSE 0 END) bucket_13,
      SUM(CASE WHEN hip >=0.325 AND hip <0.35 THEN 1 ELSE 0 END) bucket_14,
      SUM(CASE WHEN hip >=0.35 AND hip <0.375 THEN 1 ELSE 0 END) bucket_15,
      SUM(CASE WHEN hip >=0.375 AND hip <0.4 THEN 1 ELSE 0 END) bucket_16,
      SUM(CASE WHEN hip >=0.4 AND hip <0.425 THEN 1 ELSE 0 END) bucket_17,
      SUM(CASE WHEN hip >=0.425 AND hip <0.45 THEN 1 ELSE 0 END) bucket_18,
      SUM(CASE WHEN hip >=0.45 AND hip <0.475 THEN 1 ELSE 0 END) bucket_19,
      SUM(CASE WHEN hip >=0.475 AND hip <0.5 THEN 1 ELSE 0 END) bucket_20,
      SUM(CASE WHEN hip >=0.5 AND hip <0.525 THEN 1 ELSE 0 END) bucket_21,
      SUM(CASE WHEN hip >=0.525 AND hip <0.55 THEN 1 ELSE 0 END) bucket_22,
      SUM(CASE WHEN hip >=0.55 AND hip <0.575 THEN 1 ELSE 0 END) bucket_23,
      SUM(CASE WHEN hip >=0.575 AND hip <0.6 THEN 1 ELSE 0 END) bucket_24,
      SUM(CASE WHEN hip >=0.6 AND hip <0.625 THEN 1 ELSE 0 END) bucket_25,
      SUM(CASE WHEN hip >=0.625 AND hip <0.65 THEN 1 ELSE 0 END) bucket_26,
      SUM(CASE WHEN hip >=0.65 AND hip <0.675 THEN 1 ELSE 0 END) bucket_27,
      SUM(CASE WHEN hip >=0.675 AND hip <0.7 THEN 1 ELSE 0 END) bucket_28,
      SUM(CASE WHEN hip >=0.7 AND hip <0.725 THEN 1 ELSE 0 END) bucket_29,
      SUM(CASE WHEN hip >=0.725 AND hip <0.75 THEN 1 ELSE 0 END) bucket_30,
      SUM(CASE WHEN hip >=0.75 AND hip <0.775 THEN 1 ELSE 0 END) bucket_31,
      SUM(CASE WHEN hip >=0.775 AND hip <0.8 THEN 1 ELSE 0 END) bucket_32,
      SUM(CASE WHEN hip >=0.8 AND hip <0.825 THEN 1 ELSE 0 END) bucket_33,
      SUM(CASE WHEN hip >=0.825 AND hip <0.85 THEN 1 ELSE 0 END) bucket_34,
      SUM(CASE WHEN hip >=0.85 AND hip <0.875 THEN 1 ELSE 0 END) bucket_35,
      SUM(CASE WHEN hip >=0.875 AND hip <0.9 THEN 1 ELSE 0 END) bucket_36,
      SUM(CASE WHEN hip >=0.9 AND hip <0.925 THEN 1 ELSE 0 END) bucket_37,
      SUM(CASE WHEN hip >=0.925 AND hip <0.95 THEN 1 ELSE 0 END) bucket_38,
      SUM(CASE WHEN hip >=0.95 THEN 1 ELSE 0 END) bucket_39
      FROM auto_deliverable.narrative_deliverable_pair_with_attributes
      WHERE date_p = '20190921'
      AND region_p = 'US'

      UNION

      SELECT 'oracle' company,
      SUM(CASE WHEN hip >0 AND hip <0.025 THEN 1 ELSE 0 END) bucket_1,
      SUM(CASE WHEN hip >=0.025 AND hip <0.05 THEN 1 ELSE 0 END) bucket_2,
      SUM(CASE WHEN hip >=0.05 AND hip <0.075 THEN 1 ELSE 0 END) bucket_3,
      SUM(CASE WHEN hip >=0.075 AND hip <0.1 THEN 1 ELSE 0 END) bucket_4,
      SUM(CASE WHEN hip >=0.1 AND hip <0.125 THEN 1 ELSE 0 END) bucket_5,
      SUM(CASE WHEN hip >=0.125 AND hip <0.15 THEN 1 ELSE 0 END) bucket_6,
      SUM(CASE WHEN hip >=0.15 AND hip <0.175 THEN 1 ELSE 0 END) bucket_7,
      SUM(CASE WHEN hip >=0.175 AND hip <0.2 THEN 1 ELSE 0 END) bucket_8,
      SUM(CASE WHEN hip >=0.2 AND hip <0.225 THEN 1 ELSE 0 END) bucket_9,
      SUM(CASE WHEN hip >=0.225 AND hip <0.25 THEN 1 ELSE 0 END) bucket_10,
      SUM(CASE WHEN hip >=0.25 AND hip <0.275 THEN 1 ELSE 0 END) bucket_11,
      SUM(CASE WHEN hip >=0.275 AND hip <0.3 THEN 1 ELSE 0 END) bucket_12,
      SUM(CASE WHEN hip >=0.3 AND hip <0.325 THEN 1 ELSE 0 END) bucket_13,
      SUM(CASE WHEN hip >=0.325 AND hip <0.35 THEN 1 ELSE 0 END) bucket_14,
      SUM(CASE WHEN hip >=0.35 AND hip <0.375 THEN 1 ELSE 0 END) bucket_15,
      SUM(CASE WHEN hip >=0.375 AND hip <0.4 THEN 1 ELSE 0 END) bucket_16,
      SUM(CASE WHEN hip >=0.4 AND hip <0.425 THEN 1 ELSE 0 END) bucket_17,
      SUM(CASE WHEN hip >=0.425 AND hip <0.45 THEN 1 ELSE 0 END) bucket_18,
      SUM(CASE WHEN hip >=0.45 AND hip <0.475 THEN 1 ELSE 0 END) bucket_19,
      SUM(CASE WHEN hip >=0.475 AND hip <0.5 THEN 1 ELSE 0 END) bucket_20,
      SUM(CASE WHEN hip >=0.5 AND hip <0.525 THEN 1 ELSE 0 END) bucket_21,
      SUM(CASE WHEN hip >=0.525 AND hip <0.55 THEN 1 ELSE 0 END) bucket_22,
      SUM(CASE WHEN hip >=0.55 AND hip <0.575 THEN 1 ELSE 0 END) bucket_23,
      SUM(CASE WHEN hip >=0.575 AND hip <0.6 THEN 1 ELSE 0 END) bucket_24,
      SUM(CASE WHEN hip >=0.6 AND hip <0.625 THEN 1 ELSE 0 END) bucket_25,
      SUM(CASE WHEN hip >=0.625 AND hip <0.65 THEN 1 ELSE 0 END) bucket_26,
      SUM(CASE WHEN hip >=0.65 AND hip <0.675 THEN 1 ELSE 0 END) bucket_27,
      SUM(CASE WHEN hip >=0.675 AND hip <0.7 THEN 1 ELSE 0 END) bucket_28,
      SUM(CASE WHEN hip >=0.7 AND hip <0.725 THEN 1 ELSE 0 END) bucket_29,
      SUM(CASE WHEN hip >=0.725 AND hip <0.75 THEN 1 ELSE 0 END) bucket_30,
      SUM(CASE WHEN hip >=0.75 AND hip <0.775 THEN 1 ELSE 0 END) bucket_31,
      SUM(CASE WHEN hip >=0.775 AND hip <0.8 THEN 1 ELSE 0 END) bucket_32,
      SUM(CASE WHEN hip >=0.8 AND hip <0.825 THEN 1 ELSE 0 END) bucket_33,
      SUM(CASE WHEN hip >=0.825 AND hip <0.85 THEN 1 ELSE 0 END) bucket_34,
      SUM(CASE WHEN hip >=0.85 AND hip <0.875 THEN 1 ELSE 0 END) bucket_35,
      SUM(CASE WHEN hip >=0.875 AND hip <0.9 THEN 1 ELSE 0 END) bucket_36,
      SUM(CASE WHEN hip >=0.9 AND hip <0.925 THEN 1 ELSE 0 END) bucket_37,
      SUM(CASE WHEN hip >=0.925 AND hip <0.95 THEN 1 ELSE 0 END) bucket_38,
      SUM(CASE WHEN hip >=0.95 THEN 1 ELSE 0 END) bucket_39
      FROM auto_deliverable.oracle_deliverable_pair_with_attributes
      WHERE date_p = '20190915'
      AND region_p = 'US'

      UNION

      SELECT 'walmart' company,
      SUM(CASE WHEN hip >0 AND hip <0.025 THEN 1 ELSE 0 END) bucket_1,
      SUM(CASE WHEN hip >=0.025 AND hip <0.05 THEN 1 ELSE 0 END) bucket_2,
      SUM(CASE WHEN hip >=0.05 AND hip <0.075 THEN 1 ELSE 0 END) bucket_3,
      SUM(CASE WHEN hip >=0.075 AND hip <0.1 THEN 1 ELSE 0 END) bucket_4,
      SUM(CASE WHEN hip >=0.1 AND hip <0.125 THEN 1 ELSE 0 END) bucket_5,
      SUM(CASE WHEN hip >=0.125 AND hip <0.15 THEN 1 ELSE 0 END) bucket_6,
      SUM(CASE WHEN hip >=0.15 AND hip <0.175 THEN 1 ELSE 0 END) bucket_7,
      SUM(CASE WHEN hip >=0.175 AND hip <0.2 THEN 1 ELSE 0 END) bucket_8,
      SUM(CASE WHEN hip >=0.2 AND hip <0.225 THEN 1 ELSE 0 END) bucket_9,
      SUM(CASE WHEN hip >=0.225 AND hip <0.25 THEN 1 ELSE 0 END) bucket_10,
      SUM(CASE WHEN hip >=0.25 AND hip <0.275 THEN 1 ELSE 0 END) bucket_11,
      SUM(CASE WHEN hip >=0.275 AND hip <0.3 THEN 1 ELSE 0 END) bucket_12,
      SUM(CASE WHEN hip >=0.3 AND hip <0.325 THEN 1 ELSE 0 END) bucket_13,
      SUM(CASE WHEN hip >=0.325 AND hip <0.35 THEN 1 ELSE 0 END) bucket_14,
      SUM(CASE WHEN hip >=0.35 AND hip <0.375 THEN 1 ELSE 0 END) bucket_15,
      SUM(CASE WHEN hip >=0.375 AND hip <0.4 THEN 1 ELSE 0 END) bucket_16,
      SUM(CASE WHEN hip >=0.4 AND hip <0.425 THEN 1 ELSE 0 END) bucket_17,
      SUM(CASE WHEN hip >=0.425 AND hip <0.45 THEN 1 ELSE 0 END) bucket_18,
      SUM(CASE WHEN hip >=0.45 AND hip <0.475 THEN 1 ELSE 0 END) bucket_19,
      SUM(CASE WHEN hip >=0.475 AND hip <0.5 THEN 1 ELSE 0 END) bucket_20,
      SUM(CASE WHEN hip >=0.5 AND hip <0.525 THEN 1 ELSE 0 END) bucket_21,
      SUM(CASE WHEN hip >=0.525 AND hip <0.55 THEN 1 ELSE 0 END) bucket_22,
      SUM(CASE WHEN hip >=0.55 AND hip <0.575 THEN 1 ELSE 0 END) bucket_23,
      SUM(CASE WHEN hip >=0.575 AND hip <0.6 THEN 1 ELSE 0 END) bucket_24,
      SUM(CASE WHEN hip >=0.6 AND hip <0.625 THEN 1 ELSE 0 END) bucket_25,
      SUM(CASE WHEN hip >=0.625 AND hip <0.65 THEN 1 ELSE 0 END) bucket_26,
      SUM(CASE WHEN hip >=0.65 AND hip <0.675 THEN 1 ELSE 0 END) bucket_27,
      SUM(CASE WHEN hip >=0.675 AND hip <0.7 THEN 1 ELSE 0 END) bucket_28,
      SUM(CASE WHEN hip >=0.7 AND hip <0.725 THEN 1 ELSE 0 END) bucket_29,
      SUM(CASE WHEN hip >=0.725 AND hip <0.75 THEN 1 ELSE 0 END) bucket_30,
      SUM(CASE WHEN hip >=0.75 AND hip <0.775 THEN 1 ELSE 0 END) bucket_31,
      SUM(CASE WHEN hip >=0.775 AND hip <0.8 THEN 1 ELSE 0 END) bucket_32,
      SUM(CASE WHEN hip >=0.8 AND hip <0.825 THEN 1 ELSE 0 END) bucket_33,
      SUM(CASE WHEN hip >=0.825 AND hip <0.85 THEN 1 ELSE 0 END) bucket_34,
      SUM(CASE WHEN hip >=0.85 AND hip <0.875 THEN 1 ELSE 0 END) bucket_35,
      SUM(CASE WHEN hip >=0.875 AND hip <0.9 THEN 1 ELSE 0 END) bucket_36,
      SUM(CASE WHEN hip >=0.9 AND hip <0.925 THEN 1 ELSE 0 END) bucket_37,
      SUM(CASE WHEN hip >=0.925 AND hip <0.95 THEN 1 ELSE 0 END) bucket_38,
      SUM(CASE WHEN hip >=0.95 THEN 1 ELSE 0 END) bucket_39
      FROM auto_deliverable.walmart_deliverable_pair_with_attributes
      WHERE date_p = '20190915'
      AND region_p = 'US'
       ;;
  }

  suggestions: no

  dimension: dummy_three {
    case: {
      when: {
        label: "(0,0.025)"
        sql: 1=1;;
      }
      when: {
        label: "[0.025,0.05)"
        sql: 1=1;;
      }
      when: {
        label: "[0.05,0.075)"
        sql: 1=1;;
      }
      when: {
        label: "[0.075,0.1)"
        sql: 1=1 ;;
      }
      when: {
        label: "[0.1,0.125)"
        sql: 1=1;;
      }
      when: {
        label: "[0.125,0.15)"
        sql: 1=1;;
      }
      when: {
        label: "[0.15,0.175)"
        sql: 1=1 ;;
      }
      when: {
        label: "[0.175,0.2)"
        sql: 1=1;;
      }
      when: {
        label: "[0.2,0.225)"
        sql: 1=1;;
      }
      when: {
        label: "[0.225,0.25)"
        sql: 1=1 ;;
      }
      when: {
        label: "[0.25,0.275)"
        sql: 1=1;;
      }
      when: {
        label: "[0.275,0.3)"
        sql: 1=1;;
      }
      when: {
        label: "[0.3,0.325)"
        sql: 1=1 ;;
      }
      when: {
        label: "[0.325,0.35)"
        sql: 1=1 ;;
      }
      when: {
        label: "[0.35,0.375)"
        sql: 1=1;;
      }
      when: {
        label: "[0.375,0.4)"
        sql: 1=1;;
      }
      when: {
        label: "[0.4,0.425)"
        sql: 1=1 ;;
      }
      when: {
        label: "[0.425,0.45)"
        sql: 1=1;;
      }
      when: {
        label: "[0.45,0.475)"
        sql: 1=1;;
      }
      when: {
        label: "[0.475,0.5)"
        sql: 1=1;;
      }
      when: {
        label: "[0.5,0.525)"
        sql: 1=1 ;;
      }
      when: {
        label: "[0.525,0.55)"
        sql: 1=1 ;;
      }
      when: {
        label: "[0.55,0.575)"
        sql: 1=1;;
      }
      when: {
        label: "[0.575,0.6)"
        sql: 1=1;;
      }
      when: {
        label: "[0.6,0.625)"
        sql: 1=1 ;;
      }
      when: {
        label: "[0.625,0.65)"
        sql: 1=1;;
      }
      when: {
        label: "[0.65,0.675)"
        sql: 1=1;;
      }
      when: {
        label: "[0.675,0.7)"
        sql: 1=1;;
      }
      when: {
        label: "[0.7,0.725)"
        sql: 1=1;;
      }
      when: {
        label: "[0.75,0.775)"
        sql: 1=1;;
      }
      when: {
        label: "[0.775,0.8)"
        sql: 1=1;;
      }
      when: {
        label: "[0.8,0.825)"
        sql: 1=1;;
      }
      when: {
        label: "[0.825,0.85)"
        sql: 1=1;;
      }
      when: {
        label: "[0.85,0.875)"
        sql: 1=1;;
      }
      when: {
        label: "[0.875,0.9)"
        sql: 1=1;;
      }
      when: {
        label: "[0.9,0.925)"
        sql: 1=1;;
      }
      when: {
        label: "[0.925,0.95)"
        sql: 1=1;;
      }
      when: {
        label: ">=0.95"
        sql: 1=1;;
      }
    }
  }


  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: company {
    type: string
    sql: ${TABLE}.company ;;
  }

  measure: bucket_1 {
    type: sum
    label: "(0,0.025)"
    sql: ${TABLE}.bucket_1 ;;
  }

  measure: bucket_2 {
    type: sum
    label: "[0.025,0.05)"
    sql: ${TABLE}.bucket_2 ;;
  }

  measure: bucket_3 {
    type: sum
    label: "[0.05,0.075)"
    sql: ${TABLE}.bucket_3 ;;
  }

  measure: bucket_4 {
    type: sum
    label: "[0.075,0.1)"
    sql: ${TABLE}.bucket_4 ;;
  }

  measure: bucket_5 {
    type: sum
    label: "[0.1,0.125)"
    sql: ${TABLE}.bucket_5 ;;
  }

  measure: bucket_6 {
    type: sum
    label: "[0.125,0.15)"
    sql: ${TABLE}.bucket_6 ;;
  }

  measure: bucket_7 {
    type: sum
    label: "[0.15,0.175)"
    sql: ${TABLE}.bucket_7 ;;
  }

  measure: bucket_8 {
    type: sum
    label: "[0.175,0.2)"
    sql: ${TABLE}.bucket_8 ;;
  }

  measure: bucket_9 {
    type: sum
    label: "[0.2,0.225)"
    sql: ${TABLE}.bucket_9 ;;
  }

  measure: bucket_10 {
    type: sum
    label: "[0.225,0.25)"
    sql: ${TABLE}.bucket_10 ;;
  }

  measure: bucket_11 {
    type: sum
    label: "[0.25,0.275)"
    sql: ${TABLE}.bucket_11 ;;
  }

  measure: bucket_12 {
    type: sum
    label: "[0.275,0.3)"
    sql: ${TABLE}.bucket_12 ;;
  }

  measure: bucket_13 {
    type: sum
    label: "[0.3,0.325)"
    sql: ${TABLE}.bucket_13 ;;
  }

  measure: bucket_14 {
    type: sum
    label: "[0.325,0.35)"
    sql: ${TABLE}.bucket_14 ;;
  }

  measure: bucket_15 {
    type: sum
    label: "[0.35,0.375)"
    sql: ${TABLE}.bucket_15 ;;
  }

  measure: bucket_16 {
    type: sum
    label: "[0.375,0.4)"
    sql: ${TABLE}.bucket_16 ;;
  }

  measure: bucket_17 {
    type: sum
    label: "[0.4,0.425)"
    sql: ${TABLE}.bucket_17 ;;
  }

  measure: bucket_18 {
    type: sum
    label: "[0.425,0.45)"
    sql: ${TABLE}.bucket_18 ;;
  }

  measure: bucket_19 {
    type: sum
    label: "[0.45,0.475)"
    sql: ${TABLE}.bucket_19 ;;
  }

  measure: bucket_20 {
    type: sum
    label: "[0.475,0.5)"
    sql: ${TABLE}.bucket_20 ;;
  }

  measure: bucket_21 {
    type: sum
    label: "[0.5,0.525)"
    sql: ${TABLE}.bucket_21 ;;
  }

  measure: bucket_22 {
    type: sum
    label: "[0.525,0.55)"
    sql: ${TABLE}.bucket_22 ;;
  }

  measure: bucket_23 {
    type: sum
    label: "[0.55,0.575)"
    sql: ${TABLE}.bucket_23 ;;
  }

  measure: bucket_24 {
    type: sum
    label: "[0.575,0.6)"
    sql: ${TABLE}.bucket_24 ;;
  }

  measure: bucket_25 {
    type: sum
    label: "[0.6,0.625)"
    sql: ${TABLE}.bucket_25 ;;
  }

  measure: bucket_26 {
    type: sum
    label: "[0.625,0.65)"
    sql: ${TABLE}.bucket_26 ;;
  }

  measure: bucket_27 {
    type: sum
    label: "[0.65,0.675)"
    sql: ${TABLE}.bucket_27 ;;
  }

  measure: bucket_28 {
    type: sum
    label: "[0.675,0.7)"
    sql: ${TABLE}.bucket_28 ;;
  }

  measure: bucket_29 {
    type: sum
    label: "[0.7,0.725)"
    sql: ${TABLE}.bucket_29 ;;
  }

  measure: bucket_30 {
    type: sum
    label: "[0.725,0.75)"
    sql: ${TABLE}.bucket_30 ;;
  }

  measure: bucket_31 {
    type: sum
    label: "[0.75,0.775)"
    sql: ${TABLE}.bucket_31 ;;
  }

  measure: bucket_32 {
    type: sum
    label: "[0.775,0.8)"
    sql: ${TABLE}.bucket_32 ;;
  }

  measure: bucket_33 {
    type: sum
    label: "[0.8,0.825)"
    sql: ${TABLE}.bucket_33 ;;
  }

  measure: bucket_34 {
    type: sum
    label: "[0.825,0.85)"
    sql: ${TABLE}.bucket_34 ;;
  }

  measure: bucket_35 {
    type: sum
    label: "[0.85,0.875)"
    sql: ${TABLE}.bucket_35 ;;
  }

  measure: bucket_36 {
    type: sum
    label: "[0.875,0.9)"
    sql: ${TABLE}.bucket_36 ;;
  }

  measure: bucket_37 {
    type: sum
    label: "[0.9,0.925)"
    sql: ${TABLE}.bucket_37 ;;
  }

  measure: bucket_38 {
    type: sum
    label: "[0.925,0.95)"
    sql: ${TABLE}.bucket_38 ;;
  }

  measure: bucket_39 {
    type: sum
    label: ">=0.95"
    sql: ${TABLE}.bucket_39 ;;
  }

  set: detail {
    fields: [
      company,
      bucket_1,
      bucket_2,
      bucket_3,
      bucket_4,
      bucket_5,
      bucket_6,
      bucket_7,
      bucket_8,
      bucket_9,
      bucket_10,
      bucket_11,
      bucket_12,
      bucket_13,
      bucket_14,
      bucket_15,
      bucket_16,
      bucket_17,
      bucket_18,
      bucket_19,
      bucket_20,
      bucket_21,
      bucket_22,
      bucket_23,
      bucket_24,
      bucket_25,
      bucket_26,
      bucket_27,
      bucket_28,
      bucket_29,
      bucket_30,
      bucket_31,
      bucket_32,
      bucket_33,
      bucket_34,
      bucket_35,
      bucket_36,
      bucket_37,
      bucket_38,
      bucket_39
    ]
  }
}
