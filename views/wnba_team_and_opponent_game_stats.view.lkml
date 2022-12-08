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



  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.


  measure: defensive_rebound_pct {
    type: number
    group_label: "Four Factors Data"
    value_format: "0.000"
    sql: ${team_defensive_rebounds}  / nullif((${team_defensive_rebounds} + ${opp_offensive_rebounds}), 0) ;;
  }


  measure: effective_fg_pct {
    type: number
    group_label: "Four Factors Data"
    value_format: "0.000"
    # Our formula is a little different because our data splits normal FG and FG3.
    sql: (${field_goals_made_2pt} + 1.5 * ${field_goals_made_3pt})  / nullif((${field_goals_attempted_2pt} + ${field_goals_attempted_3pt}), 0) ;;
  }

  measure: opp_effective_fg_pct {
    type: number
    group_label: "Four Factors Data"
    value_format: "0.000"
    # Our formula is a little different because our data splits normal FG and FG3.
    sql: (${opp_field_goals_made_2pt} + 1.5 * ${opp_field_goals_made_3pt})  / nullif((${opp_field_goals_attempted_2pt} + ${opp_field_goals_attempted_3pt}), 0) ;;
  }

  measure: field_goals_attempted_2pt {
    type: sum
    sql: ${TABLE}.field_goals_attempted_2pt ;;
  }

  measure: field_goals_attempted_3pt {
    type: sum
    sql: ${TABLE}.field_goals_attempted_3pt ;;
  }

  measure: field_goals_made_2pt {
    type: sum
    sql: ${TABLE}.field_goals_made_2pt ;;
  }

  measure: field_goals_made_3pt {
    type: sum
    sql: ${TABLE}.field_goals_made_3pt ;;
  }

  measure: four_factors_score {
    type: number
    group_label: "Four Factors Data"
    value_format: "0.000"
    sql:  351.1146 * ${effective_fg_pct} + -287.2934 * ${turnover_rate} + 137.1432 * ${offensive_rebound_pct} + 41.0642 * ${free_throw_rate}
      + -409.9348 * ${opp_effective_fg_pct} + 289.4278 * ${opp_turnover_rate} + 58.7066 * ${defensive_rebound_pct} + -70.4028 * ${opp_free_throw_rate};;
  }

  measure: free_throws_attempted {
    type: sum
    sql: ${TABLE}.free_throws_attempted ;;
  }

  measure: free_throws_made {
    type: sum
    sql: ${TABLE}.free_throws_made ;;
  }

  measure: free_throw_rate {
    type: number
    group_label: "Four Factors Data"
    value_format: "0.000"
    sql: ${free_throws_made}  / nullif((${field_goals_attempted_2pt} + ${field_goals_attempted_3pt}), 0) ;;
  }

  measure: opp_free_throw_rate {
    type: number
    group_label: "Four Factors Data"
    value_format: "0.000"
    sql: ${opp_free_throws_made}  / nullif((${opp_field_goals_attempted_2pt} + ${opp_field_goals_attempted_3pt}), 0) ;;
  }


  dimension: game_id {
    type: string
    sql: ${TABLE}.GameId ;;
  }

  dimension: game_id_team_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.GameIdTeamId ;;
  }

  dimension: opp_abbreviation {
    type: string
    sql: ${TABLE}.opp_abbreviation ;;
  }

  measure: opp_defensive_rebounds {
    type: sum
    sql: ${TABLE}.opp_defensive_rebounds ;;
  }

  measure: opp_field_goals_attempted_2pt {
    type: sum
    sql: ${TABLE}.opp_field_goals_attempted_2pt ;;
  }

  measure: opp_field_goals_attempted_3pt {
    type: sum
    sql: ${TABLE}.opp_field_goals_attempted_3pt ;;
  }

  measure: opp_field_goals_made_2pt {
    type: sum
    sql: ${TABLE}.opp_field_goals_made_2pt ;;
  }

  measure: opp_field_goals_made_3pt {
    type: sum
    sql: ${TABLE}.opp_field_goals_made_3pt ;;
  }

  measure: opp_free_throws_attempted {
    type: sum
    sql: ${TABLE}.opp_free_throws_attempted ;;
  }

  measure: opp_free_throws_made {
    type: sum
    sql: ${TABLE}.opp_free_throws_made ;;
  }

  measure: opp_offensive_rebounds {
    type: sum
    sql: ${TABLE}.opp_offensive_rebounds ;;
  }

  measure: opp_points {
    type: sum
    sql: ${TABLE}.opp_points ;;
  }

  measure: opp_possessions {
    type: sum
    sql: ${TABLE}.opp_possessions ;;
  }

  measure: opp_turnovers {
    type: sum
    sql: ${TABLE}.opp_turnovers ;;
  }

  measure: opp_win {
    type: sum
    sql: ${TABLE}.opp_win ;;
  }

  dimension: team_abbreviation {
    type: string
    sql: ${TABLE}.team_abbreviation ;;
  }

  measure: team_defensive_rebounds {
    type: sum
    sql: ${TABLE}.team_defensive_rebounds ;;
  }

  measure: team_offensive_rebounds {
    type: sum
    sql: ${TABLE}.team_offensive_rebounds ;;
  }

  measure: offensive_rebound_pct {
    type: number
    group_label: "Four Factors Data"
    value_format: "0.000"
    sql: ${team_offensive_rebounds}  / nullif((${team_offensive_rebounds} + ${opp_defensive_rebounds}), 0) ;;
  }

  measure: team_points {
    type: sum
    sql: ${TABLE}.team_points ;;
  }

  measure: team_possessions {
    type: sum
    sql: ${TABLE}.team_possessions ;;
  }

  measure: team_turnovers {
    type: sum
    sql: ${TABLE}.team_turnovers ;;
  }

  measure: team_win {
    type: sum
    sql: ${TABLE}.team_win ;;
  }

  measure: turnover_rate {
    type: number
    group_label: "Four Factors Data"
    value_format: "0.000"
    # Our formula is a little different because our data splits normal FG and FG3.
    sql: ${team_turnovers} / nullif(${team_possessions}, 0) ;;
  }

  measure: opp_turnover_rate {
    type: number
    group_label: "Four Factors Data"
    value_format: "0.000"
    # Our formula is a little different because our data splits normal FG and FG3.
    sql: ${opp_turnovers} / nullif(${opp_possessions}, 0) ;;
  }
  measure: count {
    type: count
    drill_fields: []
  }
}
