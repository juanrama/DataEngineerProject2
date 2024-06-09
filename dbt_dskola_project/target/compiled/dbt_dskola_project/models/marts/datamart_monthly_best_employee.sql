-- models/marts/datamart_monthly_best_employee.sql
with employee_ranked as (
    select
        ie.employee_id,
        e.employee_name,
        ie.month,
        ie.total_gross_revenue,
        row_number() over (partition by ie.month order by ie.total_gross_revenue desc) as rank
    from "db_project_2"."public"."int_monthly_employee_revenue" ie
    join "db_project_2"."public"."stg_employees" e
    on ie.employee_id = e.employee_id
)
select
    employee_name,
    month,
    total_gross_revenue
from employee_ranked
where rank = 1
order by month asc