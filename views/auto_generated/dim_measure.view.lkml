view: dim_measure {
  sql_table_name: commerce._Measure ;;

  measure: _Total_Revenue { type: sum sql: ${sale_price} ;;
    description: "Calculates the total revenue by summing the sale price of order items."
  }
  measure: _Order_Count { type: count_distinct sql: ${fact_order_items.order_id} ;;
    description: "Count of distinct orders from fact order items."
  }
  measure: _Avg_Order_Value { type: number sql: ${total_revenue} / ${order_count} ;;
    description: "Calculates the average order value by dividing total revenue by the total number of orders."
  }
  measure: _Total_Cost { type: sum sql: ${fact_order_items.dim_products.am_product_cost} ;;
    description: "Total cost derived from product costs for each order item."
  }
  measure: _Gross_Profit { type: number sql: ${_Total_Revenue} - ${_Total_Cost} ;;
    description: "Calculates gross profit by subtracting total cost from total revenue."
  }
  measure: _Revenue_YTD { type: sum sql: SUM(CASE WHEN EXTRACT(YEAR FROM ${dt_date_raw}) = EXTRACT(YEAR FROM MAX(${dt_date_raw})) AND ${dt_date_raw} <= MAX(${dt_date_raw}) THEN ${revenue_amount} ELSE 0 END) ;;
    description: "Calculates the year-to-date revenue up to the latest date present in the current filter context."
  }
  measure: _Event_Count { type: count sql: ${fact__events.sk_event} ;;
    description: "Counts the total number of events from the 'fact__events' table. Assumes 'fact__events' is joined and has a primary key 'sk_event'."
  }
  measure: _Session_Count { type: count_distinct sql: ${session_id} ;;
    description: "Counts the number of unique user sessions."
  }
}