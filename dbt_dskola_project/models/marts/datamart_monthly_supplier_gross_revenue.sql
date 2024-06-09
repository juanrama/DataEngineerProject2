-- models/marts/datamart_monthly_supplier_gross_revenue.sql
select
    s.company_name as supplier_name,
    imsr.month,
    imsr.total_gross_revenue
from {{ ref('int_monthly_supplier_revenue') }} imsr
join {{ ref('stg_suppliers') }} s
on imsr.supplier_id = s.supplier_id
order by company_name desc,  month asc

