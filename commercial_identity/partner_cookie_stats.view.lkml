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
    sql: DATE_PARSE(${TABLE}.date_p,'%Y%m%d') ;;
  }

  dimension: domain {
    type: string
    sql: ${TABLE}.domain ;;
  }

  dimension: first_seen_at {
    type: date
    sql: DATE_PARSE(${TABLE}.firstseenat,'%Y%m%d');;
  }

  dimension: lastbid {
    type: number
    value_format_name: id
    sql: ${TABLE}.lastbid ;;
  }

  dimension: last_seen_at {
    type: date
    sql: DATE_PARSE(${TABLE}.lastseenat,'%Y%m%d');;
  }

  dimension: numbids {
    type: string
    sql: ${TABLE}.numbids ;;
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

  dimension: request_type {
    type: string
    sql: ${TABLE}.req_type ;;
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
  }

  measure: new_cookies {
    type: sum_distinct
    sql: ${numnew} ;;
    group_label: "Cookie Counts"
    group_item_label: "New"
  }

  measure: deleted_cookies {
    type: sum_distinct
    sql: ${numdeleted} ;;
    group_label: "Cookie Counts"
    group_item_label: "Deleted"
  }

  measure: request_type_volume {
    type: sum
    sql: ${request_type_volume_dim} ;;
  }

}
