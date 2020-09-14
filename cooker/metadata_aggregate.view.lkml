view: metadata_aggregate {
  sql_table_name: cooker.cooker_metadata_agg ;;
  suggestions: no

  dimension: error_message {
    type: string
    sql: NULLIF(${TABLE}.error,'') ;;
    group_label: "Errors"
  }

  dimension: had_parsing_error {
    type: yesno
    sql: ${error_message} IS NOT NULL AND ${error_message} NOT LIKE '%Failed to load resource: ABORTED' ;;
    group_label: "Errors"
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

  dimension: cooker_date {
    type: string
    sql: ${TABLE}.cookerdate ;;
    hidden: yes
    # created to make simpler joins with aggregate tables
  }

  dimension: has_bouncex {
    type: yesno
    sql: ${TABLE}.hasbouncex ;;
  }

  dimension: has_taboola {
    type: yesno
    sql: ${TABLE}.hastaboola ;;
  }

  dimension: has_outbrain {
    type: yesno
    sql: ${TABLE}.hasoutbrain ;;
  }

  dimension: header_ssp_adapters {
    type: string
    sql: ${TABLE}.headersspadapters ;;
  }

  dimension: has_prebid {
    type: yesno
    sql: ${TABLE}.isprebid ;;
  }

  dimension: ix_library_type {
    type: string
    sql: NULLIF(${TABLE}.ixlibrary,'') ;;
    label: "IX Library Type"
  }

  dimension: has_liveconnect_tag {
    type: yesno
    sql: ${TABLE}.liveconnecttag = 'true' ;;
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

  dimension: domain {
    type: string
    sql: REGEXP_EXTRACT(${url},'^https?:\/\/\w+\.([^\/]+)\/?$',1) ;;
  }

  dimension: primary_key {
    type: string
    sql: CONCAT(${url},CAST(${exact_time_raw} AS VARCHAR)) ;;
    primary_key: yes
    hidden: yes
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

  dimension: number_installed_ix_modules {
    type: number
    sql: COALESCE(CARDINALITY(${ix_idmodules}),0) ;;
    group_label: "IX ID Module Types"
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

  # Prebid ID Module Dimensions

  dimension: prebid_idmodules {
    type: string
    sql: ${TABLE}.prebididmodules ;;
    group_label: "Prebid ID Module Types"
    hidden: yes
    # hidden because all values are currently handled through booleans
  }

  dimension: number_installed_prebid_modules {
    type: number
    sql: COALESCE(CARDINALITY(${prebid_idmodules}),0) ;;
    group_label: "Prebid ID Module Types"
  }

  dimension: contains_unifiedid {
    type: yesno
    sql: CONTAINS(${prebid_idmodules},'unifiedId') ;;
    group_label: "Prebid ID Module Types"
  }

  dimension: contains_criteo {
    type: yesno
    sql: CONTAINS(${prebid_idmodules},'criteo') ;;
    group_label: "Prebid ID Module Types"
  }

  dimension: contains_digitrust {
    type: yesno
    sql: CONTAINS(${prebid_idmodules},'digitrust') ;;
    group_label: "Prebid ID Module Types"
  }

  dimension: contains_id5ID {
    type: yesno
    sql: CONTAINS(${prebid_idmodules},'id5Id') ;;
    group_label: "Prebid ID Module Types"
  }

  dimension: contains_identitylink {
    type: yesno
    sql: CONTAINS(${prebid_idmodules},'identityLink') ;;
    group_label: "Prebid ID Module Types"
  }

  dimension: contains_pubcommonid {
    type: yesno
    sql: CONTAINS(${prebid_idmodules},'pubCommonId') ;;
    group_label: "Prebid ID Module Types"
  }

  dimension: has_liveintent_idmodule_enabled_in_prebid {
    type: yesno
    sql: ${TABLE}.isliveintentidmoduleenabledinprebid ;;
    group_label: "Prebid ID Module Types"
    label: "Contains Liveintent"
  }

  # header SSP adapters #

  dimension: contains_rubicon {
    type: yesno
    sql: CARDINALITY(FILTER(${header_ssp_adapters}, x -> x LIKE 'rubi%')) > 0 ;;
    group_label: "Header SSP Adapter Types"
  }

  dimension: contains_pubmatic {
    type: yesno
    sql: CARDINALITY(FILTER(${header_ssp_adapters}, x -> x LIKE 'pubmatic%')) > 0 ;;
    group_label: "Header SSP Adapter Types"
  }

  dimension: contains_openx {
    type: yesno
    sql: CARDINALITY(FILTER(${header_ssp_adapters}, x -> x LIKE 'openx%')) > 0 ;;
    group_label: "Header SSP Adapter Types"
  }

  dimension: contains_ix {
    type: yesno
    sql: CARDINALITY(FILTER(${header_ssp_adapters}, x -> x = 'ix')) > 0 ;;
    group_label: "Header SSP Adapter Types"
  }

  dimension: contains_index_exchange {
    type: yesno
    sql: CARDINALITY(FILTER(${header_ssp_adapters}, x -> x LIKE '%indexexchange%')) > 0 ;;
    group_label: "Header SSP Adapter Types"
  }

  dimension: contains_trustx {
    type: yesno
    sql: CARDINALITY(FILTER(${header_ssp_adapters}, x -> x LIKE '%trustx%')) > 0 ;;
    group_label: "Header SSP Adapter Types"
  }

  dimension: contains_mediagrid {
    type: yesno
    sql: CARDINALITY(FILTER(${header_ssp_adapters}, x -> x LIKE '%grid%')) > 0 ;;
    group_label: "Header SSP Adapter Types"
  }

  dimension: contains_appnexus {
    type: yesno
    sql: CARDINALITY(FILTER(${header_ssp_adapters}, x -> x LIKE 'appnexus%')) > 0 ;;
    group_label: "Header SSP Adapter Types"
  }

  measure: count {
    type: count
    drill_fields: [url, has_prebid, has_bouncex, ix_library_type, has_liveconnect_tag, has_bouncex]
  }

  measure: avg_ix_modules {
    type: average
    sql: ${number_installed_ix_modules} ;;
    hidden: yes
    # hidden because only has a specific use
  }

  measure: avg_prebid_modules {
    type: average
    sql: ${number_installed_prebid_modules} ;;
    hidden: yes
    # hidden because only has a specific use
  }

  measure: count_urls {
    type: count_distinct
    sql: ${url} ;;
    drill_fields: [url]
  }

}
