{% snapshot snap_customers_timestamp2 %}

{{
        config(
        target_schema='snapshots',
        strategy ='timestamp',
        unique_key='id',
        updated_at='updated_at',
        invalidate_hard_deletes= True
    )
}}
select * from {{source('datafeed','raw_customers')}}

{%endsnapshot%}