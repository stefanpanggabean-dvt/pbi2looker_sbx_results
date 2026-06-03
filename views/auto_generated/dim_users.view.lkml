view: dim_users {
  sql_table_name: commerce.dim__users ;;

  dimension: sk_id { type: number
    primary_key: yes
    sql: ${TABLE}.id ;;
  }

  dimension: first_name { type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: last_name { type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: email { type: string
    sql: ${TABLE}.email ;;
  }

  dimension: age { type: number
    sql: ${TABLE}.age ;;
  }

  dimension: gender { type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: state { type: string
    sql: ${TABLE}.state ;;
  }

  dimension: street_address { type: string
    sql: ${TABLE}.street_address ;;
  }

  dimension: postal_code { type: string
    sql: ${TABLE}.postal_code ;;
  }

  dimension: city { type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country { type: string
    sql: ${TABLE}.country ;;
  }

  dimension: latitude { type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude { type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: traffic_source { type: string
    sql: ${TABLE}.traffic_source ;;
  }

  dimension_group: sk_created_at { type: time timeframes: [raw, time, date, week, month, quarter, year] sql: ${TABLE}.created_at ;; }

  dimension: user_geom { type: string
    sql: ${TABLE}.user_geom ;;
  }

  dimension: sk_signup_date { type: string
    hidden: yes
    sql: DATE(${sk_created_at_raw}) ;;
    description: "Date when the user signed up, derived from the creation timestamp."
  }

}