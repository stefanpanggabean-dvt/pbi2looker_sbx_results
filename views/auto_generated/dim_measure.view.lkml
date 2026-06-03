view: dim_measure {
  sql_table_name: commerce._Measure ;;

  measure: _Total_Revenue { type: sum sql: ${sale_price} ;; ;;
    description: "Calculates the total sum of sale prices from all order items."
  }
  measure: _Order_Count { type: count_distinct sql: ${order_id} ;;
    description: "Counts the distinct number of orders."
  }
  measure: _Avg_Order_Value { type: number sql: ${_total_revenue} / ${_order_count} ;;
    description: "Calculates the average order value by dividing total revenue by order count."
  }
  measure: _Total_Cost { type: sum sql: ${dim_products.mt_cost} ;;
    description: "Calculates the total cost of order items by summing the monetary cost from related products in the 'dim_products' view."
  }
  measure: _Gross_Profit { type: sum sql: ${_total_revenue} - ${_total_cost} ;; ;;
    description: "Calculates the gross profit by subtracting total cost from total revenue."
  }
  measure: _Revenue_YTD { type: sum sql: CASE
      WHEN EXTRACT(YEAR FROM ${dt_date_raw}) = EXTRACT(YEAR FROM CURRENT_DATE())
      AND ${dt_date_raw} <= CURRENT_DATE()
      THEN ${fct_revenue}
      ELSE NULL
    END ;;
    description: "Calculates the total revenue year-to-date up to the current calendar date based on `fct_revenue` and `dt_date`."
  }
  measure: _Event_Count { type: count sql: 1 ;; ;;
    description: "Counts the total number of events from the fact__events table."
  }
  measure: _Session_Count { type: count_distinct sql: ${sk_session_id} ;;
    description: "Counts the number of distinct sessions."
  }
}