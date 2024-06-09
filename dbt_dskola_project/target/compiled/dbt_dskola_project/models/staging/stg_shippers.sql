with raw_shippers as (
    select
        shipper_id,
        company_name
    from "db_project_2"."public"."shippers"
)
select * from raw_shippers