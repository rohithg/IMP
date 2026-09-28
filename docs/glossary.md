# Business glossary (starter)

| Term | Certified definition | Owner | Model |
|------|----------------------|-------|-------|
| Net Revenue | Settled payment amount; excludes failed and reversed auths | Finance | `sem_finance_daily.net_revenue` |
| GMV | Attempted payment amount prior to settlement filters | Finance | `sem_finance_daily.gross_merchandise_value` |
| Payment Success Rate | Settled count ÷ attempted count | Payments | `sem_finance_daily.payment_success_rate` |
| Active Customer | Customer with ≥1 settled txn that day | Growth | derived from semantic mart |
| SMB | Customer segment code `smb` | Sales Ops | `dim_customer.segment` |

Conflict rule: if Sales and Finance disagree, the glossary + PR review wins — dashboards must not redefine metrics in DAX/LOD.
