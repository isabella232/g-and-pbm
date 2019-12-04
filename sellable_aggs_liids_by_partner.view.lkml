view: sellable_aggs_liids_by_partner {
  derived_table: {
    sql: WITH MAG AS (WITH AGG AS (SELECT cookiedomain, max(event_date) latest_date
      FROM no_id_logs.sellable_pairs_pii_cookie_domain
      GROUP BY 1)

      SELECT t1.cookiedomain, sum(t1.pii_count) LIIDs
      FROM no_id_logs.sellable_pairs_pii_cookie_domain t1
      JOIN AGG ON t1.cookiedomain = AGG.cookiedomain AND t1.event_date = AGG.latest_date
      GROUP BY 1),
      bidder_sync_names AS (SELECT r.pub_or_app_id, bidder_array[r.pub_or_app_id] name
      FROM ( SELECT MAP(ARRAY['185143','191160','195755','200441','200445','199768','200442','183292','1118','44489','7156','24314','71340','49001','2380','5298','24314','1944','26575','78877','88068','79701','91218','91219','98254','98251','82774','82775','117708','100905','106904','127211','idfa','aaid','170004','177716','182459'], ARRAY['Walmart','pearsonEdu','PubMatic','ClickCertain','Zeotap','Throtle','ZetaGlobal','SmartyAds','LiveIntent DSP','The Trade Desk','MediaMath','DoubleClick','Criteo S2S','Aolone','Centro','Bidswitch','Google DBM','Tapad','Pocketmath','Sociomantic','Taboola','Datalogix','AppNexus','DataXu','Zemanta','Pulsepoint','Bluekai','Adobe','Exelate','Neustar','Adara','Lotame','idfa','aaid','Idify','Conversant','ZeoTap']) as bidder_array)
      CROSS JOIN UNNEST(MAP_KEYS(bidder_array)) AS r (pub_or_app_id) GROUP BY 1,2)

      SELECT bidder_sync_names.name  AS "bidder_sync_names.name",
      COALESCE(SUM(MAG.LIIDs), 0) AS "unique_hems_by_cookie_domain.LIIDs"
      FROM MAG
      LEFT JOIN bidder_sync_names ON MAG.cookiedomain = bidder_sync_names.pub_or_app_id
      GROUP BY 1
       ;;
  }

  suggestions: no

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: bidder_sync_names_name {
    type: string
    sql: ${TABLE}."bidder_sync_names.name" ;;
  }

  measure: unique_hems_by_cookie_domain_liids {
    type: sum
    sql: ${TABLE}."unique_hems_by_cookie_domain.LIIDs" ;;
  }

  set: detail {
    fields: [bidder_sync_names_name, unique_hems_by_cookie_domain_liids]
  }
}
