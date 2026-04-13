{{ config(materialized = 'table') }}
with tb1 as(
    select
    id as order_id,
    user_id,
    order_date,
    status
    from {{source('datafeed','raw_orders')}})
select * from tb1