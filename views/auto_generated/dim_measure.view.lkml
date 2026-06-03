view: dim_measure {
  sql_table_name: commerce._Measure ;;

  measure: _Total_Revenue { type: sum sql: ${sale_price} ;;
    description: "Total revenue calculated as the sum of sale prices."
  }
  measure: _Order_Count { type: count_distinct sql: COUNT(DISTINCT ${sk_order}) ;;
    description: "Counts the number of unique orders."
  }
  measure: _Avg_Order_Value { type: number sql: SAFE_DIVIDE(${_total_revenue}, ${_order_count}) ;;
    description: "Calculates the average revenue per order by dividing total revenue by the total order count."
  }
  measure: _Total_Cost { type: sum sql: ${dim_products.cost} ;;
    description: "Calculates the total cost by summing the cost of related products for each order item."
  }
  measure: _Gross_Profit { type: number sql: ${total_revenue} - ${total_cost} ;;
    description: "Calculates gross profit as total revenue minus total cost."
  }
  measure: _Revenue_YTD { type: sum_over_time sql: ${total_revenue} ;;
    description: "Calculates the year-to-date total revenue based on the date dimension."
  }
  measure: _Event_Count { type: count sql: 1 ;;
    description: "Counts the total number of events from the fact__events table."
  }
  measure: _Session_Count { type: count_distinct sql: ${session_id} ;;
    description: "Number of unique sessions recorded."
  }
}