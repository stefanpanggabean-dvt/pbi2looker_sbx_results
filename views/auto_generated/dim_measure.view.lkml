view: dim_measure {
  sql_table_name: commerce._Measure ;;

  measure: _Total_Revenue { type: sum sql: ${fct_order_items.sale_price} ;;
    description: "Calculates the total revenue from all order items."
  }
  measure: _Order_Count { type: count_distinct sql: ${fct_order_items.order_id} ;;
    description: "Counts the number of unique orders from the order items fact table."
  }
  measure: _Avg_Order_Value { type: number sql: SAFE_DIVIDE(${_total_revenue}, ${_order_count}) ;;
    description: "Calculates the average order value by dividing total revenue by the total order count."
  }
  measure: _Total_Cost { type: sum sql: SUM(${dim_products.cost}) ;;
    description: "Total cost of all order items, retrieved from the related product information."
  }
  measure: _Gross_Profit { type: number sql: ${_total_revenue} - ${_total_cost} ;;
    description: "Calculates gross profit by subtracting total cost from total revenue."
  }
  measure: _Revenue_YTD { type: sum sql: SUM(CASE WHEN ${dim_date.dt_date_raw} BETWEEN DATE_TRUNC(CURRENT_DATE(), YEAR) AND CURRENT_DATE() THEN ${fct_order_items.revenue_amount} ELSE 0 END) ;;
    description: "Calculates the year-to-date total revenue based on the current date."
  }
  measure: _Event_Count { type: count sql: ${fct_events.sk_event} ;;
    description: "Total number of events, counted from the fct_events table."
  }
  measure: _Session_Count { type: count_distinct sql: ${fct_events.session_id} ;;
    description: "Count of unique sessions."
  }
}