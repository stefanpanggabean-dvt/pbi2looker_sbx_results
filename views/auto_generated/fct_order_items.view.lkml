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
    description: "The date when the order item was created, derived from the creation timestamp."
  }

  dimension: sk_shipped_date { type: string
    hidden: yes
    sql: DATE(${sk_shipped_at_raw}) ;;
    description: "Shipped date extracted from the raw shipped timestamp, returning NULL if the raw timestamp is blank."
  }

  dimension: sk_delivered_date { type: string
    hidden: yes
    sql: CAST(${sk_delivered_at_raw} AS DATE) ;;
    description: "The date when the order item was delivered, derived from the raw delivered timestamp."
  }

  dimension: sk_returned_date { type: string
    hidden: yes
    sql: CASE WHEN ${sk_returned_at_raw} IS NULL THEN NULL ELSE CAST(${sk_returned_at_raw} AS DATE) END ;;
    description: "Extracts the date part from the raw returned timestamp, returning NULL if the timestamp is blank."
  }

}