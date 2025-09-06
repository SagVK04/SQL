create table emp(
	eid int primary key,
	ename varchar(10) not null,
	address varchar(20)
);

create table dept(
	Did int primary key,
	Dname varchar(10) not null,
	eid int,
	foreign key(eid) references emp(eid) on delete cascade
);

alter table dept modify Did varchar(5);

insert into emp values(1,'A','Delhi');
insert into emp values(2,'B','Pune');
insert into emp values(3,'A','Chd');
insert into emp values(4,'B','Delhi');
insert into emp values(5,'C','Pune');
insert into emp values(6,'D','Mumbai');
insert into emp values(7,'E','Hyderabad');

insert into dept values('D1','HR',1);
insert into dept values('D2','IT',2);
insert into dept values('D3','MRKT',3);
insert into dept values('D4','TESTING',4);

/*Find emplyoees who are working in a department*/
/*1 - Using Join*/
select a.ename as "NAME",a.eid as "ID",b.Dname as "DEPARTMENT" 
    from emp a  inner join dept b 
    	on a.eid = b.eid; 
/*2 - Using Nested Subquery*/ 
select emp.ename as "NAME", emp.eid as "ID" 
	from emp where emp.eid in (
    	select eid from dept
    );
/*3 - Using Co-related Subquery*/
select emp.ename,emp.eid 
    from emp where exists(
    	select eid from dept where dept.eid = emp.eid
    );
