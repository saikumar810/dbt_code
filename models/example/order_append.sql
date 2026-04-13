{{config (
    materialized = 'incremental',
    incremental_strategy ='append'
) }}

select * from {{source('datafeed','raw_orders')}} limit 15