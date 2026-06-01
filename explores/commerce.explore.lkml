include: "/views/auto_generated/fct_events.view.lkml"
include: "/views/auto_generated/dim_*.view.lkml"

explore: fct_events {
  label: "Fct Events"
  join: dim_users {
    type: left_outer
    relationship: many_to_one
    sql_on: ${fct_events.sk_user_id} = ${dim_users.sk_id} ;;
  }
  join: dim_date {
    type: left_outer
    relationship: many_to_one
    sql_on: ${fct_events.sk_event_date} = ${dim_date.dt_date} ;;
  }
}