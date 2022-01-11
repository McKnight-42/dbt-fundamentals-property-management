select
    id,
    created_at,
    contact_info_id,
    bank_account_id,
    move_in_date,
    move_out_date,
    notice_date,
    lease_id,
    uploaded_at

from {{source('property_management','tenants')}}