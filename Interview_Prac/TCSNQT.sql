create table employees(
    Empid int primary key,
    Name VARCHAR(50),
    Dept varchar(50),
    salary int
);
insert into EMPLOYEES values(1,'Alice','HR',50000);
insert into EMPLOYEES values(2,'Bob','IT',60000);
insert into EMPLOYEES values(3,'Charlie','IT',70000);
insert into EMPLOYEES values(4,'David','HR',45000);
insert into EMPLOYEES values(5,'Eve','Finance',55000);
insert into EMPLOYEES values(6,'Evelyn','R&D',55000);
select * from EMPLOYEES;

create table Departments(
    DeptID int primary key,
    Deptname varchar(50)
);
insert into DEPARTMENTS values(1,'HR');
insert into DEPARTMENTS values(2,'IT');
insert into DEPARTMENTS values(3,'Finance');
insert into DEPARTMENTS values(4,'Sales');

/*Q1. Get All Employee Records*/
SELECT * from Employees;
select Dept,Name from Employees;

/*Q2. Get names of employees from IT Dept*/
select Name from Employees where Dept = 'IT';
select Name from Employees where Dept = 'HR';

/*Q2. Get names of employees where salary more than 50000*/
select Name,Salary  from employees where salary>50000;

/*Q2. Count number of employees in each department*/
select Dept,count(*) as "Number of employees" from employees group by Dept;

/*Q2. Get max salary from each department*/
select Dept,max(salary) as "Maximum Salary" from employees group by Dept;

/*Q2. Get names of employees along with the department IDs in ascending
order where deptID > 1*/
select e.Name,d.DEPTID,d.Deptname from Employees e
inner join Departments d
on e.Dept = d.Deptname 
where d.deptID > 1
order by d.DeptID asc;

/*Q2. Get names of employees with no valid departments*/
select Name,Dept from
employees where
Dept not in (
    select Deptname  
    from Departments
);

/*Q2. Get names of employees of top 3 highespt paid salaries*/
select * from (
    select Name,Salary 
    from employees 
    order by Salary desc 
)
where rownum <= 3;

/*Q2. Get names of employees whose salary in between 50k-60k*/
select Name,Salary from Employees where Salary between 50000 and 60000;

/*Q2. Get names of departments having more than one employees*/
select Dept,count(*) as "No. of employees"
from Employees
group by Dept
having count(*)>1;

/*Q2. Get average salary*/
select avg(Salary) from Employees;

/*Q2. Get names of employees getting more than average salary*/
select Name,Salary 
from Employees where 
Salary > (
    select avg(Salary) from Employees
);

/*Q2. Get department with highest paid total salary*/
select * from (
    select Dept,sum(Salary) as "Total Salary"
    from Employees 
    group by Dept
    order by sum(salary) desc
)
where rownum = 1; 

/*Q2. Get names of highest paid employees in each department*/
select Name,Salary,Dept 
from(
    select 
    Name,
    Salary,
    Dept,
    rank() over (
        partition by Dept
        order by salary desc 
    ) as salary_rank
    from employees
)
where salary_rank=1;

/*Q2. Get names of employees having highest salary overall*/
select Name,Salary 
from EMPLOYEES
where salary = (
    select max(salary) from EMPLOYEES
);

/*Q2. Rank employees by salary in each department*/
select Name,Salary,Dept,sal_rank from (
    select 
    Name,
    Salary,
    Dept,
    rank() over (
        partition by Dept
        order by salary desc
    ) as sal_rank
    from employees
);

/*Q2. Get cumulative salary for each dept*/
select Dept,Salary,
Sum(Salary) over(
    partition by Dept
    order by Salary
) as Cu_Sal
from employees;


/*Q2. Get dept listed in Employees but not in Departments*/
select distinct(Deptname) 
from Departments 
where Deptname not in(
    select Dept from EMPLOYEES
);

/*Q2. Get names of employees starts with 'A'*/
select * from employees where Name like 'A%';

/*Q2. Find second highest salary*/
select max(Salary)
from EMPLOYEES WHERE
Salary not in(
    select max(Salary)
    from employees
);

/*Q2. Get names of employee with n-th highest salary*/
select distinct(a.Salary) from employees a
where 2-1 in (
    select count(distinct(b.Salary)) from EMPLOYEES b
    where b.Salary > a.Salary
);

/*Q2. Order Employees by Department and then Salary Descending*/
select * from EMPLOYEES
order by Dept,Salary desc;/*desc applied on on salary grouped by dept, dept is in ascending order*/

/*Q2. Select unique departments across employees and departments table */
select Dept from Employees union select Deptname from Departments;

/*Q2. List of departments where no employee works*/
SELECT distinct(a.deptname)
from departments a 
left join employees b
on a.deptname = b.dept
where b.dept is null;
/*OR*/
select deptname from DEPARTMENTS
WHERE deptname not in (
    select distinct(Dept) from Employees
);