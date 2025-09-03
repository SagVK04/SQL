create table emp4(
	emp_id varchar(5) primary key,
	name varchar(10),
	dept varchar(5),
	salary int
);

insert into emp4 values ('1','Ram','HR',10000);
insert into emp4 values ('2','Amit','MRKT',20000);
insert into emp4 values ('3','Sagnik','HR',30000);
insert into emp4 values ('4','Suman','MRKT',40000);
insert into emp4 values ('5','Akshay','IT',50000);
insert into emp4 values ('6', 'Priya', 'IT', 60000);
insert into emp4 values ('7', 'Deepak', 'SALES', 75000);
insert into emp4 values ('8', 'Sunita', 'HR', 55000);
insert into emp4 values ('9', 'Rahul', 'IT', 80000);
insert into emp4 values ('10', 'Neha', 'MRKT', 45000);
insert into emp4 values ('11', 'Lokesh', 'IT', 82000);
insert into emp4 values ('12', 'Mona', 'MRKT', 49000);
insert into emp4 values ('13', 'Naveen', 'HR', 73000);
insert into emp4 values ('14', 'Opal', 'IT', 90000);
insert into emp4 values ('15', 'Pradeep', 'MRKT', 56000);
insert into emp4 values ('16', 'Qadir', 'HR', 79000);
insert into emp4 values ('17', 'Ritu', 'IT', 93000);
insert into emp4 values ('18', 'Shekhar', 'MRKT', 64000);
insert into emp4 values ('19', 'Uma', 'HR', 85000);
insert into emp4 values ('20', 'Varun', 'IT', 91000);

select * from emp4;

/*finding 3-rd highest salary  from each department*/
select t.name,t.salary as "3RD Highest Salary",t.dept from (
select
    	emp4.emp_id,
    	emp4.dept,
    	emp4.name,
    	emp4.salary,
		row_number() over (partition by dept order by salary desc)
		as rankno from emp4
	) t
	where t.rankno = 3;
	
/*Display the 2nd highest salary*/
select a.name,a.salary from emp4 a where 2-1 in (
	select distinct(count(b.salary)) from emp4 b where 
	b.salary > a.salary
);

/*display all the  department names along with no. of employees working in that*/
select dept,count(emp_id) as "No. of Emplyoees" from emp4 group by dept;

/*display all the  department names along with no. of employees < 2*/
select dept,count(emp_id) as "No. of Emplyoees" from emp4 group by dept having count(emp_id) < 2;

/*display highest salary department wise along with the name of employee*/
select t.name,t.dept,t.salary from ( 
	select 
		emp4.name,
		emp4.emp_id,
		emp4.dept,
		emp4.salary,
		row_number() over (partition by emp4.dept order by emp4.salary desc) as sal_rank
		from emp4
	) t
	where t.sal_rank = 1;
	
	select dept,max(salary) as "Highest Salary" from emp4 group by dept order by max(salary) desc;
