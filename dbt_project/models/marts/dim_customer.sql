{{ config(tags=['mart', 'dimension']) }}

select
    customer_id,
    segment,
    country_code,
    first_seen_date
from {{ ref('stg_crm__customers') }}
