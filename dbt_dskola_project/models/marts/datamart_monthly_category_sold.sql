-- models/marts/datamart_monthly_category_sold.sql
with category_ranked as (
    select
        ics.category_id,
        c.category_name,
        ics.month,
        ics.total_quantity,
        row_number() over (partition by ics.month order by ics.total_quantity desc) as rank
    from {{ ref('int_monthly_category_sales') }} ics
    join {{ ref('stg_categories') }} c
    on ics.category_id = c.category_id
)
select
    category_name,
    month,
    total_quantity
from category_ranked
where rank = 1
order by month asc
