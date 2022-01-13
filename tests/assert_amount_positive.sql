with 
transaction_info as (
    select * from {{ref('fct_total_transactions')}}
)
select
    id,
    sum(amount) as total_amount

from transaction_info
group by id
having total_amount < 0