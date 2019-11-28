view: sellable_aggs_hiaccprob_partner_mapped {
  derived_table: {
    sql: WITH unique_pairs_by_cookie_domain AS (
      SELECT cookiedomain, hiaccprobabilistic bucket, SUM(hiaccprobabilistic_count) hiaccprobabilistic_count
      FROM no_id_logs.sellable_pairs_aggregates
      WHERE event_date = (SELECT max(event_date) FROM no_id_logs.sellable_pairs_aggregates)
      GROUP BY 1,2
      ORDER BY 1,2
             )
        ,  bidder_sync_names AS (SELECT r.pub_or_app_id, bidder_array[r.pub_or_app_id] name
            FROM (
              SELECT
              MAP(ARRAY['185143','191160','195755','200441','200445','199768','200442','183292','1118','44489','7156','24314','71340','49001','2380','5298','24314','1944','26575','78877','88068','79701','91218','91219','98254','98251','82774','82775','117708','100905','106904','127211','idfa','aaid','170004','177716','182459'],
                  ARRAY['Walmart','pearsonEdu','PubMatic','ClickCertain','Zeotap','Throtle','ZetaGlobal','SmartyAds','LiveIntent DSP','The Trade Desk','MediaMath','DoubleClick','Criteo S2S','Aolone','Centro','Bidswitch','Google DBM','Tapad','Pocketmath','Sociomantic','Taboola','Datalogix','AppNexus','DataXu','Zemanta','Pulsepoint','Bluekai','Adobe','Exelate','Neustar','Adara','Lotame','idfa','aaid','Idify','Conversant','ZeoTap']) as bidder_array
              )
            CROSS JOIN UNNEST(MAP_KEYS(bidder_array)) AS r (pub_or_app_id)
            GROUP BY 1,2
             )
      SELECT
        bidder_sync_names.name  AS "bidder_sync_names.name",
        unique_pairs_by_cookie_domain.bucket AS "unique_pairs_by_cookie_domain.bucket",
        COALESCE(SUM(unique_pairs_by_cookie_domain.hiaccprobabilistic_count ), 0) AS "unique_pairs_by_cookie_domain.hiaccprobabilistic"
      FROM unique_pairs_by_cookie_domain
      LEFT JOIN bidder_sync_names ON unique_pairs_by_cookie_domain.cookiedomain = bidder_sync_names.pub_or_app_id
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

  dimension: unique_pairs_by_cookie_domain_bucket {
    type: number
    sql: ${TABLE}."unique_pairs_by_cookie_domain.bucket" ;;
  }

  measure: unique_pairs_by_cookie_domain_hiaccprobabilistic {
    type: sum
    sql: ${TABLE}."unique_pairs_by_cookie_domain.hiaccprobabilistic" ;;
  }

  set: detail {
    fields: [bidder_sync_names_name, unique_pairs_by_cookie_domain_bucket, unique_pairs_by_cookie_domain_hiaccprobabilistic]
  }
}
