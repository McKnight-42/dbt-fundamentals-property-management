select
    id,
    created_at,
    first_name,
    last_name,
    email_address,
    phone_number,
    uploaded_at

from {{ source('property_management','contact_infos')}}