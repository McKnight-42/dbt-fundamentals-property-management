select
    id,
    created_at,
    unit_id,
    start_date,
    end_date,
    rental_application_id,
    completed,
    uploaded_at

from {{ source('property_management','leases') }}