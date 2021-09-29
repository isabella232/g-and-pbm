- dashboard: third_party_cookie_syncs_copy
  title: Third Party Cookie Syncs (copy)
  layout: newspaper
  elements:
  - title: Third Party Cookie Syncs by Identifier Type
    name: Third Party Cookie Syncs by Identifier Type
    model: graph_performance_athena_cph
    explore: third_party_cookie_syncs
    type: looker_line
    fields: [third_party_cookie_syncs.event_date_date, third_party_cookie_syncs.identifier_type,
      third_party_cookie_syncs.third_party_cookie_syncs, bidder_sync_names.name]
    pivots: [third_party_cookie_syncs.identifier_type, bidder_sync_names.name]
    filters:
      third_party_cookie_syncs.third_party_cookie_syncs: ">=50000"
    sorts: [third_party_cookie_syncs.event_date_date desc, third_party_cookie_syncs.identifier_type]
    limit: 500
    query_timezone: America/New_York
    trellis: ''
    stacking: ''
    color_application:
      collection_id: 7c79334a-9912-4ca1-be6a-35756782ae09
      palette_id: 3f395a8d-960f-4480-a725-63521163b8b8
      options:
        steps: 5
    show_value_labels: false
    label_density: 25
    legend_position: left
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: circle
    series_colors: {}
    limit_displayed_rows: false
    hidden_series: []
    y_axes: [{label: '', orientation: left, series: [{id: 106904 - third_party_cookie_syncs.third_party_cookie_syncs,
            name: '106904', axisId: third_party_cookie_syncs.third_party_cookie_syncs},
          {id: 117708 - third_party_cookie_syncs.third_party_cookie_syncs, name: '117708',
            axisId: third_party_cookie_syncs.third_party_cookie_syncs}, {id: 127211
              - third_party_cookie_syncs.third_party_cookie_syncs, name: '127211',
            axisId: third_party_cookie_syncs.third_party_cookie_syncs}, {id: 170004
              - third_party_cookie_syncs.third_party_cookie_syncs, name: '170004',
            axisId: third_party_cookie_syncs.third_party_cookie_syncs}, {id: 177716
              - third_party_cookie_syncs.third_party_cookie_syncs, name: '177716',
            axisId: third_party_cookie_syncs.third_party_cookie_syncs}, {id: 1944
              - third_party_cookie_syncs.third_party_cookie_syncs, name: '1944', axisId: third_party_cookie_syncs.third_party_cookie_syncs},
          {id: 2380 - third_party_cookie_syncs.third_party_cookie_syncs, name: '2380',
            axisId: third_party_cookie_syncs.third_party_cookie_syncs}, {id: 44489
              - third_party_cookie_syncs.third_party_cookie_syncs, name: '44489',
            axisId: third_party_cookie_syncs.third_party_cookie_syncs}, {id: 5298
              - third_party_cookie_syncs.third_party_cookie_syncs, name: '5298', axisId: third_party_cookie_syncs.third_party_cookie_syncs},
          {id: 71340 - third_party_cookie_syncs.third_party_cookie_syncs, name: '71340',
            axisId: third_party_cookie_syncs.third_party_cookie_syncs}, {id: 7156
              - third_party_cookie_syncs.third_party_cookie_syncs, name: '7156', axisId: third_party_cookie_syncs.third_party_cookie_syncs},
          {id: 79701 - third_party_cookie_syncs.third_party_cookie_syncs, name: '79701',
            axisId: third_party_cookie_syncs.third_party_cookie_syncs}, {id: 88068
              - third_party_cookie_syncs.third_party_cookie_syncs, name: '88068',
            axisId: third_party_cookie_syncs.third_party_cookie_syncs}, {id: 91218
              - third_party_cookie_syncs.third_party_cookie_syncs, name: '91218',
            axisId: third_party_cookie_syncs.third_party_cookie_syncs}, {id: 98254
              - third_party_cookie_syncs.third_party_cookie_syncs, name: '98254',
            axisId: third_party_cookie_syncs.third_party_cookie_syncs}], showLabels: false,
        showValues: true, valueFormat: '0,,"M"', unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    show_null_points: true
    interpolation: monotone
    note_state: collapsed
    note_display: above
    note_text: Identifiers under 50k syncs per day are not displayed
    listen: {}
    row: 8
    col: 8
    width: 16
    height: 13
  - title: Average Third Party Syncs
    name: Average Third Party Syncs
    model: graph_performance_athena_cph
    explore: third_party_cookie_syncs
    type: looker_bar
    fields: [third_party_cookie_syncs.identifier_type, third_party_cookie_syncs.third_party_cookie_syncs_per_day,
      bidder_sync_names.name]
    pivots: [third_party_cookie_syncs.identifier_type, bidder_sync_names.name]
    filters:
      third_party_cookie_syncs.third_party_cookie_syncs_per_day: ">50000"
    sorts: [third_party_cookie_syncs.identifier_type]
    limit: 500
    query_timezone: America/New_York
    trellis: ''
    stacking: ''
    color_application:
      collection_id: 7c79334a-9912-4ca1-be6a-35756782ae09
      palette_id: 3f395a8d-960f-4480-a725-63521163b8b8
      options:
        steps: 5
    show_value_labels: false
    label_density: 25
    legend_position: left
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_colors: {}
    series_types: {}
    limit_displayed_rows: false
    hidden_series: []
    y_axes: [{label: '', orientation: bottom, series: [{id: 106904 - third_party_cookie_syncs.third_party_cookie_syncs_per_day,
            name: '106904', axisId: third_party_cookie_syncs.third_party_cookie_syncs_per_day},
          {id: 117708 - third_party_cookie_syncs.third_party_cookie_syncs_per_day,
            name: '117708', axisId: third_party_cookie_syncs.third_party_cookie_syncs_per_day},
          {id: 127211 - third_party_cookie_syncs.third_party_cookie_syncs_per_day,
            name: '127211', axisId: third_party_cookie_syncs.third_party_cookie_syncs_per_day},
          {id: 170004 - third_party_cookie_syncs.third_party_cookie_syncs_per_day,
            name: '170004', axisId: third_party_cookie_syncs.third_party_cookie_syncs_per_day},
          {id: 177716 - third_party_cookie_syncs.third_party_cookie_syncs_per_day,
            name: '177716', axisId: third_party_cookie_syncs.third_party_cookie_syncs_per_day},
          {id: 1944 - third_party_cookie_syncs.third_party_cookie_syncs_per_day, name: '1944',
            axisId: third_party_cookie_syncs.third_party_cookie_syncs_per_day}, {
            id: 2380 - third_party_cookie_syncs.third_party_cookie_syncs_per_day,
            name: '2380', axisId: third_party_cookie_syncs.third_party_cookie_syncs_per_day},
          {id: 44489 - third_party_cookie_syncs.third_party_cookie_syncs_per_day,
            name: '44489', axisId: third_party_cookie_syncs.third_party_cookie_syncs_per_day},
          {id: 5298 - third_party_cookie_syncs.third_party_cookie_syncs_per_day, name: '5298',
            axisId: third_party_cookie_syncs.third_party_cookie_syncs_per_day}, {
            id: 71340 - third_party_cookie_syncs.third_party_cookie_syncs_per_day,
            name: '71340', axisId: third_party_cookie_syncs.third_party_cookie_syncs_per_day},
          {id: 7156 - third_party_cookie_syncs.third_party_cookie_syncs_per_day, name: '7156',
            axisId: third_party_cookie_syncs.third_party_cookie_syncs_per_day}, {
            id: 79701 - third_party_cookie_syncs.third_party_cookie_syncs_per_day,
            name: '79701', axisId: third_party_cookie_syncs.third_party_cookie_syncs_per_day},
          {id: 88068 - third_party_cookie_syncs.third_party_cookie_syncs_per_day,
            name: '88068', axisId: third_party_cookie_syncs.third_party_cookie_syncs_per_day},
          {id: 91218 - third_party_cookie_syncs.third_party_cookie_syncs_per_day,
            name: '91218', axisId: third_party_cookie_syncs.third_party_cookie_syncs_per_day},
          {id: 98254 - third_party_cookie_syncs.third_party_cookie_syncs_per_day,
            name: '98254', axisId: third_party_cookie_syncs.third_party_cookie_syncs_per_day}],
        showLabels: false, showValues: true, valueFormat: '0,,"M"', unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    note_state: collapsed
    note_display: above
    note_text: Identifiers under 50k syncs per day are not displayed
    listen: {}
    row: 8
    col: 0
    width: 8
    height: 13
  - title: Syncs by Request Type
    name: Syncs by Request Type
    model: graph_performance_athena_cph
    explore: third_party_cookie_syncs
    type: looker_line
    fields: [third_party_cookie_syncs.request_type, third_party_cookie_syncs.event_date_date,
      third_party_cookie_syncs.third_party_cookie_syncs]
    pivots: [third_party_cookie_syncs.request_type]
    fill_fields: [third_party_cookie_syncs.event_date_date]
    sorts: [third_party_cookie_syncs.event_date_date desc, third_party_cookie_syncs.request_type]
    limit: 500
    query_timezone: America/New_York
    trellis: ''
    stacking: ''
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
      options:
        steps: 5
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: circle_outline
    series_colors: {}
    limit_displayed_rows: false
    y_axes: [{label: Syncs, orientation: left, series: [{id: liicsync - third_party_cookie_syncs.third_party_cookie_syncs,
            name: liicsync, axisId: third_party_cookie_syncs.third_party_cookie_syncs},
          {id: picsync - third_party_cookie_syncs.third_party_cookie_syncs, name: picsync,
            axisId: third_party_cookie_syncs.third_party_cookie_syncs}], showLabels: true,
        showValues: true, valueFormat: '0,,"M"', unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    show_null_points: true
    interpolation: monotone
    row: 0
    col: 8
    width: 16
    height: 8
  - title: Total Third Party Syncs
    name: Total Third Party Syncs
    model: graph_performance_athena_cph
    explore: third_party_cookie_syncs
    type: looker_column
    fields: [third_party_cookie_syncs.event_date_date, third_party_cookie_syncs.third_party_cookie_syncs]
    sorts: [third_party_cookie_syncs.event_date_date desc]
    limit: 500
    query_timezone: America/New_York
    trellis: ''
    stacking: ''
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 39798c77-0126-4f2f-a920-8d7ce381fa5a
      options:
        steps: 5
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: circle_outline
    series_colors: {}
    series_types: {}
    limit_displayed_rows: false
    y_axes: [{label: Syncs, orientation: left, series: [{id: third_party_cookie_syncs.third_party_cookie_syncs,
            name: Third Party Cookie Syncs Third Party Cookie Syncs, axisId: third_party_cookie_syncs.third_party_cookie_syncs}],
        showLabels: true, showValues: true, valueFormat: '0,,"M"', unpinAxis: false,
        tickDensity: default, type: linear}]
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    reference_lines: [{reference_type: line, range_start: mean, range_end: median,
        margin_top: deviation, margin_value: mean, margin_bottom: deviation, label_position: right,
        color: "#484C54", label: Average, line_value: mean}]
    trend_lines: []
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: monotone
    row: 0
    col: 0
    width: 8
    height: 8
