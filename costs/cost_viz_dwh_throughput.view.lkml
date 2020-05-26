view: cost_viz_dwh_throughput {
  derived_table: {
    sql: WITH init AS (
      SELECT date_p, job_name_p, rundate,
        FILTER(ARRAY_AGG(DISTINCT CASE WHEN operationtype = 'READ' THEN sourcename END), x -> x IS NOT NULL) readOperations,
        FILTER(ARRAY_AGG(DISTINCT CASE WHEN operationtype = 'WRITE' THEN sourcename END), x -> x IS NOT NULL) writeOperations
      FROM "auto_metadata"."read_write_info"
      GROUP BY 1,2,3
      ),

      main AS (
      SELECT date_p, job_name_p, rundate, r.readOperation, w.writeOperation, readOperations, writeOperations
      FROM init
      CROSS JOIN UNNEST(CASE WHEN CARDINALITY(readOperations) = 0 THEN ARRAY['no read'] ELSE readOperations END) as r(readOperation)
      CROSS JOIN UNNEST(CASE WHEN CARDINALITY(writeOperations) = 0 THEN ARRAY['no write'] ELSE writeOperations END) as w(writeOperation)
      )

      SELECT a.date_p, a.rundate, COALESCE(c.job_name_p, 'Initial Read') readJob, a.job_name_p, COALESCE(b.job_name_p,'Final Write State') writeJob, COUNT(*) sources
      FROM main a
      LEFT JOIN main b
      ON a.writeoperation = b.readoperation
      AND a.job_name_p <> b.job_name_p
      AND a.date_p = b.date_p
      AND a.rundate = b.rundate
      LEFT JOIN main c
      ON a.readoperation = c.writeoperation
      AND a.job_name_p <> c.job_name_p
      AND a.date_p = c.date_p
      AND a.rundate = c.rundate
      GROUP BY 1,2,3,4,5
       ;;
  }

  suggestions: no

  dimension: partition_date {
    type: date
    sql: ${TABLE}.date_p ;;
  }

  dimension: run_date {
    type: date
    sql: ${TABLE}.rundate ;;
  }
  dimension: read_job {
    type: string
    sql: ${TABLE}.readJob ;;
  }

  dimension: job_name {
    type: string
    sql: ${TABLE}.job_name_p ;;
  }

  dimension: write_job {
    type: string
    sql: ${TABLE}.writeJob ;;
  }

  measure: ct_sources {
    type: sum
    sql: ${TABLE}.sources ;;
  }
}
