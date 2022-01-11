select
    id,
    created_at,
    deleted_at,
    type,
    amount,
    payer,
    payee,
    uploaded_at

from {{ source('property_management','transactions')}}