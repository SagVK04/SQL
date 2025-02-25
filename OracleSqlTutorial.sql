create table emp( 
    id int, 
    name varchar2(30), 
    sal number(10) 
)
desc emp1;
alter table emp add address varchar2(30);
alter table emp drop column address;
alter table emp modify id varchar2(10); 
alter table emp rename column id to roll_no;
alter table emp rename to emp1;
alter table emp1 add primary key(roll_no); /*emp -> emp1*/
insert into emp1 values('CSE22008','Sagnik',10000);
insert into emp1 values('CSE22007','A',17000);
insert into emp1 values('CSE22055','B',19000);
insert into emp1 values('CSE22011','C',125000);
select * from emp1;
update emp1 set name='D' where name='Sagnik';
update emp1 set sal=sal*2 where name='D';
