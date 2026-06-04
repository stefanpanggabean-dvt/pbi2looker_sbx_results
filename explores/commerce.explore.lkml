include: "/views/auto_generated/fct_events.view.lkml"
include: "/views/auto_generated/fct_order_items.view.lkml"
include: "/views/auto_generated/dim_*.view.lkml"

explore: fct_events { label: "Events"
  join: dim_users { type: left_outer relationship: many_to_one sql_on: ${fct_events.sk_user_id} = ${dim_users.sk_id} ;; }
  join: dim_date { type: left_outer relationship: many_to_one sql_on: ${fct_events.sk_event_date} = ${dim_date.sk_date} ;; }
}

explore: fct_order_items { label: "Order Items"
  join: dim_users { type: left_outer relationship: many_to_one sql_on: ${fct_order_items.sk_user_id} = ${dim_users.sk_id} ;; }
  join: dim_products { type: left_outer relationship: many_to_one sql_on: ${fct_order_items.sk_product_id} = ${dim_products.sk_id} ;; }
  join: dim_date { type: left_outer relationship: many_to_one sql_on: ${fct_order_items.sk_created_date} = ${dim_date.sk_date} ;; }
}
