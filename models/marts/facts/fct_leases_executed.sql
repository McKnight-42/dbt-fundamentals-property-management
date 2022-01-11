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
        rental_applications.status,
        leases.start_date,
        leases.end_date,
        leases.unit_id,
        leases.completed

    from tenants
    left join leases on leases.id = tenants.lease_id
    left join rental_applications on rental_applications.rental_application_id = leases.rental_application_id
)
select * from final