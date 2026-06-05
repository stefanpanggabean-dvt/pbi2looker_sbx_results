view: dim_measure {
  sql_table_name: commerce._Measure ;;


  measure: total_revenue {
    type: sum
    sql: ${fct_order_items.sale_price} ;;
    description: "Total revenue calculated as the sum of sale prices from order items."
  }
  measure: order_count {
    type: count_distinct
    sql: ${fct_order_items.order_id} ;;
    description: "Count of distinct orders."
  }
  measure: avg_order_value {
    type: number
    sql: ${total_revenue} / ${order_count} ;;
    description: "Calculates the average order value by dividing the total revenue by the total number of orders."
  }
  measure: total_cost {
    type: sum
    sql: ${fct_order_items.dim_products.cost} ;;
    description: "Total cost of all order items, calculated by summing the cost from related products for each order item."
  }
  measure: gross_profit {
    type: number
    sql: ${total_revenue} - ${total_cost} ;;
    description: "Calculates the gross profit as the difference between total revenue and total cost."
  }
  measure: revenue_ytd {
    type: number
    sql: SUM(CASE WHEN ${dim_date.sk_date} <= {% date_end dim_date.sk_date %} AND EXTRACT(YEAR FROM ${dim_date.sk_date}) = EXTRACT(YEAR FROM {% date_end dim_date.sk_date %}) THEN ${total_revenue} ELSE 0 END) ;;
    description: "Calculates the total revenue year-to-date based on the dim_date.sk_date."
  }
  measure: event_count {
    type: number
    sql: COUNT(${fct_events.id}) ;;
    description: "Total count of events from the fact_events table."
  }
  measure: session_count {
    type: count_distinct
    sql: ${fct_events.session_id} ;;
    description: "Counts the number of unique sessions."
  }
}