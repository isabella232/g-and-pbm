view: d_esp_pairing_volume {
  sql_table_name: dsa.d_esp_pairing_volume ;;

  dimension_group: event {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.event_date ;;
  }

  dimension: partner_type {
    type: string
    sql: CASE ${partner_type_short} WHEN 'A' THEN 'Advertiser'
                                    WHEN 'P' THEN 'Publisher'
                                    WHEN 'LI' THEN 'LiveIntent'
                                    ELSE NULL END
    ;;
  }

  dimension: partner_id {
    type: string
    sql: REGEXP_SUBSTR(${partner_id_hidden},'\\d*$') ;;
  }

### HIDDEN DIMENSIONS ###

  dimension: partner_id_hidden {
    type: string
    sql: ${TABLE}.partner_id ;;
    hidden: yes
  }

  dimension: partner_type_short {
    type: string
    sql: REGEXP_SUBSTR(${partner_id_hidden},'^[^-]*') ;;
    hidden: yes
  }

  dimension: pairing_unique_to_partner {
    type: yesno
    sql: ${TABLE}.pairing_unique_to_partner ;;
    hidden: yes
  }

  dimension: array_contains_other_determinsitic_pairings {
    type: yesno
    sql: ${TABLE}.array_contains_other_determinsitic_pairings ;;
    hidden: yes
  }

  dimension: cardinality_of_maptype_array_is_one {
    type: yesno
    sql: ${TABLE}.cardinality_of_maptype_array_is_one ;;
    hidden: yes
  }

  dimension: d_esp_in_maptype_array {
    type: yesno
    sql: ${TABLE}.d_esp_in_maptype_array ;;
    hidden: yes
  }

### MEASURES ###

  measure: sum_total_pairings {
    type: sum
    sql: ${TABLE}.count_pairings ;;
    label: "Total Pairings"
  }

  measure: sum_exclusive_esp_pairings {
    type: sum
    sql: ${TABLE}.count_pairings ;;
    filters: {
      field: d_esp_in_maptype_array
      value: "yes"
    }
    filters: {
      field: cardinality_of_maptype_array_is_one
      value: "yes"
    }
    label: "Exclusive d/esp Pairings"
  }

  measure: sum_nonexclusive_esp_pairings_deterministic {
    type: sum
    sql: ${TABLE}.count_pairings ;;
    filters: {
      field: d_esp_in_maptype_array
      value: "yes"
    }
    filters: {
      field: cardinality_of_maptype_array_is_one
      value: "no"
    }
    filters: {
      field: array_contains_other_determinsitic_pairings
      value: "yes"
    }
    label: "Non-Exclusive d/esp Pairings (Deterministic Companion)"
  }

  measure: sum_nonexclusive_esp_pairings_other {
    type: sum
    sql: ${TABLE}.count_pairings ;;
    filters: {
      field: d_esp_in_maptype_array
      value: "yes"
    }
    filters: {
      field: cardinality_of_maptype_array_is_one
      value: "no"
    }
    filters: {
      field: array_contains_other_determinsitic_pairings
      value: "no"
    }
    label: "Non-Exclusive d/esp Pairings (Non-Deterministic Companion)"
  }

  measure: sum_no_esp_pairings {
    type: sum
    sql: ${TABLE}.count_pairings ;;
    filters: {
      field: d_esp_in_maptype_array
      value: "no"
    }
    label: "No d/esp Pairings"
  }
}
