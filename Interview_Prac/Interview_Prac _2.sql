/*Find Employees taking more salary than their manager*/

create table emp2(
	id varchar(5) primary key,
	name varchar(10),
	salary int,
	manager_id varchar(5)
);

insert into emp2 values ('1','A',10000,'2');
insert into emp2 values ('2','B',20000,null);
insert into emp2 values ('3','C',30000,'2');

select * from emp2;

select a.* from emp2 a inner join emp2 b on a.manager_id = b.id;

select * from emp2 a inner join emp2 b on a.manager_id = b.id where a.salary>b.salary;
