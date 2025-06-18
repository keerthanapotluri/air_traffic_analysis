view: stg_accidents {
  sql_table_name: airTrafficdata.stg_accidents ;;

  # === Dimensions ===
  dimension: ntsb_no {
    type: string
    sql: ${TABLE}.NtsbNo ;;
  }

  dimension: event_date {
    type: date_time
    sql: ${TABLE}.EventDate_parsed ;;
  }

  dimension: docket_publish_date {
    type: date_time
    sql: ${TABLE}.DocketPublishDate_parsed ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.City ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.State ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.Country ;;
  }

  dimension: accident_reason {
    type: string
    sql: ${TABLE}.ProbableCause ;;
    description: "Official probable cause for the accident"
  }

  # === Measures ===
  measure: total_accidents {
    type: count
    description: "Total number of accidents"
  }

  measure: total_fatalities {
    type: sum
    sql: ${TABLE}.FatalInjuryCount ;;
    description: "Sum of fatal injuries"
  }

  measure: total_serious_injuries {
    type: sum
    sql: ${TABLE}.SeriousInjuryCount ;;
    description: "Sum of serious injuries"
  }

  measure: total_minor_injuries {
    type: sum
    sql: ${TABLE}.MinorInjuryCount ;;
    description: "Sum of minor injuries"
  }
}