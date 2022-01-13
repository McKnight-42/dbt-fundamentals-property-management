select
    id as owner_id,
    created_at,
    contact_info_id,
    bank_account_id,
    uploaded_at

from {{ source('property_management','owners')}}