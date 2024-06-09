
  
    

  create  table "db_project_2"."public"."stg_order_details__dbt_tmp"
  
  
    as
  
  (
    -- models/staging/stg_order_details.sql
with raw_order_details as (
    select
        order_id,
        product_id,
        unit_price,
        quantity,
        discount
    from "db_project_2"."public"."order_details"
)
select * from raw_order_details
  );
  