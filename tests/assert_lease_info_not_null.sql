with

lease_info as (
    select * from {{ref('fct_leases_executed')}}
)
select
    tenant_id
from lease_info
group by tenant_id
having count(tenant_id) < 0