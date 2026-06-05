view: dim_measure {
  sql_table_name: commerce._Measure ;;


  measure: total_revenue {
    type: sum
    sql: ${fct_order_items.sale_price} ;;
    description: "Calculates the total revenue based on the sum of sale prices from order items."
  }
  measure: order_count {
    type: count_distinct
    sql: ${fct_order_items.order_id} ;;
    description: "Count of distinct orders from the order items table."
  }
  measure: avg_order_value {
    type: number
    sql: SAFE_DIVIDE(${total_revenue}, ${order_count}) ;;
    description: "Average order value calculated as total revenue divided by the order count."
  }
  measure: total_cost {
    type: sum
    sql: ${dim_products.cost} ;;
    description: "Calculates the total cost of order items by summing the cost from related products."
  }
  measure: gross_profit {
    type: number
    sql: ${total_revenue} - ${total_cost} ;;
    description: "Calculates the gross profit by subtracting total cost from total revenue."
  }
  measure: revenue_ytd {
    type: number
    sql: SUM(${total_revenue}) OVER (PARTITION BY EXTRACT(YEAR FROM ${dim_date.dt_date_date}) ORDER BY ${dim_date.dt_date_date}) ;;
    description: "Calculates the year-to-date total of total_revenue."
  }
  measure: event_count {
    type: number
    sql: COUNT(${fct_events.sk_event}) ;;
    description: "Counts the number of rows in the fct_events table. Assumes fct_events is joined and sk_event is its primary key."
  }
  measure: session_count {
    type: count_distinct
    sql: ${fct_events.session_id} ;;
    description: "Counts the number of unique sessions."
  }
}