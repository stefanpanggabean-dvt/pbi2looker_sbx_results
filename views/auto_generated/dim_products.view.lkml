view: dim_products {
  sql_table_name: commerce.dim__products ;;

  dimension: sk_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.id ;;
  }
  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }
  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }
  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;
  }
  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }
  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }
  dimension: sk_distribution_center_id {
    type: number
    hidden: yes
    sql: ${TABLE}.distribution_center_id ;;
  }

}