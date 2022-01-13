with rental_applications as (
    select * from {{ ref('stg_rental_applications') }}
),
tenants as (
    select * from {{ ref('dim_tenants') }}
),
leases as (
    select * from {{ ref('stg_leases')}}
),
final as (
    select
        tenants.*,
        leases.unit_id,
        rental_applications.status,
        leases.start_date,
        leases.end_date,
        leases.completed

    from tenants
    left join leases on leases.lease_id = tenants.lease_id
    left join rental_applications on rental_applications.rental_application_id = leases.rental_application_id
)
select * from final