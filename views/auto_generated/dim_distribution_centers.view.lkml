view: dim_distribution_centers {
  sql_table_name: commerce.dim__distribution_centers ;;

  dimension: sk_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.id ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }
  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }
  dimension: distribution_center_geom {
    type: string
    sql: ${TABLE}.distribution_center_geom ;;
  }

}