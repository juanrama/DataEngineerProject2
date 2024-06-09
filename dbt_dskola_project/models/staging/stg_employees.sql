with raw_employees as (
    select
        employee_id,
        first_name,
        last_name,
        (first_name || ' ' || last_name) as employee_name
    from {{ source('raw','employees') }}
)
select * from raw_employees