connection: "athena_berlin"

include: "*.view.lkml"

explore: metadata_aggregate {
  label: "Header Metadata"
}
