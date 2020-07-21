view: daily_no_syncing_partners {
  derived_table: {
    sql:
    SELECT date, COUNT(DISTINCT(publisherorappid)) no_partners
    FROM auto_reports.detailed_daily_partner_inbound_sync_aggregates
    GROUP BY 1 ;;
    }


  dimension: date {
    type: date
    sql: date_parse(${TABLE}.date,'%Y%m%d') ;;
  }

  measure: no_partners {
    type: sum
    sql: ${TABLE}.no_partners ;;
  }

}
