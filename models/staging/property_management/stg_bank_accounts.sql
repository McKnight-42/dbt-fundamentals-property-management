select
    id,
    created_at,
    name,
    bank_account_number,
    routing_number,
    uploaded_at

from {{ source('property_management','bank_accounts')}}
