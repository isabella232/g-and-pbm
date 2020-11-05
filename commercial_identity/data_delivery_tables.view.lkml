view: data_delivery_pair_stats {
  sql_table_name: auto_deliverable.data_delivery_pair_stats ;;
  suggestions: no

  dimension: primary_key {
    type: string
    sql: CONCAT(${delivery_raw},${bucket_p},${cookie_domain_p},${name_p},${region_p}) ;;
    hidden: yes
  }

  dimension: bucket {
    # partitioned bucket preferred
    type: string
    sql: ${TABLE}.bucket ;;
    hidden: yes
  }

  dimension: bucket_p {
    type: string
    sql: ${TABLE}.bucket_p ;;
    label: "Partner Bucket"
    group_label: "Partner"
    group_item_label: "Bucket"
  }

  dimension: configentry {
    # Complex object can't be handled by looker
    type: string
    sql: ${TABLE}.configentry ;;
    hidden: yes
  }

  dimension: configurationname {
    type: string
    sql: ${TABLE}.configurationname ;;
    label: "Partner Name"
    group_label: "Partner"
    group_item_label: "Name"
    drill_fields: [name_p]
  }

  dimension: cookie_domain_p {
    type: string
    sql: ${TABLE}.cookie_domain_p ;;
    label: "Supplied Domain"
  }

  dimension: cookiedomain {
    # partitioned domain preferred
    type: string
    sql: ${TABLE}.cookiedomain ;;
    hidden: yes
  }

  dimension: date {
    # partitioned date preferred
    type: number
    sql: ${TABLE}."date" ;;
    hidden: yes
  }

  dimension_group: delivery {
    type: time
    sql: DATE_PARSE(${TABLE}.date_p,'%Y%m%d') ;;
    timeframes: [raw,date,day_of_week,day_of_month,month,quarter,year]
  }

  dimension: distinctids {
    # Hidden because it is an array so will be split out.
    # Also currently only has cardinality of one (14.10.2020)
    type: string
    sql: ${TABLE}.distinctids ;;
    hidden: yes
  }

  dimension: supplied_ids {
    # Hidden because serves as base for measures
    type: number
    sql: element_at(${TABLE}.distinctids,1)._2 ;;
    hidden: yes
  }

  dimension: distinct_ids_provided {
    type: number
    sql: ${TABLE}.distinctidsprovided ;;
    hidden: yes
  }

  dimension: file_size {
    type: number
    sql: ${TABLE}.filesize ;;
    hidden: yes
  }

  dimension: name {
    # partitioned name preferred
    type: string
    sql: ${TABLE}.name ;;
    hidden: yes
  }

  dimension: name_p {
    type: string
    sql: ${TABLE}.name_p ;;
    label: "Delivery Name"
  }

  dimension: region {
    # partitioned region preferred
    type: string
    sql: ${TABLE}.region ;;
    hidden: yes
  }

  dimension: region_p {
    type: string
    sql: ${TABLE}.region_p ;;
    label: "Delivery Region"
  }

  dimension: sellable_ids_matched {
    type: number
    sql: ${TABLE}.sellableidsmatched ;;
    hidden: yes
  }

  dimension: totalliids {
    type: number
    sql: ${TABLE}.totalliids ;;
    hidden: yes
  }

  dimension: totalmd5s {
    type: number
    sql: ${TABLE}.totalmd5s ;;
    hidden: yes
  }

  dimension: totalrows {
    type: number
    sql: ${TABLE}.totalrows ;;
    hidden: yes
  }

  dimension: totalsha1s {
    type: number
    sql: ${TABLE}.totalsha1s ;;
    hidden: yes
  }

  dimension: totalsha2s {
    type: number
    sql: ${TABLE}.totalsha2s ;;
    hidden: yes
  }

  # Configuration Settings #

  dimension: cookie_filter {
    type: string
    sql: ${TABLE}.configentry.cookiefilter ;;
    group_label: "Delivery Configuration"
    label: "Filter (Cookie)"
  }

  dimension: id_columns {
    type: string
    sql: ARRAY_SORT(${TABLE}.configentry.idcolumns) ;;
    group_label: "Delivery Configuration"
  }

  dimension: cookie_suppression_filter {
    type: string
    sql: ${TABLE}.configentry.cookiesuppressionfilter ;;
    group_label: "Delivery Configuration"
    label: "Filter (Cookie Supression)"
  }

  dimension: cookie_accceptable_mapping_levels {
    type: string
    sql: ARRAY_SORT(${TABLE}.configentry.cookieacceptablemappinglevels) ;;
    group_label: "Delivery Configuration"
  }

  dimension: maid_acceptable_mapping_levels {
    type: string
    sql: ARRAY_SORT(${TABLE}.configentry.maidacceptablemappinglevels);;
    group_label: "Delivery Configuration"
  }

  dimension: max_cookie_hash_rank {
    type: string
    sql: ${TABLE}.configentry.maxcookiehashrank ;;
    group_label: "Delivery Configuration"
  }

  dimension: send_frequency {
    type: string
    sql: ${TABLE}.configentry.frequency ;;
    group_label: "Delivery Configuration"
  }

  dimension: delivery_attributes {
    type: string
    sql: ARRAY_SORT(${TABLE}.configentry.deliveryattributes) ;;
    group_label: "Delivery Configuration"
  }

  dimension: delivery_filter {
    type: string
    sql: ${TABLE}.configentry.filter ;;
    group_label: "Delivery Configuration"
    label: "Filter (Delivery)"
  }

  dimension: hash_filter {
    type: string
    sql: ${TABLE}.configentry.hashfilter ;;
    group_label: "Delivery Configuration"
    label: "Filter (Hash)"
  }

  dimension: hash_suppression_filter {
    type: string
    sql: ${TABLE}.configentry.hashsuppressionfilter ;;
    group_label: "Delivery Configuration"
    label: "Filter (Hash Supression)"
  }

  dimension: segment_filter {
    type: string
    sql: ${TABLE}.configentry.segmentfilter ;;
    group_label: "Delivery Configuration"
    label: "Filter (Segment)"
  }

  dimension: segment_suppression_filter {
    type: string
    sql: ${TABLE}.configentry.segmentsuppressionfilter ;;
    group_label: "Delivery Configuration"
    label: "Filter (Segment Supression)"
  }

  dimension: sftp_directory_prefix {
    type: string
    sql: ${TABLE}.configentry.sftpdirectoryprefix ;;
    group_label: "Delivery Configuration"
  }

  dimension: s3_directory_prefix {
    type: string
    sql: ${TABLE}.configentry.s3directoryprefix ;;
    group_label: "Delivery Configuration"
  }

  dimension: sftp_success_marker {
    type: string
    sql: ${TABLE}.configentry.sftpsuccessmarker ;;
    group_label: "Delivery Configuration"
  }

  dimension: s3_success_marker {
    type: string
    sql: ${TABLE}.configentry.s3successmarker ;;
    group_label: "Delivery Configuration"
  }

  dimension: merge_outputs {
    type: string
    sql: ${TABLE}.configentry.mergeoutputs ;;
    group_label: "Delivery Configuration"
  }

  # Previous Delivery ? #
  # Will be hidden for now because it is unclear what purpose these serve and are mostly empty (14.10.2020) #

  dimension: delta_sftp_directory_prefix {
    type: string
    sql: ${TABLE}.configentry.delta.sftpdirectoryprefix ;;
    group_label: "Previous Delivery Options"
    hidden: yes
  }

  dimension: delta_s3_directory_prefix {
    type: string
    sql: ${TABLE}.configentry.delta.s3directoryprefix ;;
    group_label: "Previous Delivery Options"
    hidden: yes
  }

  dimension: delta_sftp_success_marker {
    type: string
    sql: ${TABLE}.configentry.delta.sftpsuccessmarker ;;
    group_label: "Previous Delivery Options"
    hidden: yes
  }

  dimension: delta_s3_success_marker {
    type: string
    sql: ${TABLE}.configentry.delta.s3successmarker ;;
    group_label: "Previous Delivery Options"
    hidden: yes
  }

  dimension: delta_merge_outputs {
    type: string
    sql: ${TABLE}.configentry.delta.mergeoutputs ;;
    group_label: "Previous Delivery Options"
    hidden: yes
  }

  measure: deliveries {
    type: count
    drill_fields: [configurationname, name]
  }

  measure: sum_supplied_domain_ids {
    type: sum
    sql: ${supplied_ids} ;;
    group_label: "Total"
    group_item_label: "Supplied Domain ID"
  }

  measure: average_supplied_domain_ids {
    type: average
    sql: ${supplied_ids} ;;
    value_format_name: decimal_0
    group_label: "Mean"
    group_item_label: "Supplied Domain ID"
  }

  measure: median_supplied_domain_ids {
    type: median
    sql: ${supplied_ids} ;;
    group_label: "Median"
    group_item_label: "Supplied Domain ID"
  }

  measure: sum_liids {
    type: sum
    sql: ${totalliids} ;;
    group_label: "Total"
    group_item_label: "LIID"
  }

  measure: average_liids {
    type: average
    sql: ${totalliids} ;;
    value_format_name: decimal_0
    group_label: "Mean"
    group_item_label: "LIID"
  }

  measure: median_liids {
    type: median
    sql: ${totalliids} ;;
    value_format_name: decimal_0
    group_label: "Median"
    group_item_label: "LIID"
  }

  measure: sum_md5s {
    type: sum
    sql: ${totalmd5s} ;;
    group_label: "Total"
    group_item_label: "MD5"
  }

  measure: average_md5s {
    type: average
    sql: ${totalmd5s} ;;
    value_format_name: decimal_0
    group_label: "Mean"
    group_item_label: "MD5"
  }

  measure: median_md5s {
    type: median
    sql: ${totalmd5s} ;;
    group_label: "Median"
    group_item_label: "MD5"
  }

  measure: sum_sha1s {
    type: sum
    sql: ${totalsha1s} ;;
    group_label: "Total"
    group_item_label: "SHA1"
  }

  measure: average_sha1s {
    type: average
    sql: ${totalsha1s} ;;
    value_format_name: decimal_0
    group_label: "Mean"
    group_item_label: "SHA1"
  }

  measure: median_sha1s {
    type: median
    sql: ${totalsha1s} ;;
    group_label: "Median"
    group_item_label: "SHA1"
  }

  measure: sum_sha2s {
    type: sum
    sql: ${totalsha2s} ;;
    group_label: "Total"
    group_item_label: "SHA2"
  }

  measure: average_sha2s {
    type: average
    sql: ${totalsha2s} ;;
    value_format_name: decimal_0
    group_label: "Mean"
    group_item_label: "SHA2"
  }

  measure: median_sha2s {
    type: median
    sql: ${totalsha2s} ;;
    group_label: "Median"
    group_item_label: "SHA2"
  }

  measure: sum_file_rows {
    type: sum
    sql: ${totalrows} ;;
    group_label: "Total"
    group_item_label: "File Rows"
    drill_fields: [name_p,totalrows]
  }

  measure: min_file_rows {
    type: min
    sql: ${totalrows} ;;
    group_label: "Minimum"
    group_item_label: "File Rows"
    hidden: yes
  }

  measure: 25ntile_file_rows {
    type: percentile
    percentile: 25
    sql: ${totalrows} ;;
    group_label: "25ntile"
    group_item_label: "File Rows"
    hidden: yes
  }

  measure: 75ntile_file_rows {
    type: percentile
    percentile: 75
    sql: ${totalrows} ;;
    group_label: "75ntile"
    group_item_label: "File Rows"
    hidden: yes
  }

  measure: max_file_rows {
    type: max
    sql: ${totalrows} ;;
    group_label: "Maximum"
    group_item_label: "File Rows"
    hidden: yes
  }

  measure: average_file_rows {
    type: average
    sql: ${totalrows} ;;
    value_format_name: decimal_0
    group_label: "Mean"
    group_item_label: "File Rows"
  }

  measure: median_file_rows {
    type: median
    sql: ${totalrows} ;;
    group_label: "Median"
    group_item_label: "File Rows"
  }

  # The following are hidden because they currently only register zero

  measure: sum_file_size {
    type: sum
    sql: ${file_size} ;;
    group_label: "Total"
    group_item_label: "File Size"
    hidden: yes
  }

  measure: average_file_size {
    type: average
    sql: ${file_size} ;;
    value_format_name: decimal_0
    group_label: "Mean"
    group_item_label: "File Size"
    hidden: yes
  }

  measure: median_file_size {
    type: median
    sql: ${file_size} ;;
    group_label: "Median"
    group_item_label: "File Size"
    hidden: yes
  }

  measure: sum_sellable_ids_matched {
    type: sum
    sql: ${sellable_ids_matched} ;;
    group_label: "Total"
    group_item_label: "Sellable IDs Matched"
    hidden: yes
  }

  measure: average_sellable_ids_matched {
    type: average
    sql: ${sellable_ids_matched} ;;
    group_label: "Mean"
    group_item_label: "Sellable IDs Matched"
    hidden: yes
  }

  measure: median_sellable_ids_matched {
    type: median
    sql: ${sellable_ids_matched} ;;
    group_label: "Median"
    group_item_label: "Sellable IDs Matched"
    hidden: yes
  }

  measure: sum_distinct_ids_provided {
    type: sum
    sql: ${distinct_ids_provided} ;;
    group_label: "Total"
    group_item_label: "Distinct IDs Provided"
    hidden: yes
  }

  measure: average_distinct_ids_provided {
    type: average
    sql: ${distinct_ids_provided} ;;
    group_label: "Mean"
    group_item_label: "Distinct IDs Provided"
    hidden: yes
  }

  measure: median_distinct_ids_provided {
    type: median
    sql: ${distinct_ids_provided} ;;
    group_label: "Median"
    group_item_label: "Distinct IDs Provided"
    hidden: yes
  }
}

view: data_delivery_cluster_stats{
  extends: [data_delivery_pair_stats]
  sql_table_name: auto_deliverable.data_delivery_liid_att_stats;;

  dimension: cookie_filter {
    hidden: yes
  }

  dimension: cookie_suppression_filter {
    hidden: yes
  }

  dimension: cookie_accceptable_mapping_levels {
    hidden: yes
  }

  dimension: maid_acceptable_mapping_levels {
    hidden: yes
  }

  dimension: max_cookie_hash_rank {
    hidden: yes
  }

  dimension: cookie_domain_p {
    hidden: yes
  }

  measure: sum_supplied_domain_ids {
    hidden: yes
  }

  measure: average_supplied_domain_ids {
    hidden: yes
  }

  measure: median_supplied_domain_ids {
    hidden: yes
  }
}
