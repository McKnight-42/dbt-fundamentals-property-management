with

owner_info as (
    select * from {{ref('dim_owners')}}
)

select
    count(owner_id) as total_owners 
    
from owner_info
having total_owners < 0
