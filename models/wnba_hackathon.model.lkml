# Define the database connection to be used for this model.
connection: "lookerdata"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: wnba_hackathon_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: wnba_hackathon_default_datagroup

label: "WNBA Player Game Stats"

# include all the views
include: "/views/**/*.view"
