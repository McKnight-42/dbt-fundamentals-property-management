with 

property_rent as (
    select * from {{ ref('dim_properties')}}
)
select
    property_id,
    sum(rent) as total_rent
from property_rent
group by property_id
having total_rent < 0