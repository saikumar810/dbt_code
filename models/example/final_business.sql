{{config(materialized = 'table', transient ='false')}}
with cust as(
    select
    id as customer_id,
    firstname,
    lastname
    from{{source('datafeed','raw_customerdata')}}
),
ord as(
    select
    id as order_id,
    user_id as customer_id,
    order_date,
    status as order_status
    from{{source('datafeed','raw_orders'))}}
),
cust_orders as(
    select
    min(order_date) as first_order_date
    max(order_date) as last_order_date
    count(order_id) as number_of_orders
    from ord
    group by 1
),
final as(
    select
    cust.customer_id,
    cust.firstname,
    cust.lastname,
    cust_orders.first_order_date,
    cust_orders.last_order_date,
    coalesce(cust_orders.number_of_orders,0) as num_of_orders
    from cust
    left join cust_orders using(customer.id)
    )
select * from final