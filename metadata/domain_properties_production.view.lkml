view: domain_properties_production {
  #sql_table_name: dynamodb.dynamodb.domain_properties_production ;;
  sql_table_name: test.tmp_domain_properties ;;
  suggestions: no

  dimension: cname {
    type: string
    sql: ${TABLE}.cname ;;
  }

  dimension: domainname {
    type: string
   # sql: ${TABLE}.domainname ;;
    sql: ${TABLE}.apex_domain ;;
  }

  dimension: hasbaker {
    type: yesno
    sql: ${TABLE}.hasbaker ;;
  }

  dimension: hasssl {
    type: yesno
  #  sql: ${TABLE}.hasssl ;;
    sql: ${TABLE}.has_ssl ;;
  }

  dimension: productionversion {
    type: number
    sql: ${TABLE}.productionversion ;;
  }

  dimension: propertyid {
    type: string
    sql: ${TABLE}.propertyid ;;
  }

  measure: count {
    type: count
    drill_fields: [domainname, cname]
  }
}
