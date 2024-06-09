
  
    

  create  table "db_project_2"."public"."stg_categories__dbt_tmp"
  
  
    as
  
  (
    with raw_categories as (
    select
        category_id,
        category_name
    from "db_project_2"."public"."categories"
)
select * from raw_categories
  );
  