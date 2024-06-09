-- models/staging/stg_order_details.sql
with raw_order_details as (
    select
        order_id,
        product_id,
        unit_price,
        quantity,
        discount
    from {{ source('raw','order_details') }}
)
select * from raw_order_details