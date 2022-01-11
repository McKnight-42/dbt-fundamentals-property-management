with tenants as (
    select * from {{ ref('stg_tenants')}}
),
bank_accounts as (
    select * from {{ ref('stg_bank_accounts') }}
),
contact_infos as (
    select * from {{ ref('stg_contact_infos') }}
),
final as (
    select
        tenants.*,
        bank_accounts.bank_account_number,
        bank_accounts.routing_number,
        contact_infos.first_name,
        contact_infos.last_name,
        contact_infos.email_address,
        contact_infos.phone_number

    from tenants
    left join bank_accounts on tenants.bank_account_id = bank_accounts.id 
    left join contact_infos on tenants.contact_info_id = contact_infos.id
)

select * from final