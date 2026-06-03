view: dim_measure {
  sql_table_name: commerce._Measure ;;

  measure: _Total_Revenue { type: sum sql: ${sale_price} ;;
    description: "Calculates the total revenue from all sale items based on their sale prices."
  }
  measure: _Order_Count { type: count_distinct sql: COUNT(DISTINCT ${order_id}) ;;
    description: "Counts the number of unique orders."
  }
  measure: _Avg_Order_Value { type: number sql: SAFE_DIVIDE(${total_revenue}, ${order_count}) ;;
    description: "Average Order Value, calculated as Total Revenue divided by Order Count."
  }
  measure: _Total_Cost { type: sum sql: ${fact__order_items.dim__products.cost} ;;
    description: "Calculates the total cost by summing the related product cost for each order item."
  }
  measure: _Gross_Profit { type: money sql: ${total_revenue} - ${total_cost} ;;
    description: "Calculates the gross profit by subtracting total cost from total revenue."
  }
  measure: _Revenue_YTD { type: number sql: SUM(CASE WHEN ${dt_date_date} <= MAX(${dt_date_date}) OVER () AND EXTRACT(YEAR FROM ${dt_date_date}) = EXTRACT(YEAR FROM MAX(${dt_date_date}) OVER ()) THEN ${fct_total_revenue} ELSE 0 END) ;;
    description: "Calculates the year-to-date total revenue based on the current date filter context."
  }
  measure: _Event_Count { type: count sql: COUNT(*) ;;
    description: "Counts the total number of rows in the underlying fact__events table."
  }
  measure: _Session_Count { type: count_distinct sql: ${session_id} ;;
    description: "Count of unique sessions."
  }
}