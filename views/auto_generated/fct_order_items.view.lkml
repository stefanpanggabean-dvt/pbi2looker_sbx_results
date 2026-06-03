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
    sql: CAST(${sk_created_at_raw} AS DATE) ;;
    description: "Date part of when the order item was created."
  }

  dimension: sk_shipped_date { type: string
    hidden: yes
    sql: CAST(${sk_shipped_at_raw} AS DATE) ;;
    description: "Extracts the date part from the shipment timestamp, returning NULL if the timestamp is not available."
  }

  dimension: sk_delivered_date { type: string
    hidden: yes
    sql: CAST(${sk_delivered_at_raw} AS DATE) ;;
    description: "Extracts the date part from the 'delivered_at' timestamp, returning NULL if 'delivered_at' is blank."
  }

  dimension: sk_returned_date { type: string
    hidden: yes
    sql: DATE(${sk_returned_at_raw}) ;;
    description: "Extracts the date part from the `returned_at` timestamp. Returns NULL if `returned_at` is blank."
  }

}