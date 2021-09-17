

view: lidid_info__20210906 {
  sql_table_name: `elite-contact-671.auto_dmps.lidid_info__20210906`
    ;;

  dimension: basic_info__browser {
    type: string
    sql: ${TABLE}.basicInfo.browser ;;
    group_label: "Basic Info"
    group_item_label: "Browser"
  }

  dimension: basic_info__device_type {
    type: string
    sql: ${TABLE}.basicInfo.deviceType ;;
    group_label: "Basic Info"
    group_item_label: "Device Type"
  }

  dimension: basic_info__os {
    type: string
    sql: ${TABLE}.basicInfo.os ;;
    group_label: "Basic Info"
    group_item_label: "OS"
  }

  dimension: basic_info__requests__requests {
    hidden: yes
    sql: ${TABLE}.basicInfo.requests.requests ;;
    group_label: "Basic Info Requests"
    group_item_label: "Requests"
  }

  dimension: basic_info__seen_as_bot {
    type: yesno
    sql: ${TABLE}.basicInfo.seenAsBot ;;
    group_label: "Basic Info"
    group_item_label: "Seen As Bot"
  }

  dimension: basic_info__urls__max_size {
    type: number
    sql: ${TABLE}.basicInfo.urls.maxSize ;;
    group_label: "Basic Info Urls"
    group_item_label: "Max Size"
  }

  dimension: basic_info__urls__value {
    hidden: yes
    sql: ${TABLE}.basicInfo.urls.value ;;
    group_label: "Basic Info Urls"
    group_item_label: "Value"
  }

  dimension: basic_info__us_privacy_map {
    hidden: yes
    sql: ${TABLE}.basicInfo.usPrivacyMap ;;
    group_label: "Basic Info"
    group_item_label: "Us Privacy Map"
  }

  dimension: basic_info__visits__decayed_visits {
    type: number
    sql: ${TABLE}.basicInfo.visits.decayedVisits ;;
    group_label: "Basic Info Visits"
    group_item_label: "Decayed Visits"
  }

  dimension: basic_info__visits__last31_days {
    type: number
    sql: ${TABLE}.basicInfo.visits.last31Days ;;
    group_label: "Basic Info Visits"
    group_item_label: "Last31 Days"
  }

  dimension: basic_info__visits__last_seen_posix_time {
    type: number
    sql: ${TABLE}.basicInfo.visits.lastSeenPosixTime ;;
    group_label: "Basic Info Visits"
    group_item_label: "Last Seen Posix Time"
  }

  dimension: basic_info__visits__reference_posix_date {
    type: number
    sql: ${TABLE}.basicInfo.visits.referencePosixDate ;;
    group_label: "Basic Info Visits"
    group_item_label: "Reference Posix Date"
  }

  dimension: basic_info__visits__visits_last_week {
    hidden: yes
    sql: ${TABLE}.basicInfo.visits.visitsLastWeek ;;
    group_label: "Basic Info Visits"
    group_item_label: "Visits Last Week"
  }

  dimension: client_id {
    type: string
    sql: ${TABLE}.clientId ;;
  }

  dimension: last_bids__last_extreme_bid {
    type: number
    value_format_name: id
    sql: ${TABLE}.lastBids.lastExtremeBid ;;
    group_label: "Last Bids"
    group_item_label: "Last Extreme Bid"
  }

  dimension: last_bids__last_high_bid {
    type: number
    value_format_name: id
    sql: ${TABLE}.lastBids.lastHighBid ;;
    group_label: "Last Bids"
    group_item_label: "Last High Bid"
  }

  dimension: last_bids__latest_high_bid_sizes {
    hidden: yes
    sql: ${TABLE}.lastBids.latestHighBidSizes ;;
    group_label: "Last Bids"
    group_item_label: "Latest High Bid Sizes"
  }

  measure: count {
    type: count
    drill_fields: []
  }
}

view: lidid_info__20210906__basic_info__urls__value {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value__first_seen_at {
    type: number
    sql: ${TABLE}.value.firstSeenAt ;;
    group_label: "Value"
    group_item_label: "First Seen At"
  }

  dimension: value__last_seen_at {
    type: number
    sql: ${TABLE}.value.lastSeenAt ;;
    group_label: "Value"
    group_item_label: "Last Seen At"
  }

  dimension: value__times_seen {
    type: number
    sql: ${TABLE}.value.timesSeen ;;
    group_label: "Value"
    group_item_label: "Times Seen"
  }
}

view: lidid_info__20210906__basic_info__us_privacy_map {
  dimension: key {
    type: number
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }
}

view: lidid_info__20210906__basic_info__visits__visits_last_week {
  dimension: lidid_info__20210906__basic_info__visits__visits_last_week {
    type: number
    sql: lidid_info__20210906__basic_info__visits__visits_last_week ;;
  }
}

view: lidid_info__20210906__basic_info__requests__requests {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    hidden: yes
    sql: ${TABLE}.value ;;
  }
}

view: lidid_info__20210906__last_bids__latest_high_bid_sizes {
  dimension: bid_size {
    type: number
    sql: ${TABLE}.bidSize ;;
  }

  dimension: bid_time {
    type: number
    sql: ${TABLE}.bidTime ;;
  }
}

view: lidid_info__20210906__basic_info__requests__requests__value {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value__first_seen_at {
    type: string
    sql: ${TABLE}.value.firstSeenAt ;;
    group_label: "Value"
    group_item_label: "First Seen At"
  }

  dimension: value__last_seen_at {
    type: string
    sql: ${TABLE}.value.lastSeenAt ;;
    group_label: "Value"
    group_item_label: "Last Seen At"
  }
}
