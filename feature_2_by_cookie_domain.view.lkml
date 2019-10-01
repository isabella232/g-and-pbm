view: feature_2_by_cookie_domain {
  derived_table: {
    sql: SELECT cookiedomain,
      SUM(CASE WHEN pwp >0 AND pwp <0.025 THEN 1 ELSE 0 END) bucket_1,
      SUM(CASE WHEN pwp >=0.025 AND pwp <0.05 THEN 1 ELSE 0 END) bucket_2,
      SUM(CASE WHEN pwp >=0.05 AND pwp <0.075 THEN 1 ELSE 0 END) bucket_3,
      SUM(CASE WHEN pwp >=0.075 AND pwp <0.1 THEN 1 ELSE 0 END) bucket_4,
      SUM(CASE WHEN pwp >=0.1 AND pwp <0.125 THEN 1 ELSE 0 END) bucket_5,
      SUM(CASE WHEN pwp >=0.125 AND pwp <0.15 THEN 1 ELSE 0 END) bucket_6,
      SUM(CASE WHEN pwp >=0.15 AND pwp <0.175 THEN 1 ELSE 0 END) bucket_7,
      SUM(CASE WHEN pwp >=0.175 AND pwp <0.2 THEN 1 ELSE 0 END) bucket_8,
      SUM(CASE WHEN pwp >=0.2 AND pwp <0.225 THEN 1 ELSE 0 END) bucket_9,
      SUM(CASE WHEN pwp >=0.225 AND pwp <0.25 THEN 1 ELSE 0 END) bucket_10,
      SUM(CASE WHEN pwp >=0.25 AND pwp <0.275 THEN 1 ELSE 0 END) bucket_11,
      SUM(CASE WHEN pwp >=0.275 AND pwp <0.3 THEN 1 ELSE 0 END) bucket_12,
      SUM(CASE WHEN pwp >=0.3 AND pwp <0.325 THEN 1 ELSE 0 END) bucket_13,
      SUM(CASE WHEN pwp >=0.325 AND pwp <0.35 THEN 1 ELSE 0 END) bucket_14,
      SUM(CASE WHEN pwp >=0.35 AND pwp <0.375 THEN 1 ELSE 0 END) bucket_15,
      SUM(CASE WHEN pwp >=0.375 AND pwp <0.4 THEN 1 ELSE 0 END) bucket_16,
      SUM(CASE WHEN pwp >=0.4 AND pwp <0.425 THEN 1 ELSE 0 END) bucket_17,
      SUM(CASE WHEN pwp >=0.425 AND pwp <0.45 THEN 1 ELSE 0 END) bucket_18,
      SUM(CASE WHEN pwp >=0.45 AND pwp <0.475 THEN 1 ELSE 0 END) bucket_19,
      SUM(CASE WHEN pwp >=0.475 AND pwp <0.5 THEN 1 ELSE 0 END) bucket_20,
      SUM(CASE WHEN pwp >=0.5 AND pwp <0.525 THEN 1 ELSE 0 END) bucket_21,
      SUM(CASE WHEN pwp >=0.525 AND pwp <0.55 THEN 1 ELSE 0 END) bucket_22,
      SUM(CASE WHEN pwp >=0.55 AND pwp <0.575 THEN 1 ELSE 0 END) bucket_23,
      SUM(CASE WHEN pwp >=0.575 AND pwp <0.6 THEN 1 ELSE 0 END) bucket_24,
      SUM(CASE WHEN pwp >=0.6 AND pwp <0.625 THEN 1 ELSE 0 END) bucket_25,
      SUM(CASE WHEN pwp >=0.625 AND pwp <0.65 THEN 1 ELSE 0 END) bucket_26,
      SUM(CASE WHEN pwp >=0.65 AND pwp <0.675 THEN 1 ELSE 0 END) bucket_27,
      SUM(CASE WHEN pwp >=0.675 AND pwp <0.7 THEN 1 ELSE 0 END) bucket_28,
      SUM(CASE WHEN pwp >=0.7 AND pwp <0.725 THEN 1 ELSE 0 END) bucket_29,
      SUM(CASE WHEN pwp >=0.725 AND pwp <0.75 THEN 1 ELSE 0 END) bucket_30,
      SUM(CASE WHEN pwp >=0.75 AND pwp <0.775 THEN 1 ELSE 0 END) bucket_31,
      SUM(CASE WHEN pwp >=0.775 AND pwp <0.8 THEN 1 ELSE 0 END) bucket_32,
      SUM(CASE WHEN pwp >=0.8 AND pwp <0.825 THEN 1 ELSE 0 END) bucket_33,
      SUM(CASE WHEN pwp >=0.825 AND pwp <0.85 THEN 1 ELSE 0 END) bucket_34,
      SUM(CASE WHEN pwp >=0.85 AND pwp <0.875 THEN 1 ELSE 0 END) bucket_35,
      SUM(CASE WHEN pwp >=0.875 AND pwp <0.9 THEN 1 ELSE 0 END) bucket_36,
      SUM(CASE WHEN pwp >=0.9 AND pwp <0.925 THEN 1 ELSE 0 END) bucket_37,
      SUM(CASE WHEN pwp >=0.925 AND pwp <0.95 THEN 1 ELSE 0 END) bucket_38,
      SUM(CASE WHEN pwp >=0.95 THEN 1 ELSE 0 END) bucket_39
      FROM auto_sellable.sellable_pair_with_attributes
      WHERE date_p='20190910'
      AND region_p = 'US'
      GROUP BY 1
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
    }
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: cookiedomain {
    type: string
    sql: ${TABLE}.cookiedomain ;;
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



  set: detail {
    fields: [
      cookiedomain,
      bucket_1,
      bucket_2,
      bucket_3,
      bucket_4,
      bucket_5,
      bucket_6,
      bucket_7,
      bucket_8,
      bucket_9,
      bucket_10
    ]
  }
}
