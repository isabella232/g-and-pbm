view: total_liids_and_pairs_by_sellable_geo {
  derived_table: {
    sql: SELECT _TABLE_SUFFIX event_date, hashIsSellable, nonUSHash, COUNT(DISTINCT `hash`) hashes, COUNT(*) pairs
      FROM `auto_dmps.all_features_mapping_pair__*` a
      WHERE _TABLE_SUFFIX = (SELECT MAX(_TABLE_SUFFIX) FROM `auto_dmps.all_features_mapping_pair__*`)
      GROUP BY 1,2,3
       ;;
   datagroup_trigger: new_features_mapping_pair
  }

  dimension: event_date {
    type: date
    sql: PARSE_DATE('%Y%m%d',${TABLE}.event_date) ;;
  }

  dimension: hash_sellable {
   type: yesno
    sql: ${TABLE}.hashIsSellable ;;
  }

  dimension: hash_us_based {
    type: yesno
    sql: NOT(${TABLE}.nonUSHash) ;;
    label: "Hash USA Based"
  }

  measure: sum_hashes {
    type: sum
    sql: ${TABLE}.hashes ;;
  }

  measure: sum_pairs {
    type: sum
    sql: ${TABLE}.pairs ;;
  }

}
