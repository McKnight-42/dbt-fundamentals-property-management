with

transaction_info as (
    select * from {{ref('fct_rent_payments')}}
)
select  
    transaction_id,
    sum(rent) as total_rent,
    sum(amount) as total_amount
    

from transaction_info
group by transaction_id
having total_amount != total_rent