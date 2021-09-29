view: partner_cookie_stats {

  derived_table: {
    sql: SELECT *
        FROM auto_dmps.partner_cookie_stats
        CROSS JOIN UNNEST(reqtypemap) as r(req_type,req_type_vol);;
  }

  suggestions: no

  dimension: primary_key {
    type: string
    sql: CONCAT(domain,date_p,req_type) ;;
    primary_key: yes
    hidden: yes
  }

  dimension_group: date_p {
    type: time
    label: "Run"
    timeframes: [date, month, week, quarter, year]
    sql: DATE_PARSE(${TABLE}.date_p,'%Y%m%d') ;;
    description: "Date of report generation"
  }

  dimension: domain {
    type: string
    sql: ${TABLE}.domain ;;
    label: "Cookie Domain ID"
    description: "Third-party ID"
  }

  dimension_group: first_seen {
    type: time
    description: "When the partner ID was first observed"
    timeframes: [date, month, week, quarter, year]
    sql: DATE_PARSE(${TABLE}.firstseenat,'%Y%m%d');;

  }

  dimension_group: last_bid {
    type: time
    description: "When the last bid for the partner ID was seen on the LI exchange"
    timeframes: [date, month, week, quarter, year]
    sql: FROM_UNIXTIME(${TABLE}.lastbid) ;;
  }

  dimension_group: last_seen {
    type: time
    description: "When the partner ID was last observed"
    timeframes: [date, month, week, quarter, year]
    sql: DATE_PARSE(${TABLE}.lastseenat,'%Y%m%d');;
  }

  dimension: numbids {
    type: string
    sql: ${TABLE}.numbids ;;
    hidden: yes
    # It is unclear to me what this represents...? The number of bids recieved for the domain– but then why is it an array and what do the keys represent?
  }

  dimension: numdeleted {
    type: number
    sql: ${TABLE}.numdeleted ;;
    hidden: yes
  }

  dimension: numnew {
    type: number
    sql: ${TABLE}.numnew ;;
    hidden: yes
  }

  dimension: reqtypemap {
    type: string
    sql: ${TABLE}.reqtypemap ;;
    hidden: yes
  }

  dimension: totalcount {
    type: number
    sql: ${TABLE}.totalcount ;;
    hidden: yes
  }

  dimension: sync_request_type {
    type: string
    sql: ${TABLE}.req_type ;;
    description: "Method in which the partner ID was synced to LI"
  }

  dimension: request_type_volume_dim {
    type: number
    sql: ${TABLE}.req_type_vol ;;
    hidden: yes
  }

  measure: total_cookies {
    type: sum_distinct
    sql: ${totalcount} ;;
    group_label: "Cookie Counts"
    group_item_label: "Total"
    description: "All cookies observed"
  }

  measure: new_cookies {
    type: sum_distinct
    sql: ${numnew} ;;
    group_label: "Cookie Counts"
    group_item_label: "New"
    description: "New cookies added "
  }

  measure: deleted_cookies {
    type: sum_distinct
    sql: ${numdeleted} ;;
    group_label: "Cookie Counts"
    group_item_label: "Deleted"
    description: "Existing cookies removed"
  }

  measure: total_syncs {
    type: sum
    sql: ${request_type_volume_dim} ;;
    description: "Number of times sync was intiated from partner to LI"
  }

}
