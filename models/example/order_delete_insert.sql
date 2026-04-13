{{config (materialized='incremental',
    unique_key='id',
    incremental_strategy='delete+insert'
)}}
select * from {{source ('datafeed','raw_orders')}} limit 15