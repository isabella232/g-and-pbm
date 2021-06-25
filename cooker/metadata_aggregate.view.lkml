view: metadata_aggregate {
  sql_table_name: AwsDataCatalog.cooker.cooker_metadata_agg ;;
  suggestions: no

  dimension: error_message {
    type: string
    sql: NULLIF(${TABLE}.error,'') ;;
    group_label: "Error"
    group_item_label: "Description"
    description: "Error message given"
  }

  dimension: had_parsing_error {
    type: yesno
    sql: ${error_message} IS NOT NULL AND ${error_message} NOT LIKE '%Failed to load resource: ABORTED' ;;
    group_label: "Error"
    description: "Did the parsed URL experience an error message?"
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
    label: "Run"
    description: "Cooker run timestamp"
  }

  dimension: cooker_date {
    type: string
    sql: ${TABLE}.cookerdate ;;
    hidden: yes
    description: "Simplified date to make simpler joins with aggregate tables"
  }

  dimension: has_bouncex {
    type: yesno
    sql: ${TABLE}.hasbouncex ;;
    description: "URL contained BounceX (now Wunderkind)"
  }

  dimension: has_taboola {
    type: yesno
    sql: ${TABLE}.hastaboola ;;
    description: "URL contained Taboola"
  }

  dimension: has_outbrain {
    type: yesno
    sql: ${TABLE}.hasoutbrain ;;
    description: "URL contained Outbrain"
  }

  dimension: header_ssp_adapters {
    type: string
    sql: ${TABLE}.headersspadapters ;;
    description: "List of all header SSP modules"
  }

  dimension: has_prebid {
    type: yesno
    sql: ${TABLE}.isprebid ;;
    description: "URL contained Prebid wrapper"
  }

  dimension: ix_library_type {
    type: string
    sql: NULLIF(${TABLE}.ixlibrary,'') ;;
    label: "Library Name"
    description: "Name of IX library"
    group_label: "Index Exchange"
  }

  dimension: has_liveconnect_tag {
    type: yesno
    sql: ${TABLE}.liveconnecttag = 'true' ;;
    description: "URL contained LiveConnect tag"
  }

  dimension: prebid_version {
    type: string
    sql: ${TABLE}.prebidversion ;;
    description: "Version of Prebid wrapper"
    group_label: "Prebid"
    group_item_label: "Wrapper Version"
  }

  dimension: prebid_wrapper_name {
    type: string
    sql: ${TABLE}.prebidwrappername ;;
    description: "Name of Prebid wrapper"
    group_label: "Prebid"
    group_item_label: "Wrapper Name"
  }

  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
    description: "URL used in lookup by crawler. This URL is provided by a .txt file that is fed into Cooker programmatically.
    If you wish to add a URL or think one is missing please contact the product owner responsible for Cooker."
  }

  dimension: domain {
    type: string
    sql: REGEXP_EXTRACT(${url},'^https?:\/\/\w+\.([^\/]+)\/?$',1) ;;
    description: "Domain extracted from url (can be inexact due to regex)"
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
    group_label: "Index Exchange"
    hidden: yes
    description: "List of all IndexExchange ID modules"
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
    group_label: "Index Exchange"
    description: "Number of Index Exchange modules"
    label: "Installed IX Modules"
  }

  dimension: contains_liveintent {
    type: yesno
    sql: CONTAINS(${ix_idmodules},'LiveIntentIp') ;;
    group_label: "Index Exchange"
    description: "LiveIntent installed in IX"
  }

  dimension: contains_merkle {
    type: yesno
    sql: CONTAINS(${ix_idmodules},'MerkleIp') ;;
    group_label: "Index Exchange"
    description: "Merkle installed in IX"
  }

  dimension: contains_liveramp {
    type: yesno
    sql: CONTAINS(${ix_idmodules},'LiveRampIp') ;;
    group_label: "Index Exchange"
    description: "LiveRamp installed in IX"
  }

  dimension: contains_ad_server_org {
    type: yesno
    sql: CONTAINS(${ix_idmodules},'AdserverOrgIp') ;;
    group_label: "Index Exchange"
    description: "adsrvr.org installed in IX"
  }

  # Prebid ID Module Dimensions

  dimension: prebid_idmodules {
    type: string
    sql: ${TABLE}.prebididmodules ;;
    group_label: "Prebid"
    hidden: yes
    # hidden because all values are currently handled through booleans
    description: "List of installed Prebid modules"
  }

  dimension: number_installed_prebid_modules {
    type: number
    sql: COALESCE(CARDINALITY(${prebid_idmodules}),0) ;;
    group_label: "Prebid"
    group_item_label: "Installed Prebid Modules"
    description: "Number of installed Prebid modules"
  }

  dimension: contains_lotame_panorama {
    type: yesno
    sql: CONTAINS(${prebid_idmodules},'lotamePanoramaId') ;;
    group_label: "Prebid"
    description: "Panorama ID installed in Prebid"
  }

  dimension: contains_shared_id {
    type: yesno
    sql: CONTAINS(${prebid_idmodules},'sharedId') ;;
    group_label: "Prebid"
    group_item_label: "Contains Shared ID"
    description: "Shared ID installed in Prebid"
  }

  dimension: contains_britepool {
    type: yesno
    sql: CONTAINS(${prebid_idmodules},'britepoolId') ;;
    group_label: "Prebid"
    description: "Britepool installed in Prebid"
  }

  dimension: contains_parrable {
    type: yesno
    sql: CONTAINS(${prebid_idmodules},'parrableId') ;;
    group_label: "Prebid"
    description: "Parrable installed in Prebid"
  }

  dimension: contains_merkle_prebid {
    type: yesno
    sql: CONTAINS(${prebid_idmodules},'merkleId') ;;
    group_label: "Prebid"
    group_item_label: "Contains Merkle"
    description: "Merkle installed in Prebid"
  }

  dimension: contains_unifiedid {
    type: yesno
    sql: CONTAINS(${prebid_idmodules},'unifiedId') ;;
    group_label: "Prebid"
    group_item_label: "Contains Unified ID"
    description: "Unified ID installed in Prebid"
  }

  dimension: contains_criteo {
    type: yesno
    sql: CONTAINS(${prebid_idmodules},'criteo') ;;
    group_label: "Prebid"
    description: "Criteo installed in Prebid"
  }

  dimension: contains_digitrust {
    type: yesno
    sql: CONTAINS(${prebid_idmodules},'digitrust') ;;
    group_label: "Prebid"
    description: "DigiTrust (now defunct) installed in Prebid"
  }

  dimension: contains_id5ID {
    type: yesno
    sql: CONTAINS(${prebid_idmodules},'id5Id') ;;
    group_label: "Prebid"
    description: "ID5 Universal ID installed in Prebid"
    group_item_label: "Contains ID5 ID"
  }

  dimension: contains_identitylink {
    type: yesno
    sql: CONTAINS(${prebid_idmodules},'identityLink') ;;
    group_label: "Prebid"
    description: "LiveRamp Identity Link installed in Prebid"
    group_item_label: "Contains Identity Link"
  }

  dimension: contains_pubcommonid {
    type: yesno
    sql: CONTAINS(${prebid_idmodules},'pubCommonId') ;;
    group_label: "Prebid"
    description: "Pub Common ID installed in Prebid"
    group_item_label: "Contains Pub Common ID"
  }

  dimension: has_liveintent_idmodule_enabled_in_prebid {
    type: yesno
    sql: ${TABLE}.isliveintentidmoduleenabledinprebid ;;
    group_label: "Prebid"
    label: "Contains LiveIntent"
    description: "LiveIntent installed in Prebid"
  }

  # header SSP adapters #

  dimension: contains_rubicon {
    type: yesno
    sql: CARDINALITY(FILTER(${header_ssp_adapters}, x -> x LIKE 'rubi%')) > 0 ;;
    group_label: "Header SSP Adapter Types"
    description: "Rubicon available in header SSP Adapters"
  }

  dimension: contains_pubmatic {
    type: yesno
    sql: CARDINALITY(FILTER(${header_ssp_adapters}, x -> x LIKE 'pubmatic%')) > 0 ;;
    group_label: "Header SSP Adapter Types"
    description: "Pubmatic available in header SSP Adapters"
  }

  dimension: contains_openx {
    type: yesno
    sql: CARDINALITY(FILTER(${header_ssp_adapters}, x -> x LIKE 'openx%')) > 0 ;;
    group_label: "Header SSP Adapter Types"
    description: "OpenX available in header SSP adapters"
  }

  dimension: contains_ix {
    type: yesno
    sql: CARDINALITY(FILTER(${header_ssp_adapters}, x -> x = 'ix')) > 0 ;;
    group_label: "Header SSP Adapter Types"
    description: "IX available in header SSP adapters"
  }

  dimension: contains_index_exchange {
    type: yesno
    sql: CARDINALITY(FILTER(${header_ssp_adapters}, x -> x LIKE '%indexexchange%')) > 0 ;;
    group_label: "Header SSP Adapter Types"
    description: "Index Exchange available in header SSP adapters"
  }

  dimension: contains_trustx {
    type: yesno
    sql: CARDINALITY(FILTER(${header_ssp_adapters}, x -> x LIKE '%trustx%')) > 0 ;;
    group_label: "Header SSP Adapter Types"
    description: "TrustX available in header SSP adapters"
  }

  dimension: contains_mediagrid {
    type: yesno
    sql: CARDINALITY(FILTER(${header_ssp_adapters}, x -> x LIKE '%grid%')) > 0 ;;
    group_label: "Header SSP Adapter Types"
    description: "MediaGrid available in header SSP adapters"
  }

  dimension: contains_appnexus {
    type: yesno
    sql: CARDINALITY(FILTER(${header_ssp_adapters}, x -> x LIKE 'appnexus%')) > 0 ;;
    group_label: "Header SSP Adapter Types"
    description: "AppNexus available in header SSP adapters"
  }

  # TagsDown Classifiers #

  dimension: liveintent_user_id_module_active {
    type: yesno
    sql: ${has_liveintent_idmodule_enabled_in_ix} OR ${has_liveintent_idmodule_enabled_in_prebid} ;;
    hidden: yes
    description: "Determines whether the LI module in installed in IX or in Prebid"
  }

  dimension: tagsdown_status {
    type: string
    sql: CASE WHEN ${zf_pubvertisers.name} IS NULL THEN 'No matching publisher ID'
              WHEN ${domain_properties_production.cname} IS NULL THEN 'No matching CNAME'
              WHEN NOT(${domain_properties_production.hasssl}) THEN 'CNAME missing SSL'
              WHEN NOT(${has_liveconnect_tag}) THEN 'No LiveConnect tag'
              WHEN NOT(${liveintent_user_id_module_active}) THEN 'No LI user modules'
              ELSE 'Full setup publisher'
              END;;
    description: "Status of publisher setups based on whether or not their URL(s) contained certain requirements.
    Status is based on the first criteria that a URL does NOT have in the following order:
    Pub ID ➔ CNAME ➔ SSL ➔ LC Tag ➔ LI header module"
  }

  dimension: cname {
    type: string
    sql: ${domain_properties_production.cname} ;;
    group_label: "CNAME"
    group_item_label: "Name"
    description: "CNAME provided by Akamai"
  }

  dimension: is_secure_cname {
    type: yesno
    sql: ${domain_properties_production.hasssl};;
    group_label: "CNAME"
    group_item_label: "Is Secure"
    description: "Does the CNAME contain an SSL certificate?"
  }

  measure: tagsdown_types {
    type: list
    list_field: tagsdown_status
    description: "List of all tagsdown statuses. Useful in case that a publisher has more than one URL in cooker, as it will contain all existing URL tagsdown statuses in one column"
  }

  measure: count {
    type: count
    drill_fields: [url, has_prebid, has_bouncex, ix_library_type, has_liveconnect_tag, has_bouncex]
    description: "Simple count of most granular level of data (URL by day)"
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
    label: "Count (URLs)"
    sql: ${url} ;;
    drill_fields: [url]
    description: "Count of specific URLs analyzed by Cooker"
  }

}
