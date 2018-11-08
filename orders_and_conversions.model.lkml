connection: "bigquery_log_data"

include: "*.view.lkml"                       # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

explore: pvc_view {
  always_filter: {
    filters: {
      field: conversion_date
      #value: ""
    }
    filters: {
      field: advertiser_id
    }
    filters: {
      field: campaign_id
    }
    filters: {
      field: line_item_id
    }
  }
  label: "PVC & PCC"

}
