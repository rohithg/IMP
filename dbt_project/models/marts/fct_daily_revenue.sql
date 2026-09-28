{{ config(tags=['mart', 'finance']) }}

select
    t.txn_date as metric_date,
    t.customer_id,
    t.product_id,
    t.payment_method,
    sum(case when t.status = 'settled' then t.amount else 0 end) as settled_amount,
    sum(t.amount) as attempted_amount,
    count(*) as transaction_count,
    count_if(t.status = 'settled') as settled_count
from {{ ref('stg_payments__transactions') }} t
group by 1, 2, 3, 4
