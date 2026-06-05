view: dim_sales_data {
  sql_table_name: commerce.sales_data ;;

  dimension_group: dt_order_date {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.order_date ;;
  }
  dimension: product_category {
    type: string
    sql: ${TABLE}.product_category ;;
  }
  dimension: gross_revenue {
    type: number
    sql: ${TABLE}.gross_revenue ;;
  }
  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }
  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }
  dimension: customer_segment {
    type: string
    sql: ${TABLE}.customer_segment ;;
  }
  dimension: order_id {
    type: string
    sql: ${TABLE}.order_id ;;
  }
  dimension: discount {
    type: number
    sql: ${TABLE}.discount ;;
  }
  dimension: customer_id {
    type: string
    sql: ${TABLE}.customer_id ;;
  }

  measure: total_gross_revenue {
    type: sum
    sql: ${gross_revenue} ;;
    description: "Calculates the total gross revenue."
  }
  measure: total_quantity {
    type: sum
    sql: ${quantity} ;;
    description: "Total sum of quantity sold."
  }
  measure: total_discount {
    type: sum
    sql: ${discount} ;;
    description: "Total sum of discount applied to sales."
  }
}