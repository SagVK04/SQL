create table userdata(
	userid varchar(6) primary key,
	email varchar(20) unique,
	fullname varchar(18) not null,
	gender char(1),
	address varchar(35)
);
create table itemcategory(
	catid char(3) primary key,
	catname varchar(15),
	description varchar(30)
);
create table item(
	itemid char(3) primary key,
	itemtype char(5),
	itemname varchar(50) unique,
	unitprice decimal(6,2) not null,
	foreign key(itemtype) references itemcategory(catid) on delete cascade
);
create table orderlist(
	orderid int not null auto_increment primary key,
	userid varchar(6),
	itemid char(3),
	qty int(2) not null,
	amount decimal(8,2) not null,
	orderdate date,
	paymode char(4)
);

/*2*/
/*a*/
rename table userdata to alluser;
/*b*/
alter table itemcategory rename column description to descr;
alter table itemcategory modify descr varchar(50);
alter table itemcategory modify catname varchar(15) not null;
/*c*/
alter table orderlist add constraint fk1 foreign key(userid) references alluser(userid);
alter table orderlist add constraint fk2 foreign key(itemid) references item(itemid);
/*d*/
alter table alluser drop gender;
alter table alluser add phone char(10) unique;

/*3*/
/*3a*/
insert into itemcategory values('DRT','Desert', 'Usually taken after main course.');
insert into itemcategory values('MNC', 'Main Course', 'Can be taken as lunch or dinner.');
insert into itemcategory values('BVG','Beverages', 'Can be taken at any time.');
insert into itemcategory values('FTF', 'Fast Food', 'Can be taken as breakfast or tiffin.');
/*3B*/ 
alter table item drop foreign key item_ibfk_1;
alter table item modify itemtype char(3);
alter table item add constraint fk3 foreign key(itemtype) references itemcategory(catid);
insert into item values('F01', 'FTF', 'Paneer Tikka Wrap Combo', 130.75);
insert into item values('M01', 'MNC', 'Rajma Chawal Bowl', 189.25);
insert into item values('M02','MNC', 'Hyderabadi Chicken Biryani', 220.50);
insert into item values('B01', 'BVG', 'Mint Chaas', 89.00);
insert into item values('M03', 'MNC', 'Kadai Paneer-Thali',209.75);
insert into item values('F02', 'FTF', 'Chicken Tikka Sandwich', 139.25);
insert into item values('M04','MNC','Chana Masala Pulao', 179.25);
insert into item values('F03','FTF','Chilli Corn 65', 179.25);
insert into item values('B02','BVG', 'Masala Lemonade', 89.00);
	
/*4*/
insert into alluser values('doro77','dorothy77@gmail.com','Dorothy Jones', '4D/1, Fern Road, Kolkata','4578895623');	
insert into alluser values('eve80','evelyn@gmail.com','Evelyn Simon', NULL, '7788778877');
insert into alluser values('harry','harry_t@yahoo.com','Harry Thompson', '14, BB Ganguly St., Kolkata', NULL);	
insert into alluser values('raja.h','rhasan@hotmail.com', 'Hasan Raja ',' AE34, Laketown, Kolkata',NULL);	
insert into alluser values('james5', 'james5@rediff.com','James Andy',NULL, NULL);
/*4f*/	
update alluser set address='Flat 207, Block K,New Town' WHERE fullname='Evelyn Simon';
/*4g*/
update alluser set address='255, Jessore Road,Barasat', phone='2200560087' where userid='james5';

/*5a*/
alter table orderlist drop column amount; 
insert into orderlist values (DEFAULT,'doro77','F02', 3, STR_TO_DATE('02-01-2022','%d-%m-%Y'),'UPI');
insert into orderlist values (DEFAULT,'harry', 'M01', 1, STR_TO_DATE('2022-01-04','%Y-%m-%d'),'NETB');
insert into orderlist values (DEFAULT,'harry','B02',1,STR_TO_DATE('2022-01-04','%Y-%m-%d'),'NETB');
insert into orderlist values (DEFAULT,'doro77','F02',3,STR_TO_DATE('2022-01-08','%Y-%m-%d'),'UPI');
insert into orderlist values (DEFAULT,'doro77','B02',2,STR_TO_DATE('2022-01-08','%Y-%m-%d'),'UPI');
insert into orderlist values (DEFAULT,'raja.h','M02',3,STR_TO_DATE('2022-01-18','%Y-%m-%d'),'UPI');
insert into orderlist values (DEFAULT,'eve80','M01',1,STR_TO_DATE('2022-01-21','%Y-%m-%d'),'NETB');
insert into orderlist values (DEFAULT,'eve80','B02',1,STR_TO_DATE('2022-01-21','%Y-%m-%d'),'NETB');
insert into orderlist values (DEFAULT,'doro77','M04',2,STR_TO_DATE('2022-02-03','%Y-%m-%d'),'CRDC');
insert into orderlist values (DEFAULT,'james5','M03',1,STR_TO_DATE('2022-02-03','%Y-%m-%d'),'NETB');
insert into orderlist values (DEFAULT,'james5','B02',2,STR_TO_DATE('2022-02-03','%Y-%m-%d'),'NETB');
insert into orderlist values (DEFAULT,'doro77','M02',2,STR_TO_DATE('2022-02-07','%Y-%m-%d'),'UPI');
insert into orderlist values (DEFAULT,'doro77','B01',4,STR_TO_DATE('2022-02-09','%Y-%m-%d'),'UPI');
insert into orderlist values (DEFAULT,'james5','F02',2,STR_TO_DATE('2022-02-12','%Y-%m-%d'),'DEBT');
insert into orderlist values (DEFAULT,'eve80','M04',10,STR_TO_DATE('2022-02-20','%Y-%m-%d'),'CRDC');
insert into orderlist values (DEFAULT,'eve80','B01',6,STR_TO_DATE('2022-02-20','%Y-%m-%d'),'CRDC');
insert into orderlist values (DEFAULT,'eve80','F02',2,STR_TO_DATE('2022-02-20','%Y-%m-%d'),'CRDC');
insert into orderlist values (DEFAULT,'harry','M03',3,STR_TO_DATE('2022-02-23','%Y-%m-%d'),'NETB');
insert into orderlist values (DEFAULT,'raja.h','F02',4,STR_TO_DATE('2022-02-26','%Y-%m-%d'),'DEBT');
insert into orderlist values (DEFAULT,'harry','B02',2,STR_TO_DATE('2022-02-28','%Y-%m-%d'),'NETB');
