with

vendor_info as (
    select * from {{ref('dim_vendors')}}
)
select
    vendor_id
    
from vendor_info
group by vendor_id
having count(vendor_id) < 0