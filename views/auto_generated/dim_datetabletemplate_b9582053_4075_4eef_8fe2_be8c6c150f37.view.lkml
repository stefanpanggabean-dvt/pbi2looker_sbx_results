view: dim_datetabletemplate_b9582053_4075_4eef_8fe2_be8c6c150f37 {
  sql_table_name: commerce.DateTableTemplate_b9582053-4075-4eef-8fe2-be8c6c150f37 ;;

  dimension_group: dt_date {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.Date ;;
  }
  dimension: year {
    type: number
    sql: EXTRACT(YEAR FROM ${dim_datetabletemplate.dt_date_raw}) ;;
    description: "Year extracted from the raw date."
  }
  dimension: monthno {
    type: number
    sql: EXTRACT(MONTH FROM ${dt_date_raw}) ;;
    description: "Extracts the month number from the date field."
  }
  dimension: month {
    type: string
    sql: FORMAT_DATE('%B', ${dt_date_raw}) ;;
    description: "Month name (e.g., January) derived from the raw date."
  }
  dimension: quarterno {
    type: number
    sql: TRUNC((${monthno} + 2) / 3) ;;
    description: "Calculates the quarter number (1-4) based on the month number."
  }
  dimension: quarter {
    type: string
    sql: CONCAT('Qtr ', ${quarterno}) ;;
    description: "Represents the quarter as 'Qtr ' followed by the quarter number."
  }
  dimension: day {
    type: number
    sql: EXTRACT(DAY FROM ${dt_date_raw}) ;;
    description: "Extracts the day of the month from the raw date."
  }

}