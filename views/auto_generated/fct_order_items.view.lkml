view: fct_order_items {
  sql_table_name: commerce.fact__order_items ;;

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }
  dimension: sk_user_id {
    type: number
    hidden: yes
    sql: ${TABLE}.user_id ;;
  }
  dimension: sk_product_id {
    type: number
    hidden: yes
    sql: ${TABLE}.product_id ;;
  }
  dimension: inventory_item_id {
    type: number
    sql: ${TABLE}.inventory_item_id ;;
  }
  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }
  dimension_group: sk_created_at {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension_group: sk_shipped_at {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.shipped_at ;;
  }
  dimension_group: sk_delivered_at {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.delivered_at ;;
  }
  dimension_group: sk_returned_at {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.returned_at ;;
  }
  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }
  dimension: sk_created_date {
    type: string
    hidden: yes
    sql: CAST(${sk_created_at_raw} AS DATE) ;;
    description: "Created date of the order item."
  }
  dimension: sk_shipped_date {
    type: string
    hidden: yes
    sql: DATE(${sk_shipped_at_raw}) ;;
    description: "The date portion of the item's shipping timestamp."
  }
  dimension: sk_delivered_date {
    type: string
    hidden: yes
    sql: CAST(${dt_delivered_at_raw} AS DATE) ;;
    description: "Extracts the delivered date from the raw delivered at timestamp. Returns NULL if the raw timestamp is blank."
  }
  dimension: sk_returned_date {
    type: string
    hidden: yes
    sql: IF(${sk_returned_at_raw} IS NULL, NULL, CAST(${sk_returned_at_raw} AS DATE)) ;;
    description: "The date when the item was returned, derived from the raw returned timestamp. Returns NULL if the raw timestamp is blank."
  }

}