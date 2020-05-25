view: people_verified_counts {
  derived_table: {
    sql: with parsed as (
        SELECT
          date,
          publisherorappid publisher_app_id,
          if(lidid='',true,false) cci,
          lidid,
          fpc,
          url_extract_parameter('x?' || passbackvalue,'_li_pcgpv') pv,
          url_extract_parameter('x?' || passbackvalue,'_li_pcgcv') cv
        FROM idaas_publisher_passback_log
      ),

      split as (
        select *,
         case when cv='y' then lidid || fpc  end customer_verified,
         case when cci=true and cv='y' then lidid || fpc  end cci_customer_verified,
         case when pv='y' and cv!='y' then lidid || fpc end people_verified,
         case when cci=true and pv='y' and cv!='y' then lidid || fpc end cci_people_verified,
         case when pv!='y' and cv!='y' then lidid || fpc end not_verified,
         case when cci=true and pv!='y' and cv!='y' then lidid || fpc end cci_not_verified
        from parsed
      )

      select DATE_PARSE(date,'%Y%m%d') event_date, publisher_app_id,
        approx_distinct(customer_verified) customer_verified,
        approx_distinct(cci_customer_verified) cci_customer_verified,
        approx_distinct(people_verified) people_verified,
        approx_distinct(cci_people_verified) cci_people_verified,
        approx_distinct(not_verified) not_verified,
        approx_distinct(cci_not_verified) cci_not_verified
      FROM split
      group by 1,2
       ;;
  }

  suggestions: no

  dimension_group: event_date {
    type: time
    sql: ${TABLE}.event_date ;;
  }

  dimension: publisher_app_id {
    type: string
    sql: ${TABLE}.publisher_app_id ;;
  }

  measure: customer_verified {
    type: sum
    sql: ${TABLE}.customer_verified ;;
    value_format_name: decimal_0
  }

  measure: cci_customer_verified {
    type: sum
    sql: ${TABLE}.cci_customer_verified ;;
    value_format_name: decimal_0
  }

  measure: people_verified {
    type: sum
    sql: ${TABLE}.people_verified ;;
    value_format_name: decimal_0
  }

  measure: cci_people_verified {
    type: sum
    sql: ${TABLE}.cci_people_verified ;;
    value_format_name: decimal_0
  }

  measure: not_verified {
    type: sum
    sql: ${TABLE}.not_verified ;;
    value_format_name: decimal_0
  }

  measure: cci_not_verified {
    type: sum
    sql: ${TABLE}.cci_not_verified ;;
    value_format_name: decimal_0
  }

}
