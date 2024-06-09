with raw_categories as (
    select
        category_id,
        category_name
    from {{ source('raw','categories') }}
)
select * from raw_categories