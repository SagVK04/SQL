create table customer(
	cid varchar2(5) primary key check (cid like 'C%'),
	cname varchar2(10) not null
);
alter table customer add constraint c1 check (cid like 'C%');
create table branch(
	bcode varchar2(4) primary key check(bcode like 'B%'),
	bname varchar2(10) not null
);
create table account(
	ano varchar2(5) primary key check(ano like 'A%'),
	atype char(1) check (atype in('S','C')),
	balance number(10,2),
	cid varchar2(5),
	foreign key (cid) references customer(cid) on delete cascade,
	bcode varchar2(4),
	foreign key (bcode) references branch(bcode) on delete cascade
);
create table transaction(
	tid varchar2(5) primary key check(tid like 'T%'),
	ano varchar2(50),
	foreign key (ano) references account(ano) on delete cascade,
	ttype char(1) check(ttype in('W','D')),
	tdate date,
	tamount number(10,2)
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


insert into account values('A0007','C',85025.25,'C0002','B003');
A0008S110011.50C0002B001


insert into transaction values('T0001','A0003','W',TO_DATE('2021-Dec-22','YYYY-MM-DD'),2000.00);
insert into transaction values('T0002','A0004','W',TO_DATE('2021-Dec-23','YYYY-Mon-DD'),1200.50);
insert into transaction values('T0003','A0001','D',TO_DATE('2021-Dec-28','YYYY-Mon-DD'),200.00);
insert into transaction values('T0004','A0003','D',TO_DATE('2021-Dec-30','YYYY-Mon-DD'),1050.00);
insert into transaction values('T0005','A0012','W',TO_DATE('2022-Jan-07','YYYY-Mon-DD'),400.00);
insert into transaction values('T0006','A0002','D',TO_DATE('2022-Jan-10','YYYY-Mon-DD'),7200.00);
insert into transaction values('T0007','A0007','W',TO_DATE('2022-Jan-12','YYYY-Mon-DD'),300.50);
insert into transaction values('T0008','A0009','W',TO_DATE('2022-Jan-25','YYYY-Mon-DD'),1000.50);
insert into transaction values('T0009','A0005','D',TO_DATE('2022-Feb-02','YYYY-Mon-DD'),300.00);
insert into transaction values('T0010','A0008','W',TO_DATE('2022-Feb-05','YYYY-Mon-DD'),4000.00);
insert into transaction values('T0011','A0011','D',TO_DATE('2022-Feb-12','YYYY-Mon-DD'),500.00);












