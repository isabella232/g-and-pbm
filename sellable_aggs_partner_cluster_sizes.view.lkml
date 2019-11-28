view: sellable_aggs_partner_cluster_sizes {
  derived_table: {
    sql: WITH MAG AS(WITH AGG AS(SELECT cookiedomain, MAX(event_date) latest_date
      FROM no_id_logs.sellable_pairs_aggregates
      GROUP BY 1)

      SELECT t1.cookiedomain, t1.cluster_size, sum(t1.clusters) region_count
      FROM no_id_logs.sellable_pairs_aggregates t1
      JOIN AGG ON t1.cookiedomain = AGG.cookiedomain AND t1.event_date=AGG.latest_date
      GROUP BY 1,2),
      bidder_sync_names AS (SELECT r.pub_or_app_id, bidder_array[r.pub_or_app_id] name
            FROM (
            SELECT MAP(ARRAY['185143','191160','195755','200441','200445','199768','200442','183292','1118','44489','7156','24314','71340','49001','2380','5298','24314','1944','26575','78877','88068','79701','91218','91219','98254','98251','82774','82775','117708','100905','106904','127211','idfa','aaid','170004','177716','182459'],
            ARRAY['Walmart','pearsonEdu','PubMatic','ClickCertain','Zeotap','Throtle','ZetaGlobal','SmartyAds','LiveIntent DSP','The Trade Desk','MediaMath','DoubleClick','Criteo S2S','Aolone','Centro','Bidswitch','Google DBM','Tapad','Pocketmath','Sociomantic','Taboola','Datalogix','AppNexus','DataXu','Zemanta','Pulsepoint','Bluekai','Adobe','Exelate','Neustar','Adara','Lotame','idfa','aaid','Idify','Conversant','ZeoTap']) as bidder_array)
            CROSS JOIN UNNEST(MAP_KEYS(bidder_array)) AS r (pub_or_app_id)
            GROUP BY 1,2)

            SELECT
              bidder_sync_names.name  AS "bidder_sync_names.name",
              MAG.cluster_size AS "MAG.cluster_size",
              COALESCE(SUM(MAG.region_count), 0) AS "MAG.total"
            FROM MAG
            LEFT JOIN bidder_sync_names ON MAG.cookiedomain = bidder_sync_names.pub_or_app_id
            GROUP BY 1,2
            ORDER BY 1,2
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

  dimension: mag_cluster_size {
    type: string
    sql: ${TABLE}."MAG.cluster_size" ;;
  }

  measure: mag_total {
    type: sum
    sql: ${TABLE}."MAG.total" ;;
  }

  set: detail {
    fields: [bidder_sync_names_name, mag_cluster_size, mag_total]
  }
}
