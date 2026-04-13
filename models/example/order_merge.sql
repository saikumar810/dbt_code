{{config(materialized = 'incremental', 
    incremental_strategy = 'merge', 
    unique_key='id'
)}}

select * from {{source('datafeed','raw_orders')}} order by id Asc limit 10