create table customer(
	cid varchar(5) primary key check (cid like 'C%'),
	cname varchar(10) not null
);
alter table customer add constraint c1 check (cid like 'C%');
create table branch(
	bcode varchar(4) primary key check(bcode like 'B%'),
	bname varchar(10) not null
);
create table account(
	ano varchar(5) primary key check(ano like 'A%'),
	atype char(1) check (atype in('S','C')),
	balance decimal(10,2),
	cid varchar(5),
	foreign key (cid) references customer(cid) on delete cascade,
	bcode varchar(4),
	foreign key (bcode) references branch(bcode) on delete cascade
);
create table transaction(
	tid varchar(5) primary key check(tid like 'T%'),
	ano varchar(50),
	foreign key (ano) references account(ano) on delete cascade,
	ttype char(1) check(ttype in('W','D')),
	tdate date,
	tamount decimal(10,2)
);

/*2*/
insert into customer values('C0001','Ramesh');
insert into customer values('C0002','Kiran');
insert into customer values('C0003','Ravi');
insert into customer values('C0004','Zaheer');
insert into customer values('C0005','Thomas');
insert into customer values('C0006','Jatin');

insert into branch values('B001','Kolaghat');
insert into branch values('B002','Bagnan');
insert into branch values('B003','Tamluk');
insert into branch values('B004','Midnapur');
insert into branch values('B005','Panskura');


insert into account values('A0001','S',12004.50,'C0003','B002');
insert into account values('A0002','S',48000.00,'C0001','B002');
insert into account values('A0003','C',25000.00,'C0003','B002');
insert into account values('A0004','S',8750.75,'C0004','B001');
insert into account values('A0005','S',2000.00,'C0005','B004');
insert into account values('A0006','C',120000.00,'C0005','B004');
insert into account values('A0007','C',85025.25,'C0002','B003');
insert into account values('A0008','S',110011.50,'C0002','B001');
insert into account values('A0009','S',5000.50,'C0004','B003');
insert into account values('A0010','C',35000.00,'C0001','B004');
insert into account values('A0011','S',4500.00,'C0001','B005');
insert into account values('A0012','C',98050.75,'C0006','B004');
select * from account;

insert into transaction values('T0001','A0003','W',STR_TO_DATE('2021-12-22','%Y-%m-%d'),2000.00);
insert into transaction values('T0002','A0004','W',STR_TO_DATE('2021-12-23','%Y-%m-%d'),1200.50);
insert into transaction values('T0003','A0001','D',STR_TO_DATE('2021-12-28','%Y-%m-%d'),200.00);
insert into transaction values('T0004','A0003','D',STR_TO_DATE('2021-12-30','%Y-%m-%d'),1050.00);
insert into transaction values('T0005','A0012','W',STR_TO_DATE('2022-01-07','%Y-%m-%d'),400.00);
insert into transaction values('T0006','A0002','D',STR_TO_DATE('2022-01-10','%Y-%m-%d'),7200.00);
insert into transaction values('T0007','A0007','W',STR_TO_DATE('2022-01-12','%Y-%m-%d'),300.50);
insert into transaction values('T0008','A0009','W',STR_TO_DATE('2022-01-25','%Y-%m-%d'),1000.50);
insert into transaction values('T0009','A0005','D',STR_TO_DATE('2022-02-02','%Y-%m-%d'),300.00);
insert into transaction values('T0010','A0008','W',STR_TO_DATE('2022-02-05','%Y-%m-%d'),4000.00);
insert into transaction values('T0011','A0011','D',STR_TO_DATE('2022-02-12','%Y-%m-%d'),500.00);

/*3*/
select * from account A inner join customer B on A.cid=B.cid where A.cid in(select cid from account where atype='S') and A.cid in(select cid from account where atype='S');








