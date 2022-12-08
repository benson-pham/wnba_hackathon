project_name: "wnba_hackathon"

# # Use local_dependency: To enable referencing of another project
# # on this instance with include: statements
#
# local_dependency: {
#   project: "name_of_other_project"
# }

remote_dependency: testing_a_histogram {
  url: "https://github.com/llooker/viz-histogram-marketplace"
  ref: "master"
  # override_constant: connection {
  #   value: "importing_project_connection"
  # }
}
