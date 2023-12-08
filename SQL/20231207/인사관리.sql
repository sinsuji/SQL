desc departments;

select *
from employees;

select *
from departments;

select department_id, location_id
from departments;

select location_id, department_id
from departments;

select department_id, department_id
from departments;

select last_name, salary, salary + 300
from employees;

select last_name, salary, 12*salary+100
from employees;

select last_name, salary, 12*(salary+100)
from employees;

select last_name, job_id, salary, commission_pct
from employees;

select last_name, 12*salary*commission_pct -- null���� ���ԵǾ� ������ ������� ������ null�� ����
from employees;

select last_name, 12*salary*NVL(commission_pct, 1)
from employees;

select last_name as name, commission_pct comm
from employees;

select last_name as "Name", salary*12 "Annual Salary"
from employees;

select last_name as �̸�, commission_pct ���ʽ�
from employees;

select last_name||job_id as "Employees"
from employees;

select last_name|| ' is a ' ||job_id as "Employees"
from employees;

select department_id
from employees;

select distinct department_id
from employees;

select distinct department_id, job_id
from employees;

desc departments;

select *
from departments;

desc employees;
select employee_id, last_name, job_id, hire_date as STARTDATE
from employees;

select distinct job_id
from employees;

select employee_id as "Emp #", last_name "Employess", job_id "Job", hire_date "Hire Date"
from employees;

select job_id|| ', ' ||last_name "Employee and Title"
from employees;

select employee_id, last_name, job_id, department_id
from employees
where department_id = 90;

select last_name, job_id, department_id
from employees
where last_name = 'Whalen';

select last_name
from employees
where hire_date = '05/10/10'; -- 17-FEB-96   yy/mm/dd

select last_name, salary
from employees
where salary <= 3000;

select last_name, hire_date
from employees
where hire_date < '05/01/01'; -- <= '04/12/31';

select last_name, salary
from employees
where salary between 2500 and 3500;


select last_name, salary
from employees
where salary between 3500 and 2500; -- ���� ����

select employee_id, last_name, salary, manager_id
from employees
where manager_id IN (100, 101, 201);

select first_name
from employees
where first_name like 'S%';

select last_name
from employees
where last_name Like '%s';

select last_name, hire_date
from employees
where hire_date like '05%'; -- 2005�� �Ի���

select last_name
from employees
where last_name like '_o%'; -- �ѹ��� ��ü

select employee_id, last_name, job_id
from employees
where job_id like '%SA_%'; -- ��ü���ڷ� �ν�

select employee_id, last_name, job_id
from employees
where job_id like '%SA\_%' escape '\'; -- ���ڷ� �νĽ�Ű�ڴ�

select *
from employees
where commission_pct is null; -- commission_pct = null �� ��������

select employee_id, last_name, job_id, salary
from employees
where salary >= 10000
and job_id like '%MAN%';

select last_name, job_id
from employees
where job_id not in ('IT_PROG', 'ST_CLERK', 'SA_REP');

select last_name, job_id, salary
from employees
where job_id = 'SA_REP'
or job_id = 'AD_PRES'
and salary > 15000;

select last_name, job_id, salary
from employees
where (job_id = 'SA_REP'
or job_id = 'AD_PRES')
and salary > 15000;

/* 1. �޿��� 12,000�� �Ѵ� ����� �̸��� �޿��� ǥ���ϴ� ���Ǹ� �����Ͻÿ�. */
select last_name, salary
from employees
where salary > 12000;

/* 2. ��� ��ȣ�� 176�� ����� �̸��� �μ� ��ȣ�� ǥ���ϴ� ���Ǹ� �����Ͻÿ�. */
select last_name, department_id
from employees
where employee_id = 176; -- employee_id in (176)

/* 3. �޿��� 5,000���� 12,000 ���̿� ���Ե��� �ʴ� ��� ����� �̸��� �޿��� ǥ���ϵ��� ���Ǹ� �����Ͻÿ�. */
select last_name, salary
from employees
where salary not between 5000 and 12000;

/* 6. �޿��� 5,000�� 12,000 �����̰� �μ� ��ȣ�� 20 �Ǵ� 50�� ����� �̸��� �޿��� �����ϵ��� ���Ǹ� �ۼ��Ͻÿ�. 
   �� ���̺��� Employee�� Monthly Salary�� ���� �����Ͻÿ�. */
select last_name as "Employee", salary "Monthly Salary"
from employees
where salary between 5000 and 12000
and department_id in (20 , 50);

/* 7. 2014�⿡ �Ի��� ��� ����� �̸��� �Ի����� ǥ���Ͻÿ�. */
select last_name, hire_date
from employees
where hire_date like '05%'; -- between '05/01/01' and '05/12/31';

/* 8. �����ڰ� ���� ��� ����� �̸��� ������ ǥ���Ͻÿ�. */
select last_name, job_id
from employees
where manager_id is null;

/* 10. �̸��� ����° ���ڰ� a�� ��� ����� �̸��� ǥ���Ͻÿ�. */
select last_name
from employees
where last_name like '__a%';

/* 11. �̸��� a�� e�� �ִ� ��� ����� �̸��� ǥ���Ͻÿ�. */
select last_name
from employees
where last_name like '%a%'
and last_name like '%e%';

/* 12. ������ ���� ���(SA_REP) �Ǵ� �繫��(ST_CLERK)�̸鼭 
    �޿��� 2,500, 3,500, 7,000�� �ƴ� ��� ����� �̸�, ���� �� �޿��� ǥ���Ͻÿ�. */
select last_name, job_id, salary
from employees
where job_id in ('SA_REP', 'ST_CLERK')
and salary not in (2500, 3500, 7000);

/* 13. Ŀ�̼� ����(commission_pct)�� 20%�� ��� ����� �̸�, �޿� �� Ŀ�̼��� ǥ���ϵ��� 
    ��ɹ��� �ۼ��Ͽ� �����Ͻÿ�. */
select last_name, salary, commission_pct
from employees
where commission_pct = 0.2; -- .2


/* 20231208 */
select last_name, job_id, department_id, hire_date
from employees
order by hire_date;

select last_name, job_id, department_id, hire_date
from employees
order by hire_date desc; -- ��������

select employee_id, last_name, salary*12 annsal
from employees
order by annsal;

select last_name, job_id, department_id, hire_date
from employees
order by 3; -- department_id;

select last_name, department_id, salary
from employees
order by department_id, salary desc;

select employee_id, salary
from employees
order by hire_date;

select employee_id, last_name, salary, department_id
from employees
where employee_id = &employee_num; -- �ѹ����� �������� ����

select employee_id, last_name, job_id, &column_name
from employees
where &condition
order by &order_colunm;

select employee_id, last_name, job_id, &&column_name -- ������ ���������� ����, ��� ��� ����
from employees
order by &column_name;

select employee_id, salary
from employees
order by &column_name;

undefine column_name; -- && ���� ���� ��

/* ���տ����� */
select *
from job_history;

/* union */
select employee_id, job_id
from employees
union
select employee_id, job_id
from job_history;

/* union all */
select employee_id, job_id, department_id
from employees
union all
select employee_id, job_id, department_id
from job_history
order by employee_id;

/* intersect */
select employee_id, job_id
from employees
intersect
select employee_id, job_id
from job_history;

select employee_id, job_id
from job_history
intersect
select employee_id, job_id
from employees;

/* minus */
select employee_id, job_id
from employees
minus
select employee_id, job_id
from job_history;

select employee_id, job_id
from job_history
minus
select employee_id, job_id
from employees;

/* �Լ� */
desc dual;

select *
from dual;

select sysdate
from dual;

/* �����Լ� */
select 'The job id for '||upper(last_name)||' is ' ||lower(job_id) as "EMPLOYEE DETAILS"
from employees;

select employee_id, last_name, department_id
from employees
where lower(last_name) = 'higgins';

/* substr */
-- select last_name, substr(last_name, 2, 2)  -- �տ������� 2���� �߶󳻶�
select last_name, substr(last_name, -3, 2)  -- �ڿ������� 2���� �߶󳻶�
from employees
where department_id = 90;

select employee_id, concat(first_name, last_name) name, job_id, length(last_name), instr(last_name, 'a') "contains 'a'?"
from employees
where substr(job_id, 4) = 'REP';

select ltrim('yyedamy', 'yea')
from dual;

select rtrim('yyedamy', 'yea')
from dual;

/* �����Լ� */
select round(345.678) as round1,
       round(345.678, 0) as round2, -- round1�� ����
       round(345.678, 1) as round3,
       round(345.678, -1) as round4
from dual;

select trunc(345.678) as trunc1,
       trunc(345.678, 0) as trunc2,
       trunc(345.678, 1) as trunc3,
       trunc(345.678, -1) as trunc4
from dual;

select last_name, salary, mod(salary, 5000)
from employees;

/* 1. ���� ��¥�� ǥ���ϴ� ���Ǹ� �ۼ��ϰ� �� ���̺��� Date�� �����Ͻÿ�. */
select sysdate "Date"
from dual;

/* 2. �� ����� ���� ��� ��ȣ, �̸�, �޿� �� 15% �λ�� �޿��� ������ ǥ���Ͻÿ�. �λ�� �޿� ���� ���̺��� New Salary�� �����Ͻÿ�.  */
select employee_id, last_name, salary, round(salary*1.15) "New Salary"
from employees;

/* 3. 2�� ���Ǹ� �����Ͽ� �� �޿����� ���� �޿��� ���� �� ���� �߰��ϰ� ���̺��� Increase�� �����ϰ� ������ ���Ǹ� �����Ͻÿ�. */
select employee_id, last_name, salary, salary*1.15 "New Salary", round(salary*1.15) - salary "Increase"
from employees;

/* 4. �̸��� J, A �Ǵ� M���� �����ϴ� ��� ����� �̸�(�빮�� ǥ��) �� �̸� ���̸� ǥ���ϴ� ���Ǹ� �ۼ��ϰ� ������ ������ ���̺��� �����Ͻÿ�. ����� ����� �̸��� ���� �����Ͻÿ�. */
select upper(last_name) "Name", length(last_name) "Name Length"
from employees
where upper(substr(last_name, 1, 1)) in ('J', 'A', 'M')
order by last_name; -- 1
