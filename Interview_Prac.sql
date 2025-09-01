create table emp(
	name varchar(10),
	age int,
	salary int
);

insert into emp values ('Sagnik',20,10000);
insert into emp values ('Arnab',21,20000);

select * from emp

select emp.*,rowid from emp;

select name,min(rowid) from emp group by name;

delete from emp where rowid not in ( select min(rowid) from emp group by name );
