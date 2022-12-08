explore: wnba_team_and_opponent_game_stats {}

# The name of this view in Looker is "Wnba Team and Opponent Game Stats"
view: wnba_team_and_opponent_game_stats {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `aarons-awesome-project.wnba_hackathon.wnba_team_and_opponent_game_stats`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Field Goals Attempted 2pt" in Explore.

  dimension: field_goals_attempted_2pt {
    type: number
    sql: ${TABLE}.field_goals_attempted_2pt ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_field_goals_attempted_2pt {
    type: sum
    sql: ${field_goals_attempted_2pt} ;;
  }

  measure: average_field_goals_attempted_2pt {
    type: average
    sql: ${field_goals_attempted_2pt} ;;
  }

  dimension: field_goals_attempted_3pt {
    type: number
    sql: ${TABLE}.field_goals_attempted_3pt ;;
  }

  dimension: field_goals_made_2pt {
    type: number
    sql: ${TABLE}.field_goals_made_2pt ;;
  }

  dimension: field_goals_made_3pt {
    type: number
    sql: ${TABLE}.field_goals_made_3pt ;;
  }

  dimension: free_throws_attempted {
    type: number
    sql: ${TABLE}.free_throws_attempted ;;
  }

  dimension: free_throws_made {
    type: number
    sql: ${TABLE}.free_throws_made ;;
  }

  dimension: game_id {
    type: string
    sql: ${TABLE}.GameId ;;
  }

  dimension: game_id_opp_id {
    type: string
    sql: ${TABLE}.GameIdOppId ;;
  }

  dimension: game_id_team_id {
    type: string
    sql: ${TABLE}.GameIdTeamId ;;
  }

  dimension: opp_abbreviation {
    type: string
    sql: ${TABLE}.opp_abbreviation ;;
  }

  dimension: opp_defensive_rebounds {
    type: number
    sql: ${TABLE}.opp_defensive_rebounds ;;
  }

  dimension: opp_field_goals_attempted_2pt {
    type: number
    sql: ${TABLE}.opp_field_goals_attempted_2pt ;;
  }

  dimension: opp_field_goals_attempted_3pt {
    type: number
    sql: ${TABLE}.opp_field_goals_attempted_3pt ;;
  }

  dimension: opp_field_goals_made_2pt {
    type: number
    sql: ${TABLE}.opp_field_goals_made_2pt ;;
  }

  dimension: opp_field_goals_made_3pt {
    type: number
    sql: ${TABLE}.opp_field_goals_made_3pt ;;
  }

  dimension: opp_free_throws_attempted {
    type: number
    sql: ${TABLE}.opp_free_throws_attempted ;;
  }

  dimension: opp_free_throws_made {
    type: number
    sql: ${TABLE}.opp_free_throws_made ;;
  }

  dimension: opp_offensive_rebounds {
    type: number
    sql: ${TABLE}.opp_offensive_rebounds ;;
  }

  dimension: opp_points {
    type: number
    sql: ${TABLE}.opp_points ;;
  }

  dimension: opp_possessions {
    type: number
    sql: ${TABLE}.opp_possessions ;;
  }

  dimension: opp_turnovers {
    type: number
    sql: ${TABLE}.opp_turnovers ;;
  }

  dimension: opp_win {
    type: number
    sql: ${TABLE}.opp_win ;;
  }

  dimension: team_abbreviation {
    type: string
    sql: ${TABLE}.team_abbreviation ;;
  }

  dimension: team_defensive_rebounds {
    type: number
    sql: ${TABLE}.team_defensive_rebounds ;;
  }

  dimension: team_offensive_rebounds {
    type: number
    sql: ${TABLE}.team_offensive_rebounds ;;
  }

  dimension: team_points {
    type: number
    sql: ${TABLE}.team_points ;;
  }

  dimension: team_possessions {
    type: number
    sql: ${TABLE}.team_possessions ;;
  }

  dimension: team_turnovers {
    type: number
    sql: ${TABLE}.team_turnovers ;;
  }

  dimension: team_win {
    type: number
    sql: ${TABLE}.team_win ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
