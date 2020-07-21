view: daily_no_syncing_partners {
  derived_table: {
    sql:
    SELECT date_p, COUNT(DISTINCT(publisherorappid)) no_partners
    FROM auto_reports.detailed_daily_partner_inbound_sync_aggregates
    GROUP BY 1 ;;
    }


  dimension: date {
    type: date
    sql: ${TABLE}.date_p ;;
  }

  measure: no_partners {
    type: number
    sql: ${TABLE}.no_partners ;;
  }

}
