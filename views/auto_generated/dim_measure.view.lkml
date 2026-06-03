view: dim_measure {
  sql_table_name: commerce._Measure ;;

  measure: _Total_Revenue { type: sum sql: ${fct_order_items.sale_price} ;;
    description: "Calculates the total revenue from the sale price of order items."
  }
  measure: _Order_Count { type: count_distinct sql: ${fct_order_items.order_id} ;;
    description: "Count of distinct order IDs from the order items fact table."
  }
  measure: _Avg_Order_Value { type: number sql: ${total_revenue} / ${order_count} ;;
    description: "Calculates the average order value by dividing total revenue by the order count."
  }
  measure: _Total_Cost { type: sum sql: ${dim_products.cost} ;;
    description: "Calculates the total cost by summing the cost of products associated with each order item."
  }
  measure: _Gross_Profit { type: sum sql: ${_total_revenue} - ${_total_cost} ;;
    description: "Calculates gross profit as total revenue minus total cost."
  }
  measure: _Revenue_YTD { type: sum sql: SUM(CASE WHEN ${dim_date.dt_date_raw} <= CURRENT_DATE() AND EXTRACT(YEAR FROM ${dim_date.dt_date_raw}) = EXTRACT(YEAR FROM CURRENT_DATE()) THEN ${sale_amount} ELSE 0 END) ;;
    description: "Total revenue for the current year to date. This translates the DAX `TOTALYTD` function on `_Total_Revenue`, summing the underlying `sale_amount` (assuming `_Total_Revenue` aggregates this field) for the current year up to the current date, using the `dim_date.dt_date_raw` field for date context."
  }
  measure: _Event_Count { type: count sql: COUNT(${fct_events.pk_event}) ;;
    description: "Counts the total number of events from the fact_events table."
  }
  measure: _Session_Count { type: count_distinct sql: ${fct_events.session_id} ;;
    description: "Counts the number of unique sessions from the fact_events table."
  }
}