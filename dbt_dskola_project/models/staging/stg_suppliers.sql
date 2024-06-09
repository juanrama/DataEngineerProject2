with raw_suppliers as (
    select
        supplier_id,
        company_name
    from {{ source('raw','suppliers') }}
)
select * from raw_suppliers