{% snapshot snap_customers_timestamp %}

{{
        config(
        target_schema='snapshots',
        strategy ='timestamp',
        unique_key='id',
        updated_at='updated_at'
    )
}}
select * from {{source('datafeed','raw_customers')}}

{%endsnapshot%}