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

    html:

    {% if value == 'success' %}

    <p style="color: white; background-color: darkgreen; font-size:100%; text-align:center">{{ rendered_value }}</p>

    {% elsif value == 'running' %}

    <p style="color: black; background-color: lightgreen; font-size:100%; text-align:center">{{ rendered_value }}</p>

    {% elsif value == 'failed' %}

    <p style="color: black; background-color: red; font-size:100%; text-align:center">{{ rendered_value }}</p>

    {% elsif value == 'queued' %}

    <p style="color: black; background-color: lightbrown; font-size:100%; text-align:center">{{ rendered_value }}</p>


    {% elsif value == 'skipped' %}

    <p style="color: black; background-color: lightpink; font-size:100%; text-align:center">{{ rendered_value }}</p>

    {% elsif value == 'up_for_retry' %}
    <p style="color: black; background-color: yellow; font-size:100%; text-align:center">{{ rendered_value }}</p>

    {% elsif value == 'up_for_reschedule' %}
    <p style="color: black; background-color: turquoise; font-size:100%; text-align:center">{{ rendered_value }}</p>

    {% elsif value == 'upstream_failed' %}
    <p style="color: black; background-color: orange; font-size:100%; text-align:center">{{ rendered_value }}</p>

    {% elsif value == 'scheduled' %}
    <p style="color: black; background-color: lightblue; font-size:100%; text-align:center">{{ rendered_value }}</p>

    {% elsif value == 'no_status ' %}
    <p style="color: black; background-color: white; font-size:100%; text-align:center">{{ rendered_value }}</p>

    {% elsif value == 'removed  ' %}
    <p style="color: white; background-color: black; font-size:100%; text-align:center">{{ rendered_value }}</p>


    {% else %}

    <p style="color: white; background-color: darkblue; font-size:100%; text-align:center">{{ rendered_value }}</p>

    {% endif %}
    ;;
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
