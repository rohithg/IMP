-- Replace with source() once warehouse landing is wired.
with stub as (
    select
        'txn_001'::varchar as transaction_id,
        'cust_001'::varchar as customer_id,
        'prod_001'::varchar as product_id,
        'card'::varchar as payment_method,
        'settled'::varchar as status,
        120.50::number(18, 2) as amount,
        current_date() as txn_date
)

select * from stub
