-- models/staging/stg_products.sql
with raw_products as (
    select
        product_id,
        product_name,
        supplier_id,
        category_id,
        unit_price,
        units_in_stock
    from "db_project_2"."public"."products"
)
select * from raw_products