view: active_hash_volume {
  sql_table_name: dsa.active_hash_volume ;;

  dimension: hash_status {
    type: string
    sql: ${TABLE}.emailhash_status ;;
    description: "Last time the hash in the pairing was registered on LI exchange"
  }

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

  dimension: mapping_type {
    type: string
    sql: ${TABLE}.mapping_type ;;
  }

  dimension: pairing_exclusive_to_mapping_type {
    type: yesno
    sql: ${TABLE}.pairing_exclusive_to_mapping_type ;;
    description: "Pairing has only been found by one mapping type"
  }

  dimension: is_active {
    type: yesno
    sql: ${hash_status} <> 'inactive' ;;
  }

  measure: pairs {
    type: sum
    sql: ${TABLE}.pairs ;;
  }

}
