- dashboard: sellable_prototype_je
  title: sellable_prototype_je
  layout: newspaper
  elements:
  - title: Region
    name: Region
    model: graph_performance_athena_cph
    explore: region_counts
    type: looker_pie
    fields: [region_counts.total, region_counts.region]
    sorts: [region_counts.total desc]
    limit: 500
    query_timezone: America/New_York
    value_labels: labels
    label_type: labPer
    color_application:
      collection_id: bb987651-29d6-4745-b82d-fd5d23a86faa
      palette_id: 8c90fc6c-152e-4ffc-b9bc-84f544aef61e
      options:
        steps: 5
    series_colors: {}
    series_labels:
      us: US
      nonus: NONUS
    series_types: {}
    listen: {}
    row: 6
    col: 0
    width: 6
    height: 8
  - title: Cluster Size
    name: Cluster Size
    model: graph_performance_athena_cph
    explore: cookie_hash_ranks
    type: looker_pie
    fields: [cookie_hash_ranks.total, cookie_hash_ranks.cookiehashrank]
    sorts: [cookie_hash_ranks.total desc]
    limit: 500
    query_timezone: America/New_York
    value_labels: labels
    label_type: labPer
    color_application:
      collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
      palette_id: 629b455f-662e-4854-a424-4f0c9d4bbdfb
      options:
        steps: 5
    series_colors: {}
    series_types: {}
    listen: {}
    row: 6
    col: 10
    width: 6
    height: 8
  - title: Deterministic by Cookie Domain (US)
    name: Deterministic by Cookie Domain (US)
    model: graph_performance_athena_cph
    explore: deterministic_cookies
    type: looker_line
    fields: [deterministic_cookies.dummy_three, deterministic_cookies.bucket_1, deterministic_cookies.bucket_2,
      deterministic_cookies.bucket_3, deterministic_cookies.bucket_4, deterministic_cookies.bucket_5,
      deterministic_cookies.bucket_6, deterministic_cookies.bucket_7, deterministic_cookies.bucket_8,
      deterministic_cookies.bucket_9, deterministic_cookies.bucket_10, deterministic_cookies.cookiedomain]
    pivots: [deterministic_cookies.cookiedomain]
    fill_fields: [deterministic_cookies.dummy_three]
    filters:
      deterministic_cookies.cookiedomain: "-idfa,-191160,-aaid"
    sorts: [deterministic_cookies.cookiedomain 0, deterministic_cookies.bucket_10
        desc 0]
    limit: 500
    dynamic_fields: [{table_calculation: bucket_count_t, label: bucket_count_t, expression: "coalesce(\n\
          \  if(row()=1, ${deterministic_cookies.bucket_1}, null),\n  if(row()=2,\
          \ index(${deterministic_cookies.bucket_2},1),null),\n  if(row()=3, index(${deterministic_cookies.bucket_3},1),null),\n\
          \  if(row()=4, index(${deterministic_cookies.bucket_4},1),null),\n  if(row()=5,\
          \ index(${deterministic_cookies.bucket_5},1),null),\n  if(row()=6, index(${deterministic_cookies.bucket_6},1),null),\n\
          \  if(row()=7, index(${deterministic_cookies.bucket_7},1),null),\n  if(row()=8,\
          \ index(${deterministic_cookies.bucket_8},1),null),\n  if(row()=9, index(${deterministic_cookies.bucket_9},1),null),\n\
          \  if(row()=10, index(${deterministic_cookies.bucket_10},1),null),null)",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/New_York
    color_application:
      collection_id: bb987651-29d6-4745-b82d-fd5d23a86faa
      palette_id: 8c90fc6c-152e-4ffc-b9bc-84f544aef61e
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: bucket_count_t, id: 100905
              - bucket_count_t, name: '100905'}, {axisId: bucket_count_t, id: 127211
              - bucket_count_t, name: '127211'}, {axisId: bucket_count_t, id: 177716
              - bucket_count_t, name: '177716'}, {axisId: bucket_count_t, id: 185143
              - bucket_count_t, name: '185143'}, {axisId: bucket_count_t, id: 44489
              - bucket_count_t, name: '44489'}, {axisId: bucket_count_t, id: 5298
              - bucket_count_t, name: '5298'}, {axisId: bucket_count_t, id: 71340
              - bucket_count_t, name: '71340'}, {axisId: bucket_count_t, id: 7156
              - bucket_count_t, name: '7156'}, {axisId: bucket_count_t, id: 79701
              - bucket_count_t, name: '79701'}, {axisId: bucket_count_t, id: 82774
              - bucket_count_t, name: '82774'}, {axisId: bucket_count_t, id: 82775
              - bucket_count_t, name: '82775'}, {axisId: bucket_count_t, id: 88068
              - bucket_count_t, name: '88068'}, {axisId: bucket_count_t, id: 91218
              - bucket_count_t, name: '91218'}], showLabels: false, showValues: true,
        unpinAxis: true, tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Buckets
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: right
    series_types: {}
    point_style: none
    series_colors: {}
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    swap_axes: false
    show_null_points: true
    interpolation: linear
    hidden_fields: [deterministic_cookies.bucket_3, deterministic_cookies.bucket_2,
      deterministic_cookies.bucket_4, deterministic_cookies.bucket_5, deterministic_cookies.bucket_6,
      deterministic_cookies.bucket_7, deterministic_cookies.bucket_8, deterministic_cookies.bucket_9,
      deterministic_cookies.bucket_10, deterministic_cookies.bucket_1]
    listen: {}
    row: 23
    col: 0
    width: 10
    height: 12
  - title: Total by Cookie Domain (US)
    name: Total by Cookie Domain (US)
    model: graph_performance_athena_cph
    explore: total_by_cookie_domain
    type: looker_line
    fields: [total_by_cookie_domain.cookiedomain, total_by_cookie_domain.dummy_three,
      total_by_cookie_domain.bucket_1, total_by_cookie_domain.bucket_2, total_by_cookie_domain.bucket_3,
      total_by_cookie_domain.bucket_4, total_by_cookie_domain.bucket_5, total_by_cookie_domain.bucket_6]
    pivots: [total_by_cookie_domain.cookiedomain]
    fill_fields: [total_by_cookie_domain.dummy_three]
    filters:
      total_by_cookie_domain.cookiedomain: "-aaid,-idfa,-191160"
    sorts: [total_by_cookie_domain.cookiedomain 0, total_by_cookie_domain.bucket_1
        desc 0]
    limit: 500
    dynamic_fields: [{table_calculation: calculation_1, label: Calculation 1, expression: "coalesce(\n\
          \  if(row()=1, ${total_by_cookie_domain.bucket_1}, null),\n  if(row()=2,\
          \ index(${total_by_cookie_domain.bucket_2},1),null),\n  if(row()=3, index(${total_by_cookie_domain.bucket_3},1),null),\n\
          \  if(row()=4, index(${total_by_cookie_domain.bucket_4},1),null),\n  if(row()=5,\
          \ index(${total_by_cookie_domain.bucket_5},1),null),\n  if(row()=6, index(${total_by_cookie_domain.bucket_6},1),null),null)",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/New_York
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: calculation_1, id: 100905
              - calculation_1, name: '100905'}, {axisId: calculation_1, id: 127211
              - calculation_1, name: '127211'}, {axisId: calculation_1, id: 177716
              - calculation_1, name: '177716'}, {axisId: calculation_1, id: 185143
              - calculation_1, name: '185143'}, {axisId: calculation_1, id: 44489
              - calculation_1, name: '44489'}, {axisId: calculation_1, id: 5298 -
              calculation_1, name: '5298'}, {axisId: calculation_1, id: 71340 - calculation_1,
            name: '71340'}, {axisId: calculation_1, id: 7156 - calculation_1, name: '7156'},
          {axisId: calculation_1, id: 79701 - calculation_1, name: '79701'}, {axisId: calculation_1,
            id: 82774 - calculation_1, name: '82774'}, {axisId: calculation_1, id: 82775
              - calculation_1, name: '82775'}, {axisId: calculation_1, id: 88068 -
              calculation_1, name: '88068'}, {axisId: calculation_1, id: 91218 - calculation_1,
            name: '91218'}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Buckets
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    hide_legend: false
    legend_position: right
    series_types: {}
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    hidden_fields: [total_by_cookie_domain.bucket_1, total_by_cookie_domain.bucket_2,
      total_by_cookie_domain.bucket_3, total_by_cookie_domain.bucket_4, total_by_cookie_domain.bucket_5,
      total_by_cookie_domain.bucket_6]
    listen: {}
    row: 35
    col: 0
    width: 10
    height: 12
  - title: HiAccProbabilistic By Cookie Domain (US)
    name: HiAccProbabilistic By Cookie Domain (US)
    model: graph_performance_athena_cph
    explore: hiaccprobabilistic_by_cookie_domain
    type: looker_line
    fields: [hiaccprobabilistic_by_cookie_domain.dummy_three, hiaccprobabilistic_by_cookie_domain.bucket_1,
      hiaccprobabilistic_by_cookie_domain.bucket_2, hiaccprobabilistic_by_cookie_domain.bucket_3,
      hiaccprobabilistic_by_cookie_domain.bucket_4, hiaccprobabilistic_by_cookie_domain.bucket_5,
      hiaccprobabilistic_by_cookie_domain.bucket_6, hiaccprobabilistic_by_cookie_domain.bucket_7,
      hiaccprobabilistic_by_cookie_domain.bucket_8, hiaccprobabilistic_by_cookie_domain.bucket_9,
      hiaccprobabilistic_by_cookie_domain.bucket_10, hiaccprobabilistic_by_cookie_domain.bucket_11,
      hiaccprobabilistic_by_cookie_domain.bucket_12, hiaccprobabilistic_by_cookie_domain.bucket_13,
      hiaccprobabilistic_by_cookie_domain.bucket_14, hiaccprobabilistic_by_cookie_domain.bucket_15,
      hiaccprobabilistic_by_cookie_domain.bucket_16, hiaccprobabilistic_by_cookie_domain.bucket_17,
      hiaccprobabilistic_by_cookie_domain.bucket_18, hiaccprobabilistic_by_cookie_domain.bucket_19,
      hiaccprobabilistic_by_cookie_domain.cookiedomain]
    pivots: [hiaccprobabilistic_by_cookie_domain.cookiedomain]
    fill_fields: [hiaccprobabilistic_by_cookie_domain.dummy_three]
    filters:
      hiaccprobabilistic_by_cookie_domain.cookiedomain: "-aaid,-idfa,-191160"
    sorts: [hiaccprobabilistic_by_cookie_domain.bucket_1 desc 0, hiaccprobabilistic_by_cookie_domain.cookiedomain]
    limit: 500
    dynamic_fields: [{table_calculation: calculation_1, label: Calculation 1, expression: "coalesce(\n\
          \  if(row()=1, ${hiaccprobabilistic_by_cookie_domain.bucket_1}, null),\n\
          \  if(row()=2, index(${hiaccprobabilistic_by_cookie_domain.bucket_2},1),null),\n\
          \  if(row()=3, index(${hiaccprobabilistic_by_cookie_domain.bucket_3},1),null),\n\
          \  if(row()=4, index(${hiaccprobabilistic_by_cookie_domain.bucket_4},1),null),\n\
          \  if(row()=5, index(${hiaccprobabilistic_by_cookie_domain.bucket_5},1),null),\n\
          \  if(row()=6, index(${hiaccprobabilistic_by_cookie_domain.bucket_6},1),null),\n\
          \  if(row()=7, index(${hiaccprobabilistic_by_cookie_domain.bucket_7},1),null),\n\
          \  if(row()=8, index(${hiaccprobabilistic_by_cookie_domain.bucket_8},1),null),\n\
          \  if(row()=9, index(${hiaccprobabilistic_by_cookie_domain.bucket_9},1),null),\n\
          \  if(row()=10, index(${hiaccprobabilistic_by_cookie_domain.bucket_10},1),null),\n\
          \  if(row()=11, index(${hiaccprobabilistic_by_cookie_domain.bucket_11},1),null),\n\
          \  if(row()=12, index(${hiaccprobabilistic_by_cookie_domain.bucket_12},1),null),\n\
          \  if(row()=13, index(${hiaccprobabilistic_by_cookie_domain.bucket_13},1),null),\n\
          \  if(row()=14, index(${hiaccprobabilistic_by_cookie_domain.bucket_14},1),null),\n\
          \  if(row()=15, index(${hiaccprobabilistic_by_cookie_domain.bucket_15},1),null),\n\
          \  if(row()=16, index(${hiaccprobabilistic_by_cookie_domain.bucket_16},1),null),\n\
          \  if(row()=17, index(${hiaccprobabilistic_by_cookie_domain.bucket_17},1),null),\n\
          \  if(row()=18, index(${hiaccprobabilistic_by_cookie_domain.bucket_18},1),null),\n\
          \  if(row()=19, index(${hiaccprobabilistic_by_cookie_domain.bucket_19},1),null),null)\n\
          \n            ", value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number}]
    query_timezone: America/New_York
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: calculation_1, id: 100905
              - calculation_1, name: '100905'}, {axisId: calculation_1, id: 127211
              - calculation_1, name: '127211'}, {axisId: calculation_1, id: 177716
              - calculation_1, name: '177716'}, {axisId: calculation_1, id: 185143
              - calculation_1, name: '185143'}, {axisId: calculation_1, id: 44489
              - calculation_1, name: '44489'}, {axisId: calculation_1, id: 5298 -
              calculation_1, name: '5298'}, {axisId: calculation_1, id: 71340 - calculation_1,
            name: '71340'}, {axisId: calculation_1, id: 7156 - calculation_1, name: '7156'},
          {axisId: calculation_1, id: 79701 - calculation_1, name: '79701'}, {axisId: calculation_1,
            id: 82774 - calculation_1, name: '82774'}, {axisId: calculation_1, id: 82775
              - calculation_1, name: '82775'}, {axisId: calculation_1, id: 88068 -
              calculation_1, name: '88068'}, {axisId: calculation_1, id: 91218 - calculation_1,
            name: '91218'}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Buckets
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: right
    series_types: {}
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    hidden_fields: [hiaccprobabilistic_by_cookie_domain.bucket_1, hiaccprobabilistic_by_cookie_domain.bucket_2,
      hiaccprobabilistic_by_cookie_domain.bucket_3, hiaccprobabilistic_by_cookie_domain.bucket_4,
      hiaccprobabilistic_by_cookie_domain.bucket_5, hiaccprobabilistic_by_cookie_domain.bucket_6,
      hiaccprobabilistic_by_cookie_domain.bucket_7, hiaccprobabilistic_by_cookie_domain.bucket_8,
      hiaccprobabilistic_by_cookie_domain.bucket_9, hiaccprobabilistic_by_cookie_domain.bucket_10,
      hiaccprobabilistic_by_cookie_domain.bucket_11, hiaccprobabilistic_by_cookie_domain.bucket_12,
      hiaccprobabilistic_by_cookie_domain.bucket_13, hiaccprobabilistic_by_cookie_domain.bucket_14,
      hiaccprobabilistic_by_cookie_domain.bucket_15, hiaccprobabilistic_by_cookie_domain.bucket_16,
      hiaccprobabilistic_by_cookie_domain.bucket_17, hiaccprobabilistic_by_cookie_domain.bucket_18,
      hiaccprobabilistic_by_cookie_domain.bucket_19]
    listen: {}
    row: 35
    col: 10
    width: 9
    height: 12
  - title: Deterministic and Hiaccprobabilistic by Cookie Domain (US)
    name: Deterministic and Hiaccprobabilistic by Cookie Domain (US)
    model: graph_performance_athena_cph
    explore: deterministicandhiaccprobabilistic_by_cookie_domain
    type: looker_line
    fields: [deterministicandhiaccprobabilistic_by_cookie_domain.cookiedomain, deterministicandhiaccprobabilistic_by_cookie_domain.dummy_three,
      deterministicandhiaccprobabilistic_by_cookie_domain.bucket_1, deterministicandhiaccprobabilistic_by_cookie_domain.bucket_2,
      deterministicandhiaccprobabilistic_by_cookie_domain.bucket_3, deterministicandhiaccprobabilistic_by_cookie_domain.bucket_4,
      deterministicandhiaccprobabilistic_by_cookie_domain.bucket_5, deterministicandhiaccprobabilistic_by_cookie_domain.bucket_6,
      deterministicandhiaccprobabilistic_by_cookie_domain.bucket_7, deterministicandhiaccprobabilistic_by_cookie_domain.bucket_8,
      deterministicandhiaccprobabilistic_by_cookie_domain.bucket_9, deterministicandhiaccprobabilistic_by_cookie_domain.bucket_10,
      deterministicandhiaccprobabilistic_by_cookie_domain.bucket_11]
    pivots: [deterministicandhiaccprobabilistic_by_cookie_domain.cookiedomain]
    fill_fields: [deterministicandhiaccprobabilistic_by_cookie_domain.dummy_three]
    filters:
      deterministicandhiaccprobabilistic_by_cookie_domain.cookiedomain: "-idfa,-aaid,-191160"
    sorts: [deterministicandhiaccprobabilistic_by_cookie_domain.bucket_1 desc 0, deterministicandhiaccprobabilistic_by_cookie_domain.cookiedomain
        0]
    limit: 500
    dynamic_fields: [{table_calculation: calculation_1, label: Calculation 1, expression: "coalesce(\n\
          \  if(row()=1, ${deterministicandhiaccprobabilistic_by_cookie_domain.bucket_1},\
          \ null),\n  if(row()=2, index(${deterministicandhiaccprobabilistic_by_cookie_domain.bucket_2},1),null),\n\
          \  if(row()=3, index(${deterministicandhiaccprobabilistic_by_cookie_domain.bucket_3},1),null),\n\
          \  if(row()=4, index(${deterministicandhiaccprobabilistic_by_cookie_domain.bucket_4},1),null),\n\
          \  if(row()=5, index(${deterministicandhiaccprobabilistic_by_cookie_domain.bucket_5},1),null),\n\
          \  if(row()=6, index(${deterministicandhiaccprobabilistic_by_cookie_domain.bucket_6},1),null),\n\
          \  if(row()=7, index(${deterministicandhiaccprobabilistic_by_cookie_domain.bucket_7},1),null),\n\
          \  if(row()=8, index(${deterministicandhiaccprobabilistic_by_cookie_domain.bucket_8},1),null),\n\
          \  if(row()=9, index(${deterministicandhiaccprobabilistic_by_cookie_domain.bucket_9},1),null),\n\
          \  if(row()=10, index(${deterministicandhiaccprobabilistic_by_cookie_domain.bucket_10},1),null),null)\n\
          \n            ", value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number}]
    query_timezone: America/New_York
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: calculation_1, id: 100905
              - calculation_1, name: '100905'}, {axisId: calculation_1, id: 127211
              - calculation_1, name: '127211'}, {axisId: calculation_1, id: 177716
              - calculation_1, name: '177716'}, {axisId: calculation_1, id: 185143
              - calculation_1, name: '185143'}, {axisId: calculation_1, id: 44489
              - calculation_1, name: '44489'}, {axisId: calculation_1, id: 5298 -
              calculation_1, name: '5298'}, {axisId: calculation_1, id: 71340 - calculation_1,
            name: '71340'}, {axisId: calculation_1, id: 7156 - calculation_1, name: '7156'},
          {axisId: calculation_1, id: 79701 - calculation_1, name: '79701'}, {axisId: calculation_1,
            id: 82774 - calculation_1, name: '82774'}, {axisId: calculation_1, id: 82775
              - calculation_1, name: '82775'}, {axisId: calculation_1, id: 88068 -
              calculation_1, name: '88068'}, {axisId: calculation_1, id: 91218 - calculation_1,
            name: '91218'}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Buckets
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: right
    series_types: {}
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    hidden_fields: [deterministicandhiaccprobabilistic_by_cookie_domain.bucket_1,
      deterministicandhiaccprobabilistic_by_cookie_domain.bucket_2, deterministicandhiaccprobabilistic_by_cookie_domain.bucket_3,
      deterministicandhiaccprobabilistic_by_cookie_domain.bucket_4, deterministicandhiaccprobabilistic_by_cookie_domain.bucket_5,
      deterministicandhiaccprobabilistic_by_cookie_domain.bucket_6, deterministicandhiaccprobabilistic_by_cookie_domain.bucket_7,
      deterministicandhiaccprobabilistic_by_cookie_domain.bucket_8, deterministicandhiaccprobabilistic_by_cookie_domain.bucket_9,
      deterministicandhiaccprobabilistic_by_cookie_domain.bucket_10, deterministicandhiaccprobabilistic_by_cookie_domain.bucket_11]
    listen: {}
    row: 23
    col: 10
    width: 9
    height: 12
  - title: Feature 1 by Cookie Domain (US)
    name: Feature 1 by Cookie Domain (US)
    model: graph_performance_athena_cph
    explore: feature_1_by_cookie_domain
    type: looker_line
    fields: [feature_1_by_cookie_domain.dummy_three, feature_1_by_cookie_domain.bucket_1,
      feature_1_by_cookie_domain.bucket_2, feature_1_by_cookie_domain.bucket_3, feature_1_by_cookie_domain.bucket_4,
      feature_1_by_cookie_domain.bucket_5, feature_1_by_cookie_domain.bucket_6, feature_1_by_cookie_domain.bucket_7,
      feature_1_by_cookie_domain.bucket_8, feature_1_by_cookie_domain.bucket_9, feature_1_by_cookie_domain.bucket_10,
      feature_1_by_cookie_domain.bucket_11, feature_1_by_cookie_domain.bucket_12,
      feature_1_by_cookie_domain.bucket_13, feature_1_by_cookie_domain.bucket_14,
      feature_1_by_cookie_domain.bucket_15, feature_1_by_cookie_domain.bucket_16,
      feature_1_by_cookie_domain.bucket_17, feature_1_by_cookie_domain.bucket_18,
      feature_1_by_cookie_domain.bucket_19, feature_1_by_cookie_domain.bucket_20,
      feature_1_by_cookie_domain.bucket_21, feature_1_by_cookie_domain.bucket_22,
      feature_1_by_cookie_domain.bucket_23, feature_1_by_cookie_domain.bucket_24,
      feature_1_by_cookie_domain.bucket_25, feature_1_by_cookie_domain.bucket_26,
      feature_1_by_cookie_domain.bucket_27, feature_1_by_cookie_domain.bucket_28,
      feature_1_by_cookie_domain.cookiedomain]
    pivots: [feature_1_by_cookie_domain.cookiedomain]
    fill_fields: [feature_1_by_cookie_domain.dummy_three]
    filters:
      feature_1_by_cookie_domain.cookiedomain: "-iida,-aaid,-191160"
    sorts: [feature_1_by_cookie_domain.bucket_1 desc 0, feature_1_by_cookie_domain.cookiedomain]
    limit: 500
    dynamic_fields: [{table_calculation: calculation_1, label: Calculation 1, expression: "coalesce(\n\
          \  if(row()=1, ${feature_1_by_cookie_domain.bucket_1}, null),\n  if(row()=2,\
          \ index(${feature_1_by_cookie_domain.bucket_2},1),null),\n  if(row()=3,\
          \ index(${feature_1_by_cookie_domain.bucket_3},1),null),\n  if(row()=4,\
          \ index(${feature_1_by_cookie_domain.bucket_4},1),null),\n  if(row()=5,\
          \ index(${feature_1_by_cookie_domain.bucket_5},1),null),\n  if(row()=6,\
          \ index(${feature_1_by_cookie_domain.bucket_6},1),null),\n  if(row()=7,\
          \ index(${feature_1_by_cookie_domain.bucket_7},1),null),\n  if(row()=8,\
          \ index(${feature_1_by_cookie_domain.bucket_8},1),null),\n  if(row()=9,\
          \ index(${feature_1_by_cookie_domain.bucket_9},1),null),\n  if(row()=10,\
          \ index(${feature_1_by_cookie_domain.bucket_10},1),null),\n  if(row()=11,\
          \ index(${feature_1_by_cookie_domain.bucket_11},1),null),\n  if(row()=12,\
          \ index(${feature_1_by_cookie_domain.bucket_12},1),null),\n  if(row()=13,\
          \ index(${feature_1_by_cookie_domain.bucket_13},1),null),\n  if(row()=14,\
          \ index(${feature_1_by_cookie_domain.bucket_14},1),null),\n  if(row()=15,\
          \ index(${feature_1_by_cookie_domain.bucket_15},1),null),\n  if(row()=16,\
          \ index(${feature_1_by_cookie_domain.bucket_16},1),null),\n  if(row()=17,\
          \ index(${feature_1_by_cookie_domain.bucket_17},1),null),\n  if(row()=18,\
          \ index(${feature_1_by_cookie_domain.bucket_18},1),null),\n  if(row()=19,\
          \ index(${feature_1_by_cookie_domain.bucket_19},1),null),\n  if(row()=20,\
          \ index(${feature_1_by_cookie_domain.bucket_20},1),null),\n  if(row()=21,\
          \ index(${feature_1_by_cookie_domain.bucket_21},1),null),\n  if(row()=22,\
          \ index(${feature_1_by_cookie_domain.bucket_22},1),null),\n  if(row()=23,\
          \ index(${feature_1_by_cookie_domain.bucket_23},1),null),\n  if(row()=24,\
          \ index(${feature_1_by_cookie_domain.bucket_24},1),null),\n  if(row()=25,\
          \ index(${feature_1_by_cookie_domain.bucket_25},1),null),\n  if(row()=26,\
          \ index(${feature_1_by_cookie_domain.bucket_26},1),null),\n  if(row()=27,\
          \ index(${feature_1_by_cookie_domain.bucket_27},1),null),\n  if(row()=28,\
          \ index(${feature_1_by_cookie_domain.bucket_28},1),null),null)\n\n     \
          \       ", value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/New_York
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: calculation_1, id: 100905
              - calculation_1, name: '100905'}, {axisId: calculation_1, id: 127211
              - calculation_1, name: '127211'}, {axisId: calculation_1, id: 177716
              - calculation_1, name: '177716'}, {axisId: calculation_1, id: 185143
              - calculation_1, name: '185143'}, {axisId: calculation_1, id: 44489
              - calculation_1, name: '44489'}, {axisId: calculation_1, id: 5298 -
              calculation_1, name: '5298'}, {axisId: calculation_1, id: 71340 - calculation_1,
            name: '71340'}, {axisId: calculation_1, id: 7156 - calculation_1, name: '7156'},
          {axisId: calculation_1, id: 79701 - calculation_1, name: '79701'}, {axisId: calculation_1,
            id: 82774 - calculation_1, name: '82774'}, {axisId: calculation_1, id: 82775
              - calculation_1, name: '82775'}, {axisId: calculation_1, id: 88068 -
              calculation_1, name: '88068'}, {axisId: calculation_1, id: 91218 - calculation_1,
            name: '91218'}, {axisId: calculation_1, id: idfa - calculation_1, name: idfa}],
        showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Buckets
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: right
    series_types: {}
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    hidden_fields: [feature_1_by_cookie_domain.bucket_1, feature_1_by_cookie_domain.bucket_2,
      feature_1_by_cookie_domain.bucket_3, feature_1_by_cookie_domain.bucket_4, feature_1_by_cookie_domain.bucket_5,
      feature_1_by_cookie_domain.bucket_6, feature_1_by_cookie_domain.bucket_7, feature_1_by_cookie_domain.bucket_8,
      feature_1_by_cookie_domain.bucket_9, feature_1_by_cookie_domain.bucket_10, feature_1_by_cookie_domain.bucket_11,
      feature_1_by_cookie_domain.bucket_12, feature_1_by_cookie_domain.bucket_13,
      feature_1_by_cookie_domain.bucket_14, feature_1_by_cookie_domain.bucket_15,
      feature_1_by_cookie_domain.bucket_16, feature_1_by_cookie_domain.bucket_17,
      feature_1_by_cookie_domain.bucket_18, feature_1_by_cookie_domain.bucket_19,
      feature_1_by_cookie_domain.bucket_20, feature_1_by_cookie_domain.bucket_21,
      feature_1_by_cookie_domain.bucket_22, feature_1_by_cookie_domain.bucket_23,
      feature_1_by_cookie_domain.bucket_24, feature_1_by_cookie_domain.bucket_25,
      feature_1_by_cookie_domain.bucket_26, feature_1_by_cookie_domain.bucket_27,
      feature_1_by_cookie_domain.bucket_28]
    listen: {}
    row: 47
    col: 0
    width: 17
    height: 9
  - title: Feature 2 by Cookie Domain (US)
    name: Feature 2 by Cookie Domain (US)
    model: graph_performance_athena_cph
    explore: feature_2_by_cookie_domain
    type: looker_line
    fields: [feature_2_by_cookie_domain.cookiedomain, feature_2_by_cookie_domain.dummy_three,
      feature_2_by_cookie_domain.bucket_1, feature_2_by_cookie_domain.bucket_2, feature_2_by_cookie_domain.bucket_3,
      feature_2_by_cookie_domain.bucket_4, feature_2_by_cookie_domain.bucket_5, feature_2_by_cookie_domain.bucket_6,
      feature_2_by_cookie_domain.bucket_7, feature_2_by_cookie_domain.bucket_8, feature_2_by_cookie_domain.bucket_9,
      feature_2_by_cookie_domain.bucket_10]
    pivots: [feature_2_by_cookie_domain.cookiedomain]
    fill_fields: [feature_2_by_cookie_domain.dummy_three]
    filters:
      feature_2_by_cookie_domain.cookiedomain: "-idfa,-191160,-aaid"
    sorts: [feature_2_by_cookie_domain.bucket_1 desc 0, feature_2_by_cookie_domain.cookiedomain]
    limit: 500
    dynamic_fields: [{table_calculation: calculation_1, label: Calculation 1, expression: "coalesce(\n\
          \  if(row()=1, ${feature_2_by_cookie_domain.bucket_1}, null),\n  if(row()=2,\
          \ index(${feature_2_by_cookie_domain.bucket_2},1),null),\n  if(row()=3,\
          \ index(${feature_2_by_cookie_domain.bucket_3},1),null),\n  if(row()=4,\
          \ index(${feature_2_by_cookie_domain.bucket_4},1),null),\n  if(row()=5,\
          \ index(${feature_2_by_cookie_domain.bucket_5},1),null),\n  if(row()=6,\
          \ index(${feature_2_by_cookie_domain.bucket_6},1),null),\n  if(row()=7,\
          \ index(${feature_2_by_cookie_domain.bucket_7},1),null),\n  if(row()=8,\
          \ index(${feature_2_by_cookie_domain.bucket_8},1),null),\n  if(row()=9,\
          \ index(${feature_2_by_cookie_domain.bucket_9},1),null),\n  if(row()=10,\
          \ index(${feature_2_by_cookie_domain.bucket_10},1),null),null)\n\n     \
          \       ", value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/New_York
    color_application:
      collection_id: bb987651-29d6-4745-b82d-fd5d23a86faa
      palette_id: 8c90fc6c-152e-4ffc-b9bc-84f544aef61e
      options:
        steps: 5
        reverse: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: calculation_1, id: 100905
              - calculation_1, name: '100905'}, {axisId: calculation_1, id: 127211
              - calculation_1, name: '127211'}, {axisId: calculation_1, id: 177716
              - calculation_1, name: '177716'}, {axisId: calculation_1, id: 185143
              - calculation_1, name: '185143'}, {axisId: calculation_1, id: 44489
              - calculation_1, name: '44489'}, {axisId: calculation_1, id: 5298 -
              calculation_1, name: '5298'}, {axisId: calculation_1, id: 71340 - calculation_1,
            name: '71340'}, {axisId: calculation_1, id: 7156 - calculation_1, name: '7156'},
          {axisId: calculation_1, id: 79701 - calculation_1, name: '79701'}, {axisId: calculation_1,
            id: 82774 - calculation_1, name: '82774'}, {axisId: calculation_1, id: 82775
              - calculation_1, name: '82775'}, {axisId: calculation_1, id: 88068 -
              calculation_1, name: '88068'}, {axisId: calculation_1, id: 91218 - calculation_1,
            name: '91218'}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Buckets
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: right
    series_types: {}
    point_style: none
    series_colors: {}
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    hidden_fields: [feature_2_by_cookie_domain.bucket_1, feature_2_by_cookie_domain.bucket_2,
      feature_2_by_cookie_domain.bucket_3, feature_2_by_cookie_domain.bucket_4, feature_2_by_cookie_domain.bucket_5,
      feature_2_by_cookie_domain.bucket_6, feature_2_by_cookie_domain.bucket_7, feature_2_by_cookie_domain.bucket_8,
      feature_2_by_cookie_domain.bucket_9, feature_2_by_cookie_domain.bucket_10]
    listen: {}
    row: 56
    col: 0
    width: 17
    height: 8
  - title: Feature 3 by Cookie Domain (US)
    name: Feature 3 by Cookie Domain (US)
    model: graph_performance_athena_cph
    explore: feature_3_by_cookie_domain
    type: looker_line
    fields: [feature_3_by_cookie_domain.cookiedomain, feature_3_by_cookie_domain.dummy_three,
      feature_3_by_cookie_domain.bucket_1, feature_3_by_cookie_domain.bucket_2, feature_3_by_cookie_domain.bucket_3,
      feature_3_by_cookie_domain.bucket_4, feature_3_by_cookie_domain.bucket_5, feature_3_by_cookie_domain.bucket_6,
      feature_3_by_cookie_domain.bucket_7]
    pivots: [feature_3_by_cookie_domain.cookiedomain]
    fill_fields: [feature_3_by_cookie_domain.dummy_three]
    filters:
      feature_3_by_cookie_domain.cookiedomain: "-aaid,-idfa,-191160"
    sorts: [feature_3_by_cookie_domain.bucket_1 desc 0, feature_3_by_cookie_domain.cookiedomain]
    limit: 500
    dynamic_fields: [{table_calculation: calculation_1, label: Calculation 1, expression: "coalesce(\n\
          \  if(row()=1, ${feature_3_by_cookie_domain.bucket_1}, null),\n  if(row()=2,\
          \ index(${feature_3_by_cookie_domain.bucket_2},1),null),\n  if(row()=3,\
          \ index(${feature_3_by_cookie_domain.bucket_3},1),null),\n  if(row()=4,\
          \ index(${feature_3_by_cookie_domain.bucket_4},1),null),\n  if(row()=5,\
          \ index(${feature_3_by_cookie_domain.bucket_5},1),null),\n  if(row()=6,\
          \ index(${feature_3_by_cookie_domain.bucket_6},1),null),\n  if(row()=7,\
          \ index(${feature_3_by_cookie_domain.bucket_7},1),null),null)\n\n      \
          \      ", value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/New_York
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: calculation_1, id: 100905
              - calculation_1, name: '100905'}, {axisId: calculation_1, id: 127211
              - calculation_1, name: '127211'}, {axisId: calculation_1, id: 177716
              - calculation_1, name: '177716'}, {axisId: calculation_1, id: 185143
              - calculation_1, name: '185143'}, {axisId: calculation_1, id: 44489
              - calculation_1, name: '44489'}, {axisId: calculation_1, id: 5298 -
              calculation_1, name: '5298'}, {axisId: calculation_1, id: 71340 - calculation_1,
            name: '71340'}, {axisId: calculation_1, id: 7156 - calculation_1, name: '7156'},
          {axisId: calculation_1, id: 79701 - calculation_1, name: '79701'}, {axisId: calculation_1,
            id: 82774 - calculation_1, name: '82774'}, {axisId: calculation_1, id: 82775
              - calculation_1, name: '82775'}, {axisId: calculation_1, id: 88068 -
              calculation_1, name: '88068'}, {axisId: calculation_1, id: 91218 - calculation_1,
            name: '91218'}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Buckets
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: right
    series_types: {}
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    hidden_fields: [feature_3_by_cookie_domain.bucket_1, feature_3_by_cookie_domain.bucket_2,
      feature_3_by_cookie_domain.bucket_3, feature_3_by_cookie_domain.bucket_4, feature_3_by_cookie_domain.bucket_5,
      feature_3_by_cookie_domain.bucket_6, feature_3_by_cookie_domain.bucket_7]
    listen: {}
    row: 64
    col: 0
    width: 17
    height: 9
  - title: Algorithm Classification
    name: Algorithm Classification
    model: graph_performance_athena_cph
    explore: algorithm_classification_sellable
    type: looker_waterfall
    fields: [algorithm_classification_sellable.algorithmclassification, algorithm_classification_sellable.total]
    sorts: [algorithm_classification_sellable.algorithmclassification]
    limit: 500
    query_timezone: America/New_York
    color_application:
      collection_id: bb987651-29d6-4745-b82d-fd5d23a86faa
      palette_id: 8c90fc6c-152e-4ffc-b9bc-84f544aef61e
      options:
        steps: 5
    up_color: "#FFA710"
    down_color: "#2766FF"
    total_color: "#FA4044"
    show_value_labels: true
    label_color: [black]
    show_x_axis_ticks: true
    show_x_axis_label: true
    x_axis_scale: auto
    show_y_axis_labels: false
    show_y_axis_ticks: true
    y_axis_gridlines: true
    series_types: {}
    listen: {}
    row: 73
    col: 0
    width: 17
    height: 14
  - title: Auto Sellable
    name: Auto Sellable
    model: graph_performance_athena_cph
    explore: sellable_unique_pairs
    type: single_value
    fields: [sellable_unique_pairs.total]
    limit: 500
    query_timezone: America/New_York
    custom_color_enabled: true
    custom_color: "#000000"
    show_single_value_title: true
    single_value_title: Auto Sellable - No. Unique Pairs
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#FFA710",
        font_color: !!null '', color_application: {collection_id: bb987651-29d6-4745-b82d-fd5d23a86faa,
          palette_id: 5de56edf-5254-4b03-992f-25291f97f48e}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen: {}
    row: 0
    col: 0
    width: 8
    height: 6
  - title: No. Unique Pairs by Cookie Domain
    name: No. Unique Pairs by Cookie Domain
    model: graph_performance_athena_cph
    explore: unique_pairs_by_cookie_domain
    type: table
    fields: [unique_pairs_by_cookie_domain.total, unique_pairs_by_cookie_domain.cookiedomain]
    sorts: [unique_pairs_by_cookie_domain.total desc]
    limit: 500
    query_timezone: America/New_York
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    series_labels:
      unique_pairs_by_cookie_domain.cookiedomain: Cookie Domain
      unique_pairs_by_cookie_domain.total: Unique Pairs Count
    table_theme: white
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    enable_conditional_formatting: false
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#FFA710",
        font_color: !!null '', color_application: {collection_id: bb987651-29d6-4745-b82d-fd5d23a86faa,
          palette_id: 5de56edf-5254-4b03-992f-25291f97f48e}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    series_types: {}
    point_style: none
    show_value_labels: false
    label_density: 25
    label_color: [black]
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    up_color: "#FFA710"
    down_color: "#2766FF"
    total_color: "#FA4044"
    listen: {}
    row: 14
    col: 0
    width: 6
    height: 9
  - title: New Tile
    name: New Tile
    model: graph_performance_athena_cph
    explore: sellable_unique_piiidentifier
    type: single_value
    fields: [sellable_unique_piiidentifier.total]
    limit: 500
    query_timezone: America/New_York
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Auto Sellable - No. Unique 3rd Party Identifiers
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen: {}
    row: 0
    col: 8
    width: 8
    height: 6
  - title: No. Unique 3rd Party Identifiers by Cookie Domain
    name: No. Unique 3rd Party Identifiers by Cookie Domain
    model: graph_performance_athena_cph
    explore: unique_piiidentifier_by_cookie_domain
    type: table
    fields: [unique_piiidentifier_by_cookie_domain.total, unique_piiidentifier_by_cookie_domain.cookiedomain]
    sorts: [unique_piiidentifier_by_cookie_domain.total desc]
    limit: 500
    query_timezone: America/New_York
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    series_labels:
      unique_piiidentifier_by_cookie_domain.cookiedomain: Cookie Domain
      unique_piiidentifier_by_cookie_domain.total: Unique Hem Count
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    listen: {}
    row: 14
    col: 6
    width: 7
    height: 9
  - title: New Tile
    name: New Tile
    model: graph_performance_athena_cph
    explore: unique_hems_sellable
    type: single_value
    fields: [unique_hems_sellable.total]
    limit: 500
    query_timezone: America/New_York
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Auto Sellable - No. Unique Hems
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen: {}
    row: 0
    col: 16
    width: 8
    height: 6
  - title: No. Unique Hems by Cookie Domain
    name: No. Unique Hems by Cookie Domain
    model: graph_performance_athena_cph
    explore: unique_hems_by_cookie_domain
    type: table
    fields: [unique_hems_by_cookie_domain.total, unique_hems_by_cookie_domain.cookiedomain]
    sorts: [unique_hems_by_cookie_domain.total desc]
    limit: 500
    query_timezone: America/New_York
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    listen: {}
    row: 14
    col: 13
    width: 6
    height: 9
