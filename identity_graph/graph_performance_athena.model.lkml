connection: "ny_athena"
label: "Identity Graph"

include: "archived_identity_graph/*.view.lkml"
include: "athena_ny/*.view.lkml"

explore: watermarking {
group_label: "Graph Quality"
description: "Performance Results of Mapping Selectors Groups"
}

explore: pv_owned_v_prospect {
# Hidden because it appears to be defunct
  hidden: yes
}

explore: mapping_type_cost_coefficient {
  hidden: yes
}
