{{ config(tags=['semantic', 'certified']) }}

/*
  Certified semantic exposure for Finance dashboards.
  Downstream tools (Power BI / Tableau / MetricFlow) should bind here.
*/

select
    f.metric_date,
    f.customer_id,
    c.segment as customer_segment,
    c.country_code,
    f.payment_method,
    f.settled_amount as net_revenue,
    f.attempted_amount as gross_merchandise_value,
    f.transaction_count,
    f.settled_count,
    iff(f.transaction_count = 0, null, f.settled_count / f.transaction_count)
        as payment_success_rate
from {{ ref('fct_daily_revenue') }} f
left join {{ ref('dim_customer') }} c using (customer_id)
