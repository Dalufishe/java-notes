select
    ename,
    job,
    sal as oldsal
(
case job
when 'MANAGER' then sal * 1.1
when 'SALESMAN' then sal * 1.5
else sal
end
) as newsal
from emp;