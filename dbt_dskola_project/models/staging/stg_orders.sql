with raw_orders as (
    select
        order_id,
        customer_id,
        employee_id,
        order_date,
        freight
    from {{ source('raw','orders') }}
)
select * from raw_orders