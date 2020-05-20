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

  dimension: has_liveintent_idmodule_enabled_in_prebid {
    type: yesno
    sql: ${TABLE}.isliveintentidmoduleenabledinprebid ;;
  }

  dimension: has_prebid {
    type: yesno
    sql: ${TABLE}.isprebid ;;
  }

  dimension: ix_library {
    type: string
    sql: ${TABLE}.ixlibrary ;;
  }

  dimension: has_liveconnect_tag {
    type: yesno
    sql: ${TABLE}.liveconnecttag = 'true' ;;
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

  # IX ID MODULE DIMENSIONS

  dimension: ix_idmodules {
    type: string
    sql: ${TABLE}.ixidmodules ;;
    group_label: "IX ID Module Types"
    hidden: yes
    # Hidden because all values are currently handled through booleans
  }

  dimension: has_liveintent_idmodule_enabled_in_ix {
    type: yesno
    sql: ${TABLE}.isliveintentidmoduleenabledinix ;;
    hidden: yes
    # Hidden because I handle it through the array like all other modules
  }

  dimension: contains_liveintent {
    type: yesno
    sql: CONTAINS(${ix_idmodules},'LiveIntentIp') ;;
    group_label: "IX ID Module Types"
  }

  dimension: contains_merkle {
    type: yesno
    sql: CONTAINS(${ix_idmodules},'MerkleIp') ;;
    group_label: "IX ID Module Types"
  }

  dimension: contains_liveramp {
    type: yesno
    sql: CONTAINS(${ix_idmodules},'LiveRampIp') ;;
    group_label: "IX ID Module Types"
  }

  dimension: contains_ad_server_org {
    type: yesno
    sql: CONTAINS(${ix_idmodules},'AdserverOrgIp') ;;
    group_label: "IX ID Module Types"
  }

  measure: count {
    type: count
  }
}
