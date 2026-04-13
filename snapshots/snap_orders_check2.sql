{% snapshot snap_orders_check2 %}

{{
    config(
        target_schema='snapshots',
        strategy='check',
        unique_key='id',
        check_cols=['user_id', 'order_date', 'status'],
        invalidate_hard_deletes=True
    )
}}

select *
from {{ source('datafeed', 'raw_orders') }}
limit 15

{% endsnapshot %}
