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
    sql: DATE(YEAR(${created_at}), MONTH(${created_at}), DAY(${created_at})) ;;
  }

  dimension: sk_shipped_date { type: string
    hidden: yes
    sql: IF(ISBLANK(${shipped_at}), BLANK(), DATE(YEAR(${shipped_at}), MONTH(${shipped_at}), DAY(${shipped_at}))) ;;
  }

  dimension: sk_delivered_date { type: string
    hidden: yes
    sql: IF(ISBLANK(${delivered_at}), BLANK(), DATE(YEAR(${delivered_at}), MONTH(${delivered_at}), DAY(${delivered_at}))) ;;
  }

  dimension: sk_returned_date { type: string
    hidden: yes
    sql: IF(ISBLANK(${returned_at}), BLANK(), DATE(YEAR(${returned_at}), MONTH(${returned_at}), DAY(${returned_at}))) ;;
  }

}