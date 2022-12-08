project_name: "wnba_hackathon"

# # Use local_dependency: To enable referencing of another project
# # on this instance with include: statements
#
# local_dependency: {
#   project: "name_of_other_project"
# }

# project_name: "viz-histogram-marketplace"

constant: VIS_LABEL {
  value: "Histogram"
  export: override_optional
}

constant: VIS_ID {
  value: "histogram-marketplace"
  export:  override_optional
}

visualization: {
  id: "@{VIS_ID}"
  url: "https://marketplace-api.looker.com/viz-dist/histogram.js"
  label: "@{VIS_LABEL}"
}
