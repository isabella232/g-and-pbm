view: metadata_aggregate {
  sql_table_name: cooker.cooker_metadata_agg ;;
  suggestions: no

  dimension: error {
    type: string
    sql: ${TABLE}.error ;;
  }

  dimension_group: exact_time {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.exacttime ;;
  }

  dimension: has_bouncex {
    type: yesno
    sql: ${TABLE}.hasbouncex ;;
  }

  dimension: header_ssp_adapters {
    type: string
    sql: ${TABLE}.headersspadapters ;;
  }

  dimension: is_liveintent_idmodule_enabled_in_ix {
    type: yesno
    sql: ${TABLE}.isliveintentidmoduleenabledinix ;;
  }

  dimension: is_liveintent_idmodule_enabled_in_prebid {
    type: yesno
    sql: ${TABLE}.isliveintentidmoduleenabledinprebid ;;
  }

  dimension: is_prebid {
    type: yesno
    sql: ${TABLE}.isprebid ;;
  }

  dimension: ix_idmodules {
    type: string
    sql: ${TABLE}.ixidmodules ;;
  }

  dimension: ix_library {
    type: string
    sql: ${TABLE}.ixlibrary ;;
  }

  dimension: liveconnect_tag {
    type: string
    sql: ${TABLE}.liveconnecttag ;;
  }

  dimension: prebid_idmodules {
    type: string
    sql: ${TABLE}.prebididmodules ;;
  }

  dimension: prebid_version {
    type: string
    sql: ${TABLE}.prebidversion ;;
  }

  dimension: prebid_wrapper_name {
    type: string
    sql: ${TABLE}.prebidwrappername ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
  }

  measure: count {
    type: count
  }
}
