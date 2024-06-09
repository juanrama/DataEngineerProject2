with raw_shippers as (
    select
        shipper_id,
        company_name
    from {{ source('raw','shippers') }}
)
select * from raw_shippers