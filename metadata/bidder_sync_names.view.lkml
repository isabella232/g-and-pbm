view: bidder_sync_names {
  derived_table: {
    sql:
      SELECT r.pub_or_app_id, bidder_array[r.pub_or_app_id] name
      FROM (
        SELECT
        MAP(ARRAY['220889','204543','227664','222480','224000','237139','242861','206120','178256','185143','191160','195755','200441','200445','199768','200442','183292','1118','44489','7156','71340','49001','2380','5298','24314','1944','26575','78877','88068','79701','91218','91219','98254','98251','82774','196348','117708','100905','106904','127211','idfa','aaid','170004','177716','182459','193691','196609','202595','203802','204100','204553','206088','212430','198659','198660','198663','200478','82775','muuid__www.allrecipes.com','muuid__www.eatthis.com','muuid__www.instyle.com','muuid__peopleenespanol.com','muuid__www.foodandwine.com','muuid__www.parents.com','muuid__www.departures.com','muuid__www.agriculture.com','muuid__www.southernliving.com','muuid__www.health.com','muuid__bestlifeonline.com','muuid__www.woodmagazine.com','muuid__www.bhg.com','muuid__www.midwestliving.com','muuid__www.marthastewart.com','muuid__www.eatingwell.com','muuid__hellogiggles.com','muuid__ew.com','muuid__www.myrecipes.com','muuid__people.com','muuid__www.shape.com','muuid__www.cookinglight.com','muuid__www.travelandleisure.com','muuid__www.realsimple.com'],
            ARRAY['Eyeota','ALC','Magnite','LinkedIn','AA-Navistone','Beeswax','Other Navistone','Sprint','Merkle','Walmart','PearsonEdu','PubMatic','ClickCertain','Zeotap','Throtle','ZetaGlobal','SmartyAds','LiveIntent DSP','The Trade Desk','MediaMath','Criteo S2S','Aolone','Centro','Bidswitch','Google DBM','Tapad','Pocketmath','Sociomantic','Taboola','Datalogix','AppNexus','DataXu','Zemanta','Pulsepoint','Bluekai','Adobe','Exelate','Neustar','Adara','Lotame','idfa','aaid','Idify','Conversant','ZeoTap','ShareThis','Pulsepoint','ALC','Consumable','MediaForce','Sovrn','OpenX','AdThorent','PearsonEdu','PearsonEdu','PearsonEdu','PearsonEdu','Adobe','muuid','muuid','muuid','muuid','muuid','muuid','muuid','muuid','muuid','muuid','muuid','muuid','muuid','muuid','muuid','muuid','muuid','muuid','muuid','muuid','muuid','muuid','muuid','muuid']) as bidder_array
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
    description: "Name associated with third-party ID"
  }
}
