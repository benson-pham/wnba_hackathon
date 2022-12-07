explore: wnba_player_stats_by_game {}

# The name of this view in Looker is "Wnba Player Stats By Game"
view: wnba_player_stats_by_game {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `aarons-awesome-project.mis776.wnba_player_stats_by_game`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Annual Salary2022" in Explore.

  dimension: annual_salary2022 {
    type: number
    sql: ${TABLE}.AnnualSalary2022 ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_annual_salary2022 {
    type: sum
    sql: ${annual_salary2022} ;;
  }

  measure: average_annual_salary2022 {
    type: average
    sql: ${annual_salary2022} ;;
  }

  dimension: assists {
    type: number
    sql: ${TABLE}.Assists ;;
  }

  dimension: assists_per_minute {
    type: number
    sql: ${TABLE}.AssistsPerMinute ;;
  }

  dimension: blocks {
    type: number
    sql: ${TABLE}.Blocks ;;
  }

  dimension: blocks_per_minute {
    type: number
    sql: ${TABLE}.BlocksPerMinute ;;
  }

  dimension: college {
    type: string
    sql: ${TABLE}.College ;;
  }

  dimension: date_of_birth {
    type: string
    sql: ${TABLE}.DateOfBirth ;;
  }

  dimension: fantasy_points {
    type: number
    sql: ${TABLE}.FantasyPoints ;;
  }

  dimension: fantasy_points_per_minute {
    type: number
    sql: ${TABLE}.FantasyPointsPerMinute ;;
  }

  dimension: fouls {
    type: number
    sql: ${TABLE}.Fouls ;;
  }

  dimension: fouls_drawn {
    type: number
    sql: ${TABLE}.FoulsDrawn ;;
  }

  dimension: fouls_drawn_per_minute {
    type: number
    sql: ${TABLE}.FoulsDrawnPerMinute ;;
  }

  dimension: fouls_per_minute {
    type: number
    sql: ${TABLE}.FoulsPerMinute ;;
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

  dimension: minutes {
    type: number
    sql: ${TABLE}.Minutes ;;
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

  dimension: points {
    type: number
    sql: ${TABLE}.Points ;;
  }

  dimension: points_per_minute {
    type: number
    sql: ${TABLE}.PointsPerMinute ;;
  }

  dimension: position {
    type: string
    sql: ${TABLE}.Position ;;
  }

  dimension: pts_putbacks {
    type: number
    sql: ${TABLE}.PtsPutbacks ;;
  }

  dimension: pts_putbacks_per_minute {
    type: number
    sql: ${TABLE}.PtsPutbacksPerMinute ;;
  }

  dimension: rebounds {
    type: number
    sql: ${TABLE}.Rebounds ;;
  }

  dimension: rebounds_per_minute {
    type: number
    sql: ${TABLE}.ReboundsPerMinute ;;
  }

  dimension: season {
    type: number
    sql: ${TABLE}.Season ;;
  }

  dimension: season_type {
    type: string
    sql: ${TABLE}.Season_Type ;;
  }

  dimension: steals {
    type: number
    sql: ${TABLE}.Steals ;;
  }

  dimension: steals_per_minute {
    type: number
    sql: ${TABLE}.StealsPerMinute ;;
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

  dimension: turnovers {
    type: number
    sql: ${TABLE}.Turnovers ;;
  }

  dimension: turnovers_per_minute {
    type: number
    sql: ${TABLE}.TurnoversPerMinute ;;
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

  measure: count {
    type: count
    drill_fields: [name]
  }
}