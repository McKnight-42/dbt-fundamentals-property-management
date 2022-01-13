select 
    id as email_delivery_status_id,
    created_at,
    event,
    email_id,
    uploaded_at

from {{source('property_management','email_delivery_statuses')}}