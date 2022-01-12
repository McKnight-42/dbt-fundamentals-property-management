with emails as (
    select * from {{ ref('stg_emails') }}
),
email_delivery_status as (
    select * from {{ ref('stg_email_delivery_statuses') }}
),
final as (
    select
        emails.*,
        email_delivery_status.event
    
    from email_delivery_status
    left join emails on emails.email_id = email_delivery_status.email_id
)

select * from final