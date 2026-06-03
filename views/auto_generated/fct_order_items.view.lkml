view: fct_order_items {
  sql_table_name: commerce.fact__order_items ;;

  dimension: id { type: number
    sql: ${TABLE}.id ;;
  }

  dimension: order_id { type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: sk_user_id { type: number
    hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: sk_product_id { type: number
    hidden: yes
    sql: ${TABLE}.product_id ;;
  }

  dimension: inventory_item_id { type: number
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: status { type: string
    sql: ${TABLE}.status ;;
  }

  dimension_group: sk_created_at { type: time timeframes: [raw, time, date, week, month, quarter, year] sql: ${TABLE}.created_at ;; }

  dimension_group: sk_shipped_at { type: time timeframes: [raw, time, date, week, month, quarter, year] sql: ${TABLE}.shipped_at ;; }

  dimension_group: sk_delivered_at { type: time timeframes: [raw, time, date, week, month, quarter, year] sql: ${TABLE}.delivered_at ;; }

  dimension_group: sk_returned_at { type: time timeframes: [raw, time, date, week, month, quarter, year] sql: ${TABLE}.returned_at ;; }

  dimension: sale_price { type: number
    sql: ${TABLE}.sale_price ;;
  }

  dimension: sk_created_date { type: string
    hidden: yes
    sql: DATE(${sk_created_at_raw}) ;;
    description: "Extracts the date part from the order item creation timestamp."
  }

  dimension: sk_shipped_date { type: string
    hidden: yes
    sql: ${sk_shipped_at_date} ;;
    description: "Date part of the shipment timestamp, derived from sk_shipped_at. Returns NULL if sk_shipped_at is NULL."
  }

  dimension: sk_delivered_date { type: string
    hidden: yes
    sql: DATE(${sk_delivered_at_raw}) ;;
    description: "Extracts the delivery date from the raw delivery timestamp. Returns NULL if the timestamp is not available."
  }

  dimension: sk_returned_date { type: string
    hidden: yes
    sql: DATE(${sk_returned_at_raw}) ;;
    description: "The date when the order item was returned, derived from the returned_at timestamp. Returns NULL if the item has not been returned."
  }

}