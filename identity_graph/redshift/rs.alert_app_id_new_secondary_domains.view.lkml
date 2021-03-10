view: alert_app_id_new_secondary_domains {
  derived_table: {
    sql: SELECT nd.event_date, nd.app_id, nd.count_domains, ad.domains yesterday_domains, nd.domain_name new_domain, nd.page_views
      FROM
      (
        SELECT app_id,
        count_domains,
        domain_name,
        event_date,
        page_views,
        LAG(event_date) OVER (PARTITION BY app_id, domain_name ORDER BY event_date) previous_seen_date
        FROM dsa.app_ids_with_multiple_domains
        WHERE event_date BETWEEN CURRENT_DATE - 7 AND CURRENT_DATE - 1
        ) nd
      JOIN
      (
        SELECT app_id,
        LISTAGG(domain_name, ' | ') WITHIN GROUP (ORDER BY page_views) domains
        FROM dsa.app_ids_with_multiple_domains
        WHERE event_date = CURRENT_DATE - 1
        GROUP BY 1
      ) ad
      ON nd.app_id = ad.app_id
      WHERE nd.event_date = CURRENT_DATE - 1
      AND (nd.previous_seen_date = CURRENT_DATE - 7 OR nd.previous_seen_date IS NULL)
      ORDER BY app_id,page_views DESC
       ;;
  }

  dimension: event_date {
    type: date
    sql: ${TABLE}.event_date ;;
  }

  dimension: app_id {
    type: string
    sql: ${TABLE}.app_id ;;
  }

  dimension: total_domains {
    type: number
    sql: ${TABLE}.count_domains ;;
  }

  dimension: yesterday_domains {
    type: string
    sql: ${TABLE}.yesterday_domains ;;
  }

  dimension: new_domain {
    type: string
    sql: ${TABLE}.new_domain ;;
  }

  measure: page_views {
    type: sum
    sql: ${TABLE}.page_views ;;
  }

}
