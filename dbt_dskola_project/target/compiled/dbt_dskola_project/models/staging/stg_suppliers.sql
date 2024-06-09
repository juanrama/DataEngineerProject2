with raw_suppliers as (
    select
        supplier_id,
        company_name
    from "db_project_2"."public"."suppliers"
)
select * from raw_suppliers