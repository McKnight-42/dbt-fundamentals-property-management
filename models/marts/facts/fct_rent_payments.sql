with tenants as (
    select * from {{ ref('dim_tenants') }}
),
leases as (
    select * from {{ ref('stg_leases') }}
),
units as (
    select * from {{ ref('stg_units') }}
),
transactions as (
    select * from {{ ref('stg_transactions') }}
),

final as (
    select
        leases.unit_id,
        units.rent,
        units.name

    from transactions
    left join units on transactions.amount = units.rent
    left join leases on leases.unit_id = units.unit_id
    left join tenants on tenants.lease_id = leases.lease_id
)

select * from final