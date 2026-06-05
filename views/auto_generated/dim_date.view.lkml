view: dim_date {
  sql_table_name: commerce.dim__date ;;

  dimension: sk_date {
    type: string
    primary_key: yes
    sql: ${TABLE}.Date ;;
  }
  dimension: year_number {
    type: string
    sql: ${TABLE}.Year Number ;;
  }
  dimension: quarter_label {
    type: string
    sql: ${TABLE}.Quarter Label ;;
  }
  dimension: month_num {
    type: string
    sql: ${TABLE}.Month Num ;;
  }
  dimension: day_name {
    type: string
    sql: ${TABLE}.Day Name ;;
  }
  dimension: month_name {
    type: string
    sql: ${TABLE}.Month Name ;;
  }
  dimension: year_quarter {
    type: string
    sql: ${TABLE}.Year Quarter ;;
  }
  dimension: day_num {
    type: string
    sql: ${TABLE}.Day Num ;;
  }

}