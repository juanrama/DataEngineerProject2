-- models/intermediate/int_monthly_category_sales.sql
with order_product as (
    select
        o.order_id,
        o.order_date,
        od.product_id,
        od.quantity
    from {{ ref('stg_orders') }} o
    join {{ ref('stg_order_details') }} od
    on o.order_id = od.order_id
),
product_category as (
    select
        op.order_id,
        op.order_date,
        p.category_id,
        op.quantity
    from order_product op
    join {{ ref('stg_products') }} p
    on op.product_id = p.product_id
)
select
    category_id,
    DATE_PART('month', order_date::date) AS month,
    sum(quantity) as total_quantity
from product_category
group by category_id, month
order by month asc
