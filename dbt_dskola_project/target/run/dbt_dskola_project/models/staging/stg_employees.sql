
  
    

  create  table "db_project_2"."public"."stg_employees__dbt_tmp"
  
  
    as
  
  (
    with raw_employees as (
    select
        employee_id,
        first_name,
        last_name,
        (first_name || ' ' || last_name) as employee_name
    from "db_project_2"."public"."employees"
)
select * from raw_employees
  );
  