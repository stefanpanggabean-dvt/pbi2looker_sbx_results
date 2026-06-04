view: dim_measure {
  sql_table_name: commerce._Measure ;;

  measure: total_revenue { type: sum sql: ${fct_order_items.sale_price} ;;
    description: "Total revenue is the sum of sale prices from the fact order items."
  }
  measure: order_count { type: count_distinct sql: ${fct_order_items.order_id} ;;
    description: "Calculates the distinct count of orders from the order items table."
  }
  measure: avg_order_value { type: number sql: ${total_revenue} / NULLIF(${order_count}, 0) ;;
    description: "Average order value calculated as total revenue divided by order count."
  }
  measure: total_cost { type: sum sql: SUM(${fct_order_items.dim_products.cost}) ;;
    description: "Total cost aggregated from the cost of related products for each order item."
  }
  measure: gross_profit { type: number sql: ${total_revenue} - ${total_cost} ;;
    description: "Calculates gross profit by subtracting total cost from total revenue."
  }
  measure: revenue_ytd { type: number sql: SUM(CASE WHEN ${dim_date.dt_date_raw} BETWEEN DATE_TRUNC(${dim_date.dt_date_raw}, YEAR) AND CURRENT_DATE() THEN ${total_revenue._sql} ELSE 0 END) ;;
    description: "Calculates the total revenue year-to-date up to the current date."
  }
  measure: event_count { type: count sql: ${fct_events.event_id} ;;
    description: "Counts the total number of event records."
  }
  measure: session_count { type: count_distinct sql: ${fct_events.session_id} ;;
    description: "Counts the number of unique sessions from the events table."
  }
}