with

email_info as (
    select * from {{ref('fct_emails_delivered')}}
)
select  
    email_id 

from email_info
group by email_id
having count(email_id) < 0