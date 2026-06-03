view: dim_measure {
  sql_table_name: commerce._Measure ;;

  measure: total_revenue { type: sum sql: ${fct_order_items.sale_price} ;;
    description: "The sum of the sale price for all order items."
  }
  measure: order_count { type: count_distinct sql: ${fct_order_items.order_id} ;;
    description: "Counts the number of distinct orders."
  }
  measure: avg_order_value { type: number sql: SAFE_DIVIDE(${total_revenue}, ${order_count}) ;;
    description: "Calculates the average order value by dividing total revenue by the number of orders."
  }
  measure: total_cost { type: sum sql: ${dim_products.cost} ;;
    description: "Total cost of all order items, derived from the cost of related products."
  }
  measure: gross_profit { type: number sql: ${total_revenue} - ${total_cost} ;;
    description: "Calculates gross profit as total revenue minus total cost."
  }
  measure: revenue_ytd { type: number sql: SUM(CASE WHEN ${dim_date.sk_date} <= CURRENT_DATE() AND EXTRACT(YEAR FROM ${dim_date.sk_date}) = EXTRACT(YEAR FROM CURRENT_DATE()) THEN ${fct_orders.revenue} ELSE 0 END) ;;
    description: "Year-to-date total revenue, calculated from the beginning of the current calendar year up to the current date. Assumes 'total_revenue' aggregates the underlying 'fct_orders.revenue' field."
  }
  measure: event_count { type: count sql: ${fct_events.sk_event} ;;
    description: "Total count of events from the events fact table."
  }
  measure: session_count { type: count_distinct sql: ${fct_events.session_id} ;;
    description: "Counts the number of unique sessions."
  }
}