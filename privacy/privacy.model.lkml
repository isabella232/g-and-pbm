connection: "athena_copenhagen"

include: "/privacy/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/view.lkml"                   # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

explore: privacy_requests {
  description: "GDPR and CCPA requests made through LI's privacy API"
}
