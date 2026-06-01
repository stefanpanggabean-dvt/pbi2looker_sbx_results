view: dim_date {
  sql_table_name: commerce.dim__date ;;

  dimension: dt_date {
    type: string
    primary_key: yes
    sql: ${TABLE}.Date ;;
  }

  dimension: year number {
    type: string
    sql: ${TABLE}.Year Number ;;
  }

  dimension: quarter label {
    type: string
    sql: ${TABLE}.Quarter Label ;;
  }

  dimension: month num {
    type: string
    sql: ${TABLE}.Month Num ;;
  }

  dimension: day name {
    type: string
    sql: ${TABLE}.Day Name ;;
  }

  dimension: month name {
    type: string
    sql: ${TABLE}.Month Name ;;
  }

  dimension: year quarter {
    type: string
    sql: ${TABLE}.Year Quarter ;;
  }

  dimension: day num {
    type: string
    sql: ${TABLE}.Day Num ;;
  }

}