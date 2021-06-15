view: etl_tracker_airflow {

  #sql_table_name: lambda:athenajdbcairflowprod.public.task_instance ;;

  derived_table: {
     sql: select * from "lambda:athenajdbcairflowprod".public.task_instance;;
  }



  dimension: task_id {
    type: string
    sql: ${TABLE}.task_id ;;
    label: "Task ID"
    description: "Task ID"
  }

  dimension: dag_id {
    type: string
    sql: ${TABLE}.dag_id ;;
    label: "Dag ID"
    description: "Dag ID"
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
    label: "State"
    description: "State"
  }

  dimension_group: execution_date {
    type: time
    label: "Execution Date"
    timeframes: [date, month, week, quarter, year]
    sql: ${TABLE}.execution_date ;;
    #sql: DATE_PARSE(${TABLE}.execution_date,'%Y%m%d') ;;
    description: "Date of report generation"
  }


}

# view: etl_tracker_airflow {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
