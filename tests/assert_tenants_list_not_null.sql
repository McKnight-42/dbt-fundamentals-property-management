with

tenant_info as (
    select * from {{ref('dim_tenants')}}
)
select
    tenant_id
    
from tenant_info
group by tenant_id
having count(tenant_id) < 0