view: bidder_sync_names {
  derived_table: {
    sql:
      SELECT r.pub_or_app_id, bidder_array[r.pub_or_app_id] name
      FROM (
        SELECT
        MAP(ARRAY['222480','224000','237139','242861','206120','178256','185143','191160','195755','200441','200445','199768','200442','183292','1118','44489','7156','71340','49001','2380','5298','24314','1944','26575','78877','88068','79701','91218','91219','98254','98251','82774','196348','117708','100905','106904','127211','idfa','aaid','170004','177716','182459','193691','196609','202595','203802','204100','204553','206088','212430','198659','198660','198663','200478','82775'],
            ARRAY['LinkedIn','AA-Navistone','Beeswax','Other Navistone','Sprint','Merkle','Walmart','PearsonEdu','PubMatic','ClickCertain','Zeotap','Throtle','ZetaGlobal','SmartyAds','LiveIntent DSP','The Trade Desk','MediaMath','Criteo S2S','Aolone','Centro','Bidswitch','Google DBM','Tapad','Pocketmath','Sociomantic','Taboola','Datalogix','AppNexus','DataXu','Zemanta','Pulsepoint','Bluekai','Adobe','Exelate','Neustar','Adara','Lotame','idfa','aaid','Idify','Conversant','ZeoTap','ShareThis','Pulsepoint','ALC','Consumable','MediaForce','Sovrn','OpenX','AdThorent','PearsonEdu','PearsonEdu','PearsonEdu','PearsonEdu','Adobe']) as bidder_array
        )
      CROSS JOIN UNNEST(MAP_KEYS(bidder_array)) AS r (pub_or_app_id)
      GROUP BY 1,2
       ;;
  }

  suggestions: no

  dimension: pub_or_app_id {
    type: string
    sql: ${TABLE}.pub_or_app_id ;;
    hidden: yes
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
    label: "Bidder Sync Name"
  }

}
view: bidder_names_with_sellable_partner_link {
  extends: [bidder_sync_names]

  dimension: name {
    link: {
      label: "Identity Partner Overview"
      url: "/dashboards-next/597?Partner+Domain+Name={{ value | url_encode }} "
    }
    label: "Cookie Domain Name"
  }
}
