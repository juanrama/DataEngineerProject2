-- models/intermediate/int_monthly_employee_revenue.sql
with order_product as (
    select
        o.order_id,
        o.order_date,
        o.employee_id,
        od.unit_price * od.quantity * (1 - od.discount) as gross_revenue
    from {{ ref('stg_orders') }} o
    join {{ ref('stg_order_details') }} od
    on o.order_id = od.order_id
)
select
    employee_id,
    DATE_PART('month', order_date::date) AS month,
    sum(gross_revenue) as total_gross_revenue
from order_product
group by employee_id, month
order by month asc
