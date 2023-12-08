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

select last_name, 12*salary*commission_pct -- null값이 포함되어 있으면 결과값도 무조건 null로 나옴
from employees;

select last_name, 12*salary*NVL(commission_pct, 1)
from employees;

select last_name as name, commission_pct comm
from employees;

select last_name as "Name", salary*12 "Annual Salary"
from employees;

select last_name as 이름, commission_pct 보너스
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
where salary between 3500 and 2500; -- 논리적 오류

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
where hire_date like '05%'; -- 2005년 입사자

select last_name
from employees
where last_name like '_o%'; -- 한문자 대체

select employee_id, last_name, job_id
from employees
where job_id like '%SA_%'; -- 대체문자로 인식

select employee_id, last_name, job_id
from employees
where job_id like '%SA\_%' escape '\'; -- 문자로 인식시키겠다

select *
from employees
where commission_pct is null; -- commission_pct = null 은 문법오류

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

/* 1. 급여가 12,000를 넘는 사원의 이름과 급여를 표시하는 질의를 실행하시오. */
select last_name, salary
from employees
where salary > 12000;

/* 2. 사원 번호가 176인 사원의 이름과 부서 번호를 표시하는 질의를 실행하시오. */
select last_name, department_id
from employees
where employee_id = 176; -- employee_id in (176)

/* 3. 급여가 5,000에서 12,000 사이에 포함되지 않는 모든 사원의 이름과 급여를 표시하도록 질의를 실행하시오. */
select last_name, salary
from employees
where salary not between 5000 and 12000;

/* 6. 급여가 5,000와 12,000 사이이고 부서 번호가 20 또는 50인 사원의 이름과 급여를 나열하도록 질의를 작성하시오. 
   열 레이블은 Employee와 Monthly Salary로 각각 지정하시오. */
select last_name as "Employee", salary "Monthly Salary"
from employees
where salary between 5000 and 12000
and department_id in (20 , 50);

/* 7. 2014년에 입사한 모든 사원의 이름과 입사일을 표시하시오. */
select last_name, hire_date
from employees
where hire_date like '05%'; -- between '05/01/01' and '05/12/31';

/* 8. 관리자가 없는 모든 사원의 이름과 업무를 표시하시오. */
select last_name, job_id
from employees
where manager_id is null;

/* 10. 이름의 세번째 문자가 a인 모든 사원의 이름을 표시하시오. */
select last_name
from employees
where last_name like '__a%';

/* 11. 이름에 a와 e가 있는 모든 사원의 이름을 표시하시오. */
select last_name
from employees
where last_name like '%a%'
and last_name like '%e%';

/* 12. 업무가 영업 사원(SA_REP) 또는 사무원(ST_CLERK)이면서 
    급여가 2,500, 3,500, 7,000이 아닌 모든 사원의 이름, 업무 및 급여를 표시하시오. */
select last_name, job_id, salary
from employees
where job_id in ('SA_REP', 'ST_CLERK')
and salary not in (2500, 3500, 7000);

/* 13. 커미션 비율(commission_pct)이 20%인 모든 사원의 이름, 급여 및 커미션을 표시하도록 
    명령문을 작성하여 실행하시오. */
select last_name, salary, commission_pct
from employees
where commission_pct = 0.2; -- .2


/* 20231208 */
select last_name, job_id, department_id, hire_date
from employees
order by hire_date;

select last_name, job_id, department_id, hire_date
from employees
order by hire_date desc; -- 내림차순

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
where employee_id = &employee_num; -- 한번쓰고 버려지는 변수

select employee_id, last_name, job_id, &column_name
from employees
where &condition
order by &order_colunm;

select employee_id, last_name, job_id, &&column_name -- 변수를 영구적으로 저장, 계속 사용 가능
from employees
order by &column_name;

select employee_id, salary
from employees
order by &column_name;

undefine column_name; -- && 값을 지울 때

/* 집합연산자 */
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

/* 함수 */
desc dual;

select *
from dual;

select sysdate
from dual;

/* 문자함수 */
select 'The job id for '||upper(last_name)||' is ' ||lower(job_id) as "EMPLOYEE DETAILS"
from employees;

select employee_id, last_name, department_id
from employees
where lower(last_name) = 'higgins';

/* substr */
-- select last_name, substr(last_name, 2, 2)  -- 앞에서부터 2글자 잘라내라
select last_name, substr(last_name, -3, 2)  -- 뒤에서부터 2글자 잘라내라
from employees
where department_id = 90;

select employee_id, concat(first_name, last_name) name, job_id, length(last_name), instr(last_name, 'a') "contains 'a'?"
from employees
where substr(job_id, 4) = 'REP';

select ltrim('yyedamy', 'yea')
from dual;

select rtrim('yyedamy', 'yea')
from dual;

/* 숫자함수 */
select round(345.678) as round1,
       round(345.678, 0) as round2, -- round1과 동일
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

/* 1. 현재 날짜를 표시하는 질의를 작성하고 열 레이블을 Date로 지정하시오. */
select sysdate "Date"
from dual;

/* 2. 각 사원에 대해 사원 번호, 이름, 급여 및 15% 인상된 급여를 정수로 표시하시오. 인상된 급여 열의 레이블을 New Salary로 지정하시오.  */
select employee_id, last_name, salary, round(salary*1.15) "New Salary"
from employees;

/* 3. 2번 질의를 수정하여 새 급여에서 이전 급여를 빼는 새 열을 추가하고 레이블을 Increase로 지정하고 수정한 질의를 실행하시오. */
select employee_id, last_name, salary, salary*1.15 "New Salary", round(salary*1.15) - salary "Increase"
from employees;

/* 4. 이름이 J, A 또는 M으로 시작하는 모든 사원의 이름(대문자 표시) 및 이름 길이를 표시하는 질의를 작성하고 각열에 적합한 레이블을 지정하시오. 결과를 사원의 이름에 따라 정렬하시오. */
select upper(last_name) "Name", length(last_name) "Name Length"
from employees
where upper(substr(last_name, 1, 1)) in ('J', 'A', 'M')
order by last_name; -- 1
