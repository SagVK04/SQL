/*Find customers who didn't order*/

create table customer(
	id varchar(5) primary key,
	name varchar(10),
	address varchar(10)
);

insert into customer values ('1','Varun','Delhi');
insert into customer values ('2','Arun','Mumbai');
insert into customer values ('3','Akash','Kolkata');
insert into customer values ('4','Sudip','Chennai');

select * from customer;

create table cus_order(
	invoice_no varchar(5) primary key,
	customer_id varchar(5),
	foreign key(customer_id) references customer(id) on delete cascade
);

insert into cus_order values ('O1','1');
insert into cus_order values ('O2','2');

select * from cus_order;

select * from customer where id not in(select distinct(customer_id) from cus_order);
