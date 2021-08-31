connection: "athena_copenhagen"

include: "*.view.lkml"                # include all views in the views/ folder in this project

label: "EMR Resource Usage"

explore: job_resource_usage {
  label: "LIMR Cluster Performance"
  description: "Resource usage of LIMR clusters and jobs"
  join: mapreduce_tasks {
    # do a from because I wanted to make "ID" hidden and suspect that will add more modifications in the future
    from: mapreduce_jr_usage
    relationship: one_to_many
    sql_on: ${job_resource_usage.join_id} = ${mapreduce_tasks.join_id};;
    type: left_outer
    view_label: "MapReduce Tasks"
    fields: [mapreduce_tasks.average_map_memory_usage,
      mapreduce_tasks.average_reduce_memory_usage,
      mapreduce_tasks.peak_map_memory_usage,
      mapreduce_tasks.peak_reduce_memory_usage,
      mapreduce_tasks.total_all_memory_usage,
      mapreduce_tasks.total_map_memory_usage,
      mapreduce_tasks.total_reduce_memory_usage,
      mapreduce_tasks.total_all_cpu_usage,
      mapreduce_tasks.total_map_cpu_usage,
      mapreduce_tasks.total_reduce_cpu_usage,
      mapreduce_tasks.tasks,
      mapreduce_tasks.is_map,
      mapreduce_tasks.is_reduce,
      mapreduce_tasks.id]
  }

  join: spark_tasks_jr_usage {
    relationship: one_to_many
    sql_on: ${job_resource_usage.cluster_group_date} = ${spark_tasks_jr_usage.cluster_date}
    and ${job_resource_usage.spark_join_id} = ${spark_tasks_jr_usage.app_id};;
    type: left_outer
    view_label: "Spark Tasks"
    fields: [spark_tasks_jr_usage.average_executor_cpu_time,
      spark_tasks_jr_usage.peak_executor_cpu_time,
      spark_tasks_jr_usage.total_executor_cpu_time,
      spark_tasks_jr_usage.average_executor_memory,
      spark_tasks_jr_usage.peak_executor_memory,
      spark_tasks_jr_usage.total_executor_memory,
      spark_tasks_jr_usage.tasks]
  }
}

explore: mapreduce_tasks {
  description: "CPU and Memory Usage for MapReduce"
  label: "MapReduce Tasks"
}

explore: spark_tasks {
  description: "CPU and Memory Usage for Spark"
}

explore: limr_cluster_costs {
  label: "Limr Cluster Costs"
  description: "Financial breakdown of LIMR clusters and jobs"
}

explore: cluster_costs {
  label: "LIMR Cluster Costs"
  description: "Financial breakdown of LIMR clusters and jobs"
  view_label: "LIMR Cluster Costs"
    join: limr_cluster_costs_job_resources_bak {
      view_label: "LIMR Cluster Costs"
      relationship: many_to_one
      sql_on: ${cluster_costs.lcid} = ${limr_cluster_costs_job_resources_bak.limr_cluster} ;;
      type: left_outer
    }
  }
