view: watermarking {
  sql_table_name: auto_dmps.bidder_group_info ;;
  suggestions: no

  dimension: bids {
    type: string
    sql: ${TABLE}.bids ;;
    hidden: yes
  }

  dimension: browsers {
    type: string
    sql: ${TABLE}.browsers ;;
    hidden: yes
  }

  dimension: clearingprice {
    type: string
    sql: ${TABLE}.clearingprice ;;
    hidden: yes
  }

  dimension: clicks {
    type: string
    sql: ${TABLE}.clicks ;;
    hidden: yes
  }

  dimension: conversions {
    type: string
    sql: ${TABLE}.conversions ;;
    hidden: yes
  }

  dimension: experiment_date {
    type: date
    sql: DATE_PARSE(${TABLE}.date_p,'%Y%m%d') ;;
  }

  dimension: definition {
    type: string
    sql: ${TABLE}.definition ;;
    hidden: yes
  }

  dimension: devicetypes {
    type: string
    sql: ${TABLE}.devicetypes ;;
    hidden: yes
  }

  dimension: expectedprofit {
    type: string
    sql: ${TABLE}.expectedprofit ;;
    hidden: yes
  }

  dimension: idaasindices {
    type: string
    sql: ${TABLE}.idaasindices ;;
    hidden: yes
  }

  dimension: largebids {
    type: string
    sql: ${TABLE}.largebids ;;
    hidden: yes
  }

  dimension: nonzerobids {
    type: string
    sql: ${TABLE}.nonzerobids ;;
    hidden: yes
  }

  dimension: oss {
    type: string
    sql: ${TABLE}.oss ;;
    hidden: yes
  }

  dimension: pricingtypes {
    type: string
    sql: ${TABLE}.pricingtypes ;;
    hidden: yes
  }

  dimension: responses {
    type: string
    sql: ${TABLE}.responses ;;
    hidden: yes
  }

  dimension: rtbwins {
    type: string
    sql: ${TABLE}.rtbwins ;;
    hidden: yes
  }

  dimension: sources {
    type: string
    sql: ${TABLE}.sources ;;
    hidden: yes
  }

  dimension: spend {
    type: string
    sql: ${TABLE}.spend ;;
    hidden: yes
  }

  dimension: bidder_id {
    type: number
    sql: ${TABLE}.definition.bidderid ;;
    description: "RTB bidder ID"
    group_label: "Experiment Group Definition"
  }

  dimension: hash_prefix_group {
    type: string
    sql: ${TABLE}.definition.prefixgroup;;
    description: "Hash prefix that begins sample"
    group_label: "Experiment Group Definition"
  }

  dimension: selector_definition {
    type: string
    sql: ${TABLE}.definition.selectordefinition ;;
    description: "Cookie selection logic being applied to group"
    group_label: "Experiment Group Definition"
  }

  dimension: is_removed_during_day {
    type: yesno
    sql: ${TABLE}.definition.isremovedduringday ;;
    description: "Experiment removed during day"
    group_label: "Experiment Group Definition"
  }

  dimension: additional_stores_deployed_during_day {
    type: number
    sql: ${TABLE}.definition.additionalstoresdeployedduringday ;;
    description: "Number of additional stores deployed during the day"
    group_label: "Experiment Group Definition"
  }

  dimension: label {
    type: string
    sql: ${TABLE}.definition.label ;;
    group_label: "Experiment Group Definition"
    label: "Experiment Name"
    drill_fields: [bidder_id,selector_definition]
  }

  measure: mean_bids {
    type: average
    sql: ${TABLE}.bids.mean ;;
    group_label: "Bids"
  }

  measure: count_bids {
    type: sum
    sql: ${TABLE}.bids.count ;;
    group_label: "Bids"
  }

  measure: stddev_bids {
    type: average
    sql: ${TABLE}.bids.stddev ;;
    group_label: "Bids"
  }

  measure: mean_nonzero_bids {
    type: average
    sql: ${TABLE}.nonzerobids.mean ;;
    group_label: "Non-Zero Bids"
    label: "Mean Non-Zero Bids"
  }

  measure: count_nonzero_bids {
    type: sum
    sql: ${TABLE}.nonzerobids.count ;;
    group_label: "Non-Zero Bids"
    label: "Count Non-Zero Bids"
  }

  measure: stddev_nonzero_bids {
    type: average
    sql: ${TABLE}.nonzerobids.stddev ;;
    group_label: "Non-Zero Bids"
    label: "Stddev Non-Zero Bids"
  }

  measure: mean_bid_amount_ecpm {
    type: average
    sql: ${TABLE}.spend.mean * 1000 ;;
    group_label: "Bid Amount"
    value_format_name: usd
  }

  measure: count_bid_amount {
    type: sum
    sql: ${TABLE}.spend.count ;;
    group_label: "Bid Amount"
    hidden: yes
  }

  measure: stddev_bid_amount_ecpm {
    type: average
    sql: ${TABLE}.spend.stddev * 1000;;
    group_label: "Bid Amount"
    value_format_name: usd
  }

  measure: stddev_bid_amount_high {
    type: number
    sql: ${mean_bid_amount_ecpm} + ${stddev_bid_amount_ecpm} ;;
    value_format_name: usd
    group_label: "Bid Amount"
  }

  measure: stddev_bid_amount_low {
    type: number
    sql: GREATEST(${mean_bid_amount_ecpm} - ${stddev_bid_amount_ecpm},0) ;;
    value_format_name: usd
    group_label: "Bid Amount"
  }

  measure: mean_clearing_price_ecpm {
    type: average
    sql: ${TABLE}.clearingprice.mean * 1000;;
    group_label: "Clearing Price"
    value_format_name: usd
  }

  measure: count_clearing_price {
    type: sum
    sql: ${TABLE}.clearingprice.count ;;
    group_label: "Clearing Price"
    hidden: yes
  }

  measure: stddev_clearing_price_ecpm {
    type: average
    sql: ${TABLE}.clearingprice.stddev * 1000;;
    group_label: "Clearing Price"
  }

  measure: mean_rtb_wins {
    type: average
    sql: ${TABLE}.rtbwins.mean ;;
    group_label: "RTB Wins"
    label: "Mean RTB Wins"
  }

  measure: count_rtb_wins {
    type: sum
    sql: ${TABLE}.rtbwins.count ;;
    group_label: "RTB Wins"
    label: "Count RTB Wins"
  }

  measure: stddev_rtb_wins {
    type: average
    sql: ${TABLE}.rtbwins.stddev ;;
    group_label: "RTB Wins"
    label: "Stddev RTB Wins"
  }

  measure: count_clicks {
    type: sum
    sql: ${TABLE}.clicks.count ;;
    group_label: "Clicks"
  }

  measure: total_clicks {
    type: sum
    sql: ${TABLE}.clicks.total ;;
    group_label: "Clicks"
  }

  measure: win_rate {
    type: number
    sql: ${count_rtb_wins} / CAST(${count_nonzero_bids} AS REAL) ;;
    value_format_name: percent_1
  }

  measure: bid_submission_rate {
    type: number
    sql: ${count_nonzero_bids} / CAST(${count_bids} AS REAL) ;;
    value_format_name: percent_1
  }

  measure: start_date {
    type: date
    sql: MIN(DATE_PARSE(${TABLE}.date_p,'%Y%m%d')) ;;
  }

  measure: most_recent_date {
    type: date
    sql: MAX(DATE_PARSE(${TABLE}.date_p,'%Y%m%d')) ;;
  }

  measure: days_running {
    type: number
    sql: DATE_DIFF('day',MIN(DATE_PARSE(${TABLE}.date_p,'%Y%m%d')),MAX(DATE_PARSE(${TABLE}.date_p,'%Y%m%d'))) ;;
  }

  measure: current_strategy {
    type: yesno
    sql: MAX(DATE_PARSE(${TABLE}.date_p,'%Y%m%d')) >= CURRENT_DATE - INTERVAL '3' DAY ;;
  }
}
