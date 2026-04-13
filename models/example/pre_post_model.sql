{{ config(
    materialized='table',
    pre_hook="TRUNCATE TABLE{{this}}",
    post_hook="TRUNCATE TABLE {{ ref('orders')}}"
)}}
with tb1 as(
    select
    *
    from {{ref('orders')}}
)
select * from tb1
