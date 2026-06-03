view: dim_measure {
  sql_table_name: commerce._Measure ;;

  measure: _Total_Revenue { type: number sql: SUM(${fact__order_items.sale_price}) ;;
  }
  measure: _Order_Count { type: number sql: DISTINCTCOUNT(${fact__order_items.order_id}) ;;
  }
  measure: _Avg_Order_Value { type: number sql: DIVIDE(${_Total_Revenue}, ${_Order_Count}) ;;
  }
  measure: _Total_Cost { type: number sql: SUMX(fact__order_items, RELATED(${dim__products.cost})) ;;
  }
  measure: _Gross_Profit { type: number sql: ${_Total_Revenue} - ${_Total_Cost} ;;
  }
  measure: _Revenue_YTD { type: number sql: TOTALYTD(${_Total_Revenue}, 'dim__date'${Date}) ;;
  }
  measure: _Event_Count { type: number sql: COUNTROWS(fact__events) ;;
  }
  measure: _Session_Count { type: number sql: DISTINCTCOUNT(${fact__events.session_id}) ;;
  }
}