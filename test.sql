select 
    job, avg(sal)
from 
    emp
where 
    job <> 'MANAGER'
group by
    job
having
    avg(sal) > 1500
order by 
    avg(sal) desc
