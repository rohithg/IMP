# Architecture

```
Raw payments / CRM
        │
        ▼
   staging (stg_*)
        │
        ▼
     marts (fct_*, dim_*)
        │
        ▼
 semantic (sem_*)  ←── metrics/*.yml  ←── Power BI / Tableau
        │
        └── glossary.md (human contract)
```

Goal: cut ad-hoc request volume by giving stakeholders one trustworthy path.
