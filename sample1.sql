CREATE TABLE DEPT(
	deptno int,
	deptname varchar(30) Not Null,
	location varchar(30),
	Primary Key(deptno)
);
DESC DEPT; /*Decribing table*/
DROP TABLE DEPT;

--------------*****-------------

INSERT INTO DEPT VALUES(10,'Acccounting','Kolkata');
INSERT INTO DEPT VALUES(20,'Research','Chennai');
INSERT INTO DEPT VALUES(30,'Sales','Mumbai');
INSERT INTO DEPT VALUES(40,'Operations','New Delhi');
SELECT * FROM DEPT; /*Displaying stored value*/
CREATE TABLE EMP(
	empno int(4) Primary Key,
	ename varchar(30) Not Null,
	job varchar(30) Not Null,
	mgr int(4),
	hiredate date,
	sal int(10),
	com int(8),
	deptno int(2), 
	Foreign Key(deptno) references DEPT(deptno) ON DELETE CASCADE
);
/*OR*/
CREATE TABLE EMP(
	empno number(4) Primary Key,
	ename varchar2(30) Not Null,
	job varchar2(30) Not Null,
	mgr number(4),
	hiredate date,
	sal number(10),
	com number(8),
	deptno number(2), 
);
ALTER TABLE EMP
ADD CONSTRAINT FK Foreign Key(deptno) references DEPT(deptno) ON DELETE CASCADE
DESC EMP;
INSERT INTO EMP VALUES(7369,'Smith','Clerk',7902,'2016-12-17',8000,null,20); /*Date Operator*/
INSERT INTO EMP VALUES(7499,'Allen','Salesman',7698,"2014-02-20",16000,300,30);
INSERT INTO EMP VALUES(7566,'Jones','Manager',7839,"2017-04-02",29750,null,20);
INSERT INTO EMP VALUES(7521,'Ward','Salesman',7698,"2017-02-22",12500,500,30);
INSERT INTO EMP VALUES(7654,'Martin','Salesman',7698,'2019-09-28',12500,1400,30);
INSERT INTO EMP VALUES(7698,'Blake','Manager',7839,'2011-05-01',18500,null,30);
INSERT INTO EMP VALUES(7782,'Clark','Manager',7839,'2012-06-09',24500,null,10);
INSERT INTO EMP VALUES(7788,'Scott','Analyst','7566','2014-12-09',30000,null,20);
INSERT INTO EMP VALUES(7839,'King','President',null,'2013-11-17',50000,null,10);
INSERT INTO EMP VALUES(7844,'Turner','Salesman',7698,'2015-09-08',15000,0,30);
INSERT INTO EMP VALUES(7876,'Adams','Clerk',7788,'2016-01-12',11000,null,20);
INSERT INTO EMP VALUES(7900,'James','Clerk',7698,'2018-12-04',9500,null,30);
INSERT INTO EMP VALUES(7902,'Ford','Analyst',7566,'2014-12-03',30000,null,20);
INSERT INTO EMP VALUES(7934,'Miller','Clerk',7782,'2012-01-23',13000,null,10);
delete from EMP;/*Delete all rows from table*/
SELECT * FROM EMP;
COMMIT;/*For uploading and storing the database into Oracle Server*/
select JOB from EMP where value="Analyst";
/*Select Queries*/
select ENAME,JOB from EMP where JOB='Analyst' or JOB='Salesman';
select ENAME,JOB from EMP where JOB in('Analyst','Salesman');
select * from EMP where JOB='Analyst' or JOB='Salesman';
select EMPNO,ENAME,JOB,HIREDATE from EMP where HIREDATE<'2014-09-30';
select ENAME,JOB from EMP where JOB<>'Manager';
select ENAME,EMPNO from EMP where EMPNO in(7521, 7839,7934,7788);
select * from EMP where not DEPTNO in(30,40,10);
select ENAME,HIREDATE from EMP where HIREDATE>TO_DATE('30-Jun-2014','DD-MM-YYYY') and HIREDATE<TO_DATE('31-DEC-2014','DD-MM-YYYY');
/*OR*/
select ENAME,HIREDATE from EMP where HIREDATE between '2014-06-30' and '2014-12-31';
select distinct JOB from EMP;
select ename from EMP where com is null;
select ename,job from EMP where mgr is null; 
select * from EMP where deptno is null;
select ename from EMP where com is not null;
select * from EMP where ename like 'S%' or ename like'%s';
select * from EMP where ename like '_i%';
select COUNT(empno) as "No. of employee" from EMP;
select COUNT(distinct JOB) as "No. of designations" from EMP;
select SUM(SAL) as "Total salary" from EMP;
select MAX(SAL) as "Maximum salary" from EMP;
select MIN(SAL) as "Minimum salary" from EMP;
select AVG(SAL) as "Average salary" from EMP;
select MAX(SAL) as "Maximum salary of salesman" from EMP where JOB='Salesman';
