view: lfx_zf_pubvertisers {
  derived_table: {
    sql: SELECT name, CAST(userver_id AS VARCHAR) userver_id, domain
         FROM lfx.zf_pubvertisers
         WHERE CAST(userver_id AS VARCHAR) IN ('57166', '19948', '57424', '28292', '59986', '55772', '55660', '35539', '32441', '58383', '29307', '59074', '53517', '37464', '35759', '56811', '52233', '57333', '52164', '60726', '60753', '56290', '59742', '35758', '56939', '52176', '35004', '41715', '56408', '60289', '54741', '57096', '28751', '39794', '53518', '37065', '35637', '50577', '60507')
        GROUP BY 1,2,3;;
  }

  dimension: domain {
    type: string
    sql: ${TABLE}.domain ;;
    label: "Advertiser Domain"
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: userver_id {
    type: string
    sql: CAST(${TABLE}.userver_id AS VARCHAR) ;;
  }
}
