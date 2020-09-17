view: domain_properties_production {
  sql_table_name: dynamodb.dynamodb.domain_properties_production ;;
  suggestions: no

  dimension: cname {
    type: string
    sql: ${TABLE}.cname ;;
  }

  dimension: domainname {
    type: string
    sql: ${TABLE}.domainname ;;
  }

  dimension: hasbaker {
    type: yesno
    sql: ${TABLE}.hasbaker ;;
  }

  dimension: hasssl {
    type: yesno
    sql: ${TABLE}.hasssl ;;
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
