select
    id as email_id,
    created_at,
    sent_at,
    subject,
    body,
    delivered_at,
    uploaded_at

from {{ source('property_management','emails') }}