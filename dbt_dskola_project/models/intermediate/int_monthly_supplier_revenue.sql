-- models/intermediate/int_monthly_supplier_revenue.sql
with order_product as (
    select
        o.order_id,
        o.order_date,
        od.product_id,
        od.unit_price * od.quantity * (1 - od.discount) as gross_revenue
    from {{ ref('stg_orders') }} o
    join {{ ref('stg_order_details') }} od
    on o.order_id = od.order_id
),
product_supplier as (
    select
        op.order_id,
        op.order_date,
        p.supplier_id,
        op.gross_revenue
    from order_product op
    join {{ ref('stg_products') }} p
    on op.product_id = p.product_id
)
select
    supplier_id,
    DATE_PART('month', order_date::date) AS month,
    sum(gross_revenue) as total_gross_revenue
from product_supplier
group by supplier_id, month
order by month asc
