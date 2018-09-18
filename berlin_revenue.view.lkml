view: berlin_revenue {
  derived_table: {
    sql: SELECT event_date, rev_type, SUM(gross_revenue) gross_revenue
      FROM (
        (  SELECT event_date, 'native' as rev_type, SUM(publisher_revenue) gross_revenue
          FROM taboola_agg.revenue_summary
          GROUP BY 1,2
          )
        UNION ALL
        (  SELECT event_date, 'native' as rev_type, SUM(publisher_revenue) gross_revenue
          FROM taboola_agg.revenue_summary_ron
          GROUP BY 1,2
        )
        UNION ALL
        (  SELECT a.event_date,'native' as rev_type, SUM(a.advertiser_spend) gross_revenue
          FROM uslicer_exact_fact_new_looker a
          JOIN v_line_item_dim_v4 b
          ON a.line_item_id = b.line_item_id
          WHERE b.advertiser_id = 496
          AND b.campaign_desc ILIKE '%native%'
          GROUP BY 1,2
        )
        UNION ALL
        (  SELECT event_date, 'dynamic_retargeting' as rev_type,
          SUM(usl.advertiser_spend) gross_revenue
          FROM public.uslicer_exact_fact_new_looker usl
          JOIN public.v_line_item_dim_v4 li
          ON usl.line_item_id = li.line_item_id
          JOIN public.lfx_zf_creatives cr
          ON usl.creative_id = cr.userver_id
          JOIN (SELECT advertiser_id FROM no_id.adv_liveconnect_tags GROUP BY 1) ltag
          ON usl.advertiser_id = ltag.advertiser_id
          LEFT JOIN (
            SELECT str.userver_id
            FROM lfx_zf_strategies str
            JOIN lfx_zf_strategy_segments_include stj
            ON str.id = stj.strategy_id
            JOIN lfx_zf_segments seg
            ON stj.segment_id = seg.id
            WHERE seg.name ILIKE '%page visitor%'
            OR seg.name ILIKE '%known clickers%'
            OR seg.name ILIKE '%product retargeting%'
            GROUP BY 1
            ) seg
          ON usl.line_item_id = seg.userver_id
          WHERE usl.demand_type = 'default'
          AND (seg.userver_id IS NOT NULL OR cr.image_url ILIKE 'https://b-dcr-production.liadm.com/%')
          GROUP BY 1,2
        )
      )
      WHERE event_date BETWEEN DATE_TRUNC('month',CURRENT_DATE - 180) AND CURRENT_DATE - 1
      GROUP BY 1,2
       ;;
  datagroup_trigger: berlin_revenue_aggregates_updated
  distribution_style: all
  }

  dimension_group: event {
    datatype: date
    type: time
    timeframes: [date,day_of_week,week,month,day_of_month,quarter]
    sql: ${TABLE}.event_date ;;
  }

  dimension: revenue_type {
    type: string
    sql: ${TABLE}.rev_type ;;
  }

  measure: gross_revenue {
    type: sum
    sql: ${TABLE}.gross_revenue ;;
    value_format_name: usd
  }
}
