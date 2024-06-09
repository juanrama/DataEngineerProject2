
  
    

  create  table "db_project_2"."public"."stg_suppliers__dbt_tmp"
  
  
    as
  
  (
    with raw_suppliers as (
    select
        supplier_id,
        company_name
    from "db_project_2"."public"."suppliers"
)
select * from raw_suppliers
  );
  