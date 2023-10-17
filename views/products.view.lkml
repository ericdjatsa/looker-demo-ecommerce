# The name of this view in Looker is "Products"
view: products {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `thelook_ecommerce.products` ;;
  drill_fields: [id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    description: "Product ID"
    sql: ${TABLE}.id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Brand" in Explore.

  dimension: brand {
    type: string
    description: "Product Brand"
    sql: ${TABLE}.brand ;;
  }

  dimension: category {
    type: string
    description: "Product Category"
    sql: ${TABLE}.category ;;
  }

  dimension: cost {
    type: number
    description: "Product Cost"
    sql: ${TABLE}.cost ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_cost {
    type: sum
    sql: ${cost} ;;  }
  measure: average_cost {
    type: average
    sql: ${cost} ;;  }

  dimension: department {
    type: string
    description: "Product Department"
    sql: ${TABLE}.department ;;
  }

  dimension: distribution_center_id {
    type: number
    description: "Product Distribution Center"
    # hidden: yes
    sql: ${TABLE}.distribution_center_id ;;
  }

  dimension: name {
    type: string
    description: "Product Name"
    sql: ${TABLE}.name ;;
  }

  dimension: retail_price {
    type: number
    description: "Product Price"
    sql: ${TABLE}.retail_price ;;
  }

  dimension: sku {
    type: string
    description: "Product SKU"
    sql: ${TABLE}.sku ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	id,
	name,
	distribution_centers.name,
	distribution_centers.id,
	order_items.count,
	inventory_items.count
	]
  }

}
