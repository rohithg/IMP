with stub as (
    select
        'cust_001'::varchar as customer_id,
        'smb'::varchar as segment,
        'US'::varchar as country_code,
        current_date() - 30 as first_seen_date
)

select * from stub
