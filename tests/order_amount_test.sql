with tb1 as(
    select
    order_id,
    count(*) as duplicate_count
    from {{ref('orders')}}
    group by order_id
    having count(*) > 1
)
select * from tb1