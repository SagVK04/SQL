create table userdata(
	userid varchar(6) primary key,
	email varchar(20) unique,
	fullname varchar(18) not null,
	gender char(1),
	address varchar(2)
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
	foreign key(itemtype) references itemcategory(catid)
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

