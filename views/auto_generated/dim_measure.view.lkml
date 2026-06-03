view: dim_measure {
  sql_table_name: commerce._Measure ;;

  measure: _Total_Revenue { type: sum sql: ${sale_price} :: ;;
    description: "Calculates the total revenue from all sale items."
  }
  measure: _Order_Count { type: count_distinct sql: ${order_id} ;; ;;
    description: "Counts the number of unique orders."
  }
  measure: _Avg_Order_Value { type: number sql: ${_total__revenue} / ${_order_count} ;; ;;
    description: "Calculates the average order value by dividing the total revenue by the total number of orders."
  }
  measure: _Total_Cost { type: sum sql: ${dim_products.cost} ;; ;;
    description: "Total cost of all order items, obtained by summing the related product cost for each item."
  }
  measure: _Gross_Profit { type: number sql: ${_total_revenue} - ${_total_cost} ;;
    description: "Calculates the gross profit by subtracting total cost from total revenue."
  }
  measure: _Revenue_YTD { type: dollar sql: SUM(${_total_revenue}) OVER (PARTITION BY EXTRACT(YEAR FROM ${dt_date_raw}) ORDER BY ${dt_date_raw}) ;;
    description: "Calculates the year-to-date total revenue based on the date dimension."
  }
  measure: _Event_Count { type: number sql: COUNT(1) ;;
    description: "Counts the total number of related events from the fact__events table."
  }
  measure: _Session_Count { type: count_distinct sql: ${fact__events.session_id} ;;
    description: "Counts the number of unique sessions from the fact events table."
  }
}