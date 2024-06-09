with raw_orders as (
    select
        order_id,
        customer_id,
        employee_id,
        order_date,
        freight
    from "db_project_2"."public"."orders"
)
select * from raw_orders