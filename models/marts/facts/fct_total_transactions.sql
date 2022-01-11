with transactions as (
    select * from {{ ref('stg_transactions') }}
),
payments as (
    select * from {{ ref('stg_payments') }}
),
total_transactions as (
    select
        order_id,
        sum(case when status = 'success' then amount end ) as amount
    from payments
    group by 1
),

final as (
    select
        transactions.type,
        transactions.payer,
        transactions.payee,
        coalesce(total_transactions.amount,0) as amount
        
    from transactions
    left join total_transactions on transactions.id = total_transactions.order_id
)

select * from final