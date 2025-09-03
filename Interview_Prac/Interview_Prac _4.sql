/*Find details of the employee having n-th highest salary*/

create table emp4(
	id varchar(5) primary key,
	name varchar(10),
	salary int
);

insert into emp4 values ('1','Varun',10000);
insert into emp4 values ('2','Arun',20000);
insert into emp4 values ('3','Akash',20000);
insert into emp4 values ('4','Sudip',30000);
insert into emp4 values ('4','Suvo',40000);
insert into emp4 values ('4','Sagnik',50000);

select * from emp4;

/*finding 3-rd highest salary*/
select * from emp4 a where 3-1=(select count(distinct(b.salary)) from emp4 b where b.salary > a.salary);
