view: ccpa_request {
  sql_table_name: auto_logs.ccpa_request ;;
  suggestions: no

  dimension: ackurl {
    # what is this?
    type: string
    sql: ${TABLE}.ackurl ;;
    hidden: yes
  }

  dimension_group: request {
    type: time
    sql: DATE_PARSE(${TABLE}.date_p,'%Y%m%d') ;;
    timeframes: [raw,date,day_of_week,day_of_month,month,quarter,year]
  }

  dimension: emailhashes {
    # as of 25.11.2020 array has val ≤ 1
    type: string
    sql: ${TABLE}.emailhashes ;;
    hidden: yes
  }

  dimension: jwtdsr {
    # what is this?
    type: string
    sql: ${TABLE}.jwtdsr ;;
    hidden: yes
  }

  dimension: lidids {
    # as of 25.11.2020 array has val ≤ 1
    type: string
    sql: ${TABLE}.lidids ;;
    hidden: yes
  }

  dimension: mediagroups {
    # as of 25.11.2020 array has val ≤ 1
    type: string
    sql: ${TABLE}.mediagroups ;;
    hidden: yes
  }

  dimension: media_group_id {
    type: string
    sql: ${mediagroups}[1] ;;
  }

  dimension: mustbecompletedat {
    type: number
    sql: ${TABLE}.mustbecompletedat ;;
    hidden: yes
  }

  dimension: publishers {
    # as of 25.11.2020 array has val ≤ 1
    type: string
    sql: ${TABLE}.publishers ;;
    hidden: yes
  }

  dimension: publisher_id {
    type: string
    sql: ${publishers}[1] ;;
  }

  dimension: request_type {
    type: string
    sql: ${TABLE}.requesttype ;;
    description: "Type of privacy request"
  }

  dimension: requestulid {
    type: string
    sql: ${TABLE}.requestulid ;;
    primary_key: yes
    hidden: yes
  }

  dimension: timestamp {
    type: number
    sql: ${TABLE}."timestamp" ;;
    hidden: yes
  }

  measure: requests {
    type: count
    drill_fields: []
    description: "Requests made to API"
  }

  measure: hashes_submitted {
    type: number
    sql: CARDINALITY(ARRAY_DISTINCT(FLATTEN(ARRAY_AGG(${emailhashes})))) ;;
    group_label: "Submissions"
    group_item_label: "Hashes"
    description: "Unique hashes submitted"
  }

  measure: lidids_submitted {
    type: number
    sql: CARDINALITY(ARRAY_DISTINCT(FLATTEN(ARRAY_AGG(${lidids})))) ;;
    group_label: "Submissions"
    group_item_label: "LIDIDs"
    description: "Unique LIDIDs submitted"
  }
}

view: gdpr_requests {
  extends: [ccpa_request]
  sql_table_name: auto_logs.gdpr_request ;;
}

view: privacy_requests {
  extends: [ccpa_request]
  derived_table: {
    sql: SELECT 'GDPR' as privacy_framework, * FROM auto_logs.gdpr_request
         UNION
         SELECT 'CCPA' as privacy_framework, * FROM auto_logs.ccpa_request;;
  }

  dimension: privacy_framework {
    type: string
    sql: ${TABLE}.privacy_framework ;;
    description: "Framework privacy request was made under"
  }
}
