explore: wnba_player_stats_by_game {}

# The name of this view in Looker is "Wnba Player Stats By Game"
view: wnba_player_stats_by_game {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `aarons-awesome-project.wnba_hackathon.wnba_player_stats_by_game`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Annual Salary2022" in Explore.

  dimension: annual_salary_dimension {
    type: number
    value_format_name: usd
    sql: ${TABLE}.AnnualSalary2022 ;;
  }

  dimension: college_country {
    hidden: yes
    type: string
    sql: ${TABLE}.College ;;
  }

  dimension: college {
    type: string
    sql: SPLIT(${college_country},"/")[offset(0)];;
  }

  dimension: country {
    type: string
    sql: SPLIT(${college_country},"/")[offset(1)];;
  }

  dimension: date_of_birth {
    type: string
    sql: ${TABLE}.DateOfBirth ;;
  }

  dimension: age {
    type: number
    sql: DATE_DIFF(current_DATE(), DATE (${date_of_birth}), year) ;;
  }

  dimension: game_date_age {
    type: number
    sql: ${TABLE}.GameDateAge ;;
  }

  dimension: game_id {
    type: string
    sql: ${TABLE}.GameId ;;
  }

  dimension: height {
    type: string
    sql: ${TABLE}.Height ;;
  }

  dimension: height_in_inches {
    type: number
    sql: ${TABLE}.HeightInInches ;;
  }

  dimension: home_team_flag {
    type: number
    sql: ${TABLE}.HomeTeamFlag ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
  }

  dimension: opponent_points {
    type: number
    sql: ${TABLE}.OpponentPoints ;;
  }

  dimension: player_id {
    type: string
    sql: ${TABLE}.PlayerId ;;
  }

  dimension: position {
    type: string
    sql: ${TABLE}.Position ;;
  }

  dimension: season {
    type: number
    sql: ${TABLE}.Season ;;
    value_format: "0"
  }

  dimension: season_type {
    type: string
    sql: ${TABLE}.Season_Type ;;
  }

  dimension: team_abbreviation {
    type: string
    sql: ${TABLE}.TeamAbbreviation ;;
  }

  dimension: team_points {
    type: number
    sql: ${TABLE}.TeamPoints ;;
  }

  dimension: team_win {
    type: number
    sql: ${TABLE}.TeamWin ;;
  }

  dimension: usage {
    type: number
    sql: ${TABLE}.Usage ;;
  }

  dimension: weight {
    type: string
    sql: ${TABLE}.Weight ;;
  }

  dimension: years_in_league {
    type: number
    sql: ${TABLE}.YearsInLeague ;;
  }


  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: game {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    datatype: datetime
    sql: ${TABLE}.GameDate ;;
  }

# A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.


  measure: Avg_annual_salary {
    type: average
    value_format_name: usd
    sql: ${TABLE}.AnnualSalary2022 ;;
  }

  measure: Avg_annual_salary_distinct {
    type: average_distinct
    sql_distinct_key: ${player_id} ;;
    value_format_name: usd
    sql: ${TABLE}.AnnualSalary2022 ;;
  }

  measure: Total_annual_salary {
    type: sum
    value_format_name: usd
    sql: ${TABLE}.AnnualSalary2022 ;;
  }


  measure: assists {
    type: sum
    group_label: "Assists"
    group_item_label: "Total Assists"
    sql: ${TABLE}.Assists ;;
  }

  measure: assists_per_minute {
    type: number
    group_label: "Assists"
    value_format: "0.000"
    sql: ${assists} / nullif(${minutes}, 0) ;;
  }

  measure: blocks {
    type: sum
    group_label: "Blocks"
    group_item_label: "Total Blocks"
    sql: ${TABLE}.Blocks ;;
  }

  measure: blocks_per_minute {
    type: number
    group_label: "Blocks"
    value_format: "0.000"
    sql: ${blocks} / nullif(${minutes}, 0) ;;
  }

  measure: effective_fg_pct {
    type: number
    group_label: "Four Factors Data"
    value_format: "0.000"
    sql: (${field_goals_attempted_2pt} + .5 * ${field_goals_attempted_3pt})  / nullif((${field_goals_attempted_2pt} + ${field_goals_attempted_3pt}), 0) ;;
  }

  measure: fantasy_points {
    type: sum
    group_label: "Fantasy"
    sql: ${TABLE}.FantasyPoints ;;
  }

  measure: fantasy_points_per_minute {
    type: number
    group_label: "Fantasy"
    value_format: "0.000"
    sql: ${fantasy_points}/nullif(${minutes},0) ;;
  }

  measure: field_goals_attempted_2pt {
    type: sum
    group_label: "Four Factors Data"
    sql: ${TABLE}.field_goals_attempted_2pt ;;
  }
  measure: field_goals_attempted_3pt {
    type: sum
    group_label: "Four Factors Data"
    sql: ${TABLE}.field_goals_attempted_3pt ;;
  }

  measure: field_goals_made_2pt {
    type: sum
    group_label: "Four Factors Data"
    sql: ${TABLE}.field_goals_made_2pt ;;
  }
  measure: field_goals_made_3pt {
    type: sum
    group_label: "Four Factors Data"
    sql: ${TABLE}.field_goals_made_3pt ;;
  }

  measure: fouls {
    type: sum
    group_label: "Fouls"
    group_item_label: "Total Fouls"
    sql: ${TABLE}.Fouls ;;
  }

  measure: fouls_drawn {
    type: sum
    group_label: "Fouls"
    group_item_label: "Total Fouls Drawn"
    sql: ${TABLE}.FoulsDrawn ;;
  }

  measure: fouls_drawn_per_minute {
    type: number
    group_label: "Fouls"
    value_format: "0.000"
    sql: ${fouls_drawn}/nullif(${minutes},0);;
  }

  measure: fouls_per_minute {
    type: number
    group_label: "Fouls"
    value_format: "0.000"
    sql: ${fouls}/nullif(${minutes},0);;
  }

  measure: points {
    type: sum
    group_label: "Points"
    group_item_label: "Total Points"
    sql: ${TABLE}.Points ;;
  }

  measure: points_per_minute {
    type: number
    group_label: "Points"
    value_format: "0.000"
    sql: ${points}/nullif(${minutes},0) ;;
  }

  measure: pts_putbacks {
    type: sum
    group_label: "Points"
    group_item_label: "Total Points Putback"
    sql: ${TABLE}.PtsPutbacks ;;
  }

  measure: pts_putbacks_per_minute {
    type: number
    group_label: "Points"
    value_format: "0.000"
    sql: ${pts_putbacks}/nullif(${minutes},0) ;;
  }

  measure: rebounds {
    type: sum
    group_label: "Rebounds"
    group_item_label: "Total Rebounds"
    sql: ${TABLE}.Rebounds ;;
  }

  measure: rebounds_per_minute {
    type: number
    group_label: "Rebounds"
    value_format: "0.000"
    sql: ${rebounds}/nullif(${minutes},0) ;;
  }

  measure: steals {
    type: sum
    group_label: "Steals"
    group_item_label: "Total Steals"
    sql: ${TABLE}.Steals ;;
  }

  measure: steals_per_minute {
    type: number
    group_label: "Steals"
    value_format: "0.000"
    sql: ${steals}/nullif(${minutes},0);;
  }

  measure: turnovers {
    type: sum
    group_label: "Turnovers"
    group_item_label: "Total Turnovers"
    sql: ${TABLE}.Turnovers ;;
  }

  measure: turnovers_per_minute {
    type: number
    group_label: "Turnovers"
    value_format: "0.000"
    sql: ${turnovers}/nullif(${minutes},0);;
  }

  measure: minutes {
    type: sum
    value_format: "0.00"
    sql: ${TABLE}.Minutes ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }

  measure: player_count {
    type: count_distinct
    sql: ${player_id} ;;
  }

  measure: total_wins{
    type: sum
    sql: ${team_win} ;;
  }

  measure: team_wins {
    type: sum_distinct
    sql_distinct_key: ${TABLE}.GameIdTeamId ;;
    sql: ${team_win} ;;
  }

  measure: team_possessions {
    type: sum_distinct
    sql_distinct_key: ${TABLE}.GameIdTeamId ;;
    sql: ${TABLE}.TeamPossessions ;;
  }

}
