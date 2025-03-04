/*1*/
create table category(
	cat_id char(2) Primary Key,
	cat_name varchar2(20) not null,
	descr varchar2(25)
);
create table item(
	item_id char(3) primary key,
	item_name varchar2(30) not null,
	unit_price number(8,2) not null,
	quantity number(3) not null,
	last_purchase date,
	supplier varchar2(30),
	cat_id char(2),
	foreign key(cat_id) references category(cat_id) on delete cascade
);

/*2*/
insert into category values('EL','Electronics','Home Appliances');
insert into category values('CL','Clothes','Fashion Items');
insert into category values('FT','Furniture',null);
insert into category values('SG','Sports and Games','All sports supplies');
insert into category values('TY','Toys',null);



insert into item values('E01','TV Set',25000.00,15,TO_DATE('23-Jun-2024','DD-MM-YYYY'),'ABC El Corp','EL');
insert into item values('C01','Track Suit',2600.50,10,TO_DATE('25-Feb-2024','DD-MM-YYYY'),'XYZ Supp','CL');
insert into item values('F01','Sofa cum Bed',44000.50,7,TO_DATE('5-May-2024','DD-MM-YYYY'),'Al Furniture Corp','FT');
insert into item values('S01','Badminton Racket',880.00,12,TO_DATE('17-Dec-2024','DD-MM-YYYY'),'PQR Traders','SG');
insert into item values('T02','Building Blocks',200.00,14,TO_DATE('22-Sep-2024','DD-MM-YYYY'),'KKT Mart','TY');
insert into item values('E02','Microwave Oven',2990.25,5,TO_DATE('21-Oct-2024','DD-MM-YYYY'),null,'EL');
insert into item values('E04','Washing Machine',42000.00,8,TO_DATE('01-Nov-2024','DD-MM-YYYY'),'ABC El Corp','EL');
insert into item values('F12','Steel Almirah',19500.75,5,TO_DATE('31-Aug-2024','DD-MM-YYYY'),'KKT Mart','FT');
insert into item values('S10','Cricket Bat for Cambis',650.00,6,TO_DATE('10-Jan-2025','DD-MM-YYYY'),'PQR Traders','SG');
insert into item values('T01','Hotwheels Car',120.00,22,TO_DATE('15-Jul-2024','DD-MM-YYYY'),'KKT Mart','TY');
insert into item values('F05','Dining Chair',2025.50,14,TO_DATE('18-Jun-2024','DD-MM-YYYY'),'ACM Furniture Corp','FT');
insert into item values('T05','Dirt Board Set',499.00,20,TO_DATE('22-Jun-2024','DD-MM-YYYY'),'KKT Mart','TY');
insert into item values('C11','T-Shirt for men',750.00,5,TO_DATE('26-Oct-2024','DD-MM-YYYY'),null,'CL');
insert into item values('S08','Football no 5',1059.00,5,TO_DATE('23-Jan-2015','DD-MM-YYYY'),'PQR Traders','SG');
insert into item values('F07','Computer Table',5536.75,10,TO_DATE('12-Jan-2025','DD-MM-YYYY'),null,'FT');

/*3A*/
select distinct(supplier) from item where supplier like '%Corp'; 
/*SUPPLIER
------------------------------
ABC El Corp
Al Furniture Corp
ACM Furniture Corp/*


/*3B*/
select item_name from item where supplier is null;
/*ITEM_NAME
------------------------------
Microwave Oven
T-Shirt for men
Computer Table*/


/*3C*/
select SYSDATE from DUAL;
select * from item where last_purchase>=ADD_MONTHS(SYSDATE,-3);
/*ITE ITEM_NAME			   UNIT_PRICE	QUANTITY LAST_PURC SUPPLIER			  CA
--- ------------------------------ ---------- ---------- --------- ------------------------------ --
S01 Badminton Racket			  880	      12 17-DEC-24 PQR Traders			  SG
S10 Cricket Bat for Cambis		  650	       6 10-JAN-25 PQR Traders			  SG
F07 Computer Table		      5536.75	      10 12-JAN-25				  FT*/


/*3D*/
select supplier,sum(quantity) as "Total Quantity",sum(unit_price*quantity) as "Total amount supplied" from item group by supplier order by supplier asc;
/*SUPPLIER		       Total Quantity Total amount supplied
------------------------------ -------------- ---------------------
A1 Furniture Corp			    7		   308003.5
ABC El Corp				   23		     711000
ACM Furniture Corp			   14		      28357
KKT Mart				   61		  112923.75
PQR Traders				   23		      19755
XYZ Supp				   10		      26005
					   20		   74068.75*/

/*3E*/
select cat_id,sum(quantity*unit_price) as "Total Purchase Amount", MAX(quantity*unit_price) as "Maximum Purchase Amount", MIN(quantity*unit_price) as "Minimum Purchase Amount", AVG(quantity*unit_price) as "Average Purchase Amount"from item group by cat_id order by sum(quantity*unit_price) desc;
/*CA Total Purchase Amount Maximum Purchase Amount Minimum Purchase Amount Average Purchase Amount
-- --------------------- ----------------------- ----------------------- -----------------------
EL	       725951.25		  375000		14951.25	       241983.75
FT	       489231.75		308003.5		   28357	      122307.938
CL		   29755		   26005		    3750		 14877.5
SG		   19755		   10560		    3900		    6585
TY		   15420		    9980		    2640		    5140*/

