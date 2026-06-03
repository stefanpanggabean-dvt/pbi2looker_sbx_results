view: dim_datetabletemplate_b9582053_4075_4eef_8fe2_be8c6c150f37 {
  sql_table_name: commerce.DateTableTemplate_b9582053-4075-4eef-8fe2-be8c6c150f37 ;;

  dimension_group: dt_date { type: time timeframes: [raw, time, date, week, month, quarter, year] sql: ${TABLE}.Date ;; }

  dimension: year { type: number
    sql: YEAR(${Date}) ;;
  }

  dimension: monthno { type: number
    sql: MONTH(${Date}) ;;
  }

  dimension: month { type: string
    sql: FORMAT(${Date}, "MMMM") ;;
  }

  dimension: quarterno { type: number
    sql: INT((${MonthNo} + 2) / 3) ;;
  }

  dimension: quarter { type: string
    sql: "Qtr " & ${QuarterNo} ;;
  }

  dimension: day { type: number
    sql: DAY(${Date}) ;;
  }

}