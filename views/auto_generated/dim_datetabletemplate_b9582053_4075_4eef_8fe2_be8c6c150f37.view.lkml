view: dim_datetabletemplate_b9582053_4075_4eef_8fe2_be8c6c150f37 {
  sql_table_name: commerce.DateTableTemplate_b9582053-4075-4eef-8fe2-be8c6c150f37 ;;

  dimension_group: dt_date {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.Date ;;
  }
  dimension: year {
    type: number
    sql: EXTRACT(YEAR FROM ${dt_date_raw}) ;;
    description: "Year extracted from the raw date."
  }
  dimension: monthno {
    type: number
    sql: EXTRACT(MONTH FROM ${dt_date_raw}) ;;
    description: "Extracts the month number (1-12) from the date."
  }
  dimension: month {
    type: string
    sql: FORMAT_DATE('%B', ${dt_date_raw}) ;;
    description: "Full name of the month."
  }
  dimension: quarterno {
    type: number
    sql: CAST((${monthno} + 2) / 3 AS INT64) ;;
    description: "The quarter number (1-4) derived from the month number."
  }
  dimension: quarter {
    type: string
    sql: CONCAT('Qtr ', ${quarterno}) ;;
    description: "The quarter number prefixed with 'Qtr '."
  }
  dimension: day {
    type: number
    sql: EXTRACT(DAY FROM ${dim_datetabletemplate.dt_date_raw}) ;;
    description: "Day of the month extracted from the date."
  }

}