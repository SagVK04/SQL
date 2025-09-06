create table emp(
	eid int primary key,
	ename varchar(10) not null,
	address varchar(20)
);

create table project(
	pid varchar(5) primary key,
	pname varchar(10) not null,
	location varchar(10),
	eid int,
	foreign key(eid) references emp(eid) on delete cascade
);

drop table project;

alter table emp modify eid int;

delete from emp;

insert into emp values(1,'Ravi','Chd');
insert into emp values(2,'Varun','Delhi');
insert into emp values(3,'Nitin','Pune');
insert into emp values(4,'Rabin','Bngl');
insert into emp values(5,'Ammy','Chd');

insert into project values('P1','IOT','Bangalore',1);
insert into project values('P2','Big Data','Delhi',5);
insert into project values('P3','Retail','Mumbai',3);
insert into project values('P4','Android','Hyderabad',4);

/*Find emplyoee names who are working on a project*/
select ename from emp where eid in(
	select eid from project
);

/*Find emplyoees who are working on at least one project*/
select ename,eid from emp where exists(
	select eid from emp
	where emp.eid = project.eid
);
