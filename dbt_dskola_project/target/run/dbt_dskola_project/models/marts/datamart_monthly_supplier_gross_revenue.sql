
  
    

  create  table "db_project_2"."public"."datamart_monthly_supplier_gross_revenue__dbt_tmp"
  
  
    as
  
  (
    -- models/marts/datamart_monthly_supplier_gross_revenue.sql
select
    s.company_name as supplier_name,
    imsr.month,
    imsr.total_gross_revenue
from "db_project_2"."public"."int_monthly_supplier_revenue" imsr
join "db_project_2"."public"."stg_suppliers" s
on imsr.supplier_id = s.supplier_id
order by company_name desc,  month asc
  );
  