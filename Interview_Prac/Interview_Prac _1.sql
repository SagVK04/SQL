/*Find top 3 Salaries in Each Department*/

create table emp1(
	id varchar(5) primary key,
	dept varchar(10),
	salary int
);

insert into emp1 values (101,'IT',10000);
insert into emp1 values (201,'IT',20000);
insert into emp1 values (301,'IT',30000);
insert into emp1 values (401,'IT',40000);
insert into emp1 values (501,'HR',50000);
insert into emp1 values (601,'HR',15000);
insert into emp1 values (701,'HR',25000);
insert into emp1 values (801,'HR',35000);

select * from emp1;

select e.*,row_number() over (partition by dept order by salary desc) as rn from emp1 e;

select * from( select e.*,row_number() over (partition by dept order by salary desc) as rn 
    from emp1 e ) t 
where t.rn <=3;
