view: dim_measure {
  sql_table_name: commerce._Measure ;;

  measure: _Total_Revenue { type: sum sql: ${sale_price} ;; ;;
    description: "Calculates the total revenue by summing the sale price of all order items."
  }
  measure: _Order_Count { type: count_distinct sql: ${order_id} ;;
    description: "Counts the number of unique orders."
  }
  measure: _Avg_Order_Value { type: number sql: SAFE_DIVIDE(${total_revenue}, ${order_count}) ;;
    description: "Average Order Value, calculated as Total Revenue divided by Order Count."
  }
  measure: _Total_Cost { type: sum sql: ${fact_order_items.dim_products.cost} ;;
    description: "Calculates the total cost by summing the 'cost' from the `dim_products` table for each order item, accessed via `fact_order_items`. This measure assumes `dim_measure` joins `fact_order_items`, which in turn joins `dim_products`."
  }
  measure: _Gross_Profit { type: number sql: ${total_revenue} - ${total_cost} ;;
    description: "Calculates gross profit as total revenue minus total cost."
  }
  measure: _Revenue_YTD { type: sum sql: SUM(CASE WHEN EXTRACT(YEAR FROM ${dt_date_raw}) = EXTRACT(YEAR FROM (SELECT MAX(${dt_date_raw}) FROM ${TABLE} AS subq WHERE {% condition dt_date %} dt_date {% endcondition %})) AND ${dt_date_raw} <= (SELECT MAX(${dt_date_raw}) FROM ${TABLE} AS subq WHERE {% condition dt_date %} dt_date {% endcondition %}) THEN ${fct_revenue_amount} ELSE 0 END) ;;
    description: "Calculates the total revenue year-to-date, up to the maximum date in the current query context for the corresponding year. Assumes 'fct_revenue_amount' is the underlying revenue column and 'dt_date' is a date dimension group."
  }
  measure: _Event_Count { type: number sql: (SELECT COUNT(*) FROM ${fact_events.SQL_TABLE_NAME}) ;;
    description: "Total count of all rows in the `fact_events` table, derived from the DAX COUNTROWS function."
  }
  measure: _Session_Count { type: count_distinct sql: COUNT(DISTINCT ${sk_session_id}) ;;
    description: "Calculates the total number of unique sessions."
  }
}