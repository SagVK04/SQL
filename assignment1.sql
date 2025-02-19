sqlplus cse22032@172.16.11.40/XEPDB1 //Connecting database
SET LINESIZE 150;
SET PAGESIZE 100;
CREATE TABLE DEPT(
	deptno number(2) Primary Key,
	deptname varchar2(30) Not Null,
	location varchar2(30)
);
/*OR*/
CREATE TABLE DEPT(
	deptno number(2),
	deptname varchar2(30) Not Null,
	location varchar2(30),
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
	empno number(4) Primary Key,
	ename varchar2(30) Not Null,
	job varchar2(30) Not Null,
	mgr number(4),
	hiredate date,
	sal number(10),
	com number(8),
	deptno number(2), 
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
INSERT INTO EMP VALUES(7369,'Smith','Clerk',7902,DATE '2016-12-17',8000,null,20); /*Date Operator*/
INSERT INTO EMP VALUES(7499,'Allen','Salesman',7698,TO_DATE ('20 Feb 2014','DD-MON-YYYY'),16000,300,30);
INSERT INTO EMP VALUES(7566,'Jones','Manager',7839,TO_DATE('02 Apr 2017','DD-MM-YYYY'),29750,null,20);
INSERT INTO EMP VALUES(7521,'Ward','Salesman',7698,TO_DATE('22 Feb 2017','DD-MM-YYYY'),12500,500,30);
INSERT INTO EMP VALUES(7654,'Martin','Salesman',7698,TO_DATE('28 Sep 2019','DD-MM-YYYY'),12500,1400,30);
INSERT INTO EMP VALUES(7698,'Blake','Manager',7839,TO_DATE('01 May 2011','DD-MM-YYYY'),18500,null,30);
INSERT INTO EMP VALUES(7782,'Clark','Manager',7839,TO_DATE('09-Jun-2012','DD-MM-YYYY'),24500,null,10);
INSERT INTO EMP VALUES(7788,'Scott','Analyst','7566',TO_DATE('09-Dec-2014','DD-MM-YYYY'),30000,null,20);
INSERT INTO EMP VALUES(7839,'King','President',null,TO_DATE('17-Nov-2013','DD-MM-YYYY'),50000,null,10);
INSERT INTO EMP VALUES(7844,'Turner','Salesman',7698,TO_DATE('08-Sep-2015','DD-MM-YYYY'),15000,0,30);
INSERT INTO EMP VALUES(7876,'Adams','Clerk',7788,TO_DATE('12-Jan-2016','DD-MM-YYYY'),11000,null,20);
INSERT INTO EMP VALUES(7900,'James','Clerk',7698,TO_DATE('04-Dec-2018','DD-MM-YYYY'),9500,null,30);
INSERT INTO EMP VALUES(7902,'Ford','Analyst',7566,TO_DATE('03-Dec-2014','DD-MM-YYYY'),30000,null,20);
INSERT INTO EMP VALUES(7934,'Miller','Clerk',7782,TO_DATE('23-Jan-2012','DD-MM-YYYY'),13000,null,10);
delete from EMP;/*Delete all rows from table*/
SELECT * FROM EMP;
COMMIT;/*For uploading and storing the database into Oracle Server*/
select JOB from EMP where value="Analyst";
/*Select Queries*/
select ENAME,JOB from EMP where JOB='Analyst' or JOB='Salesman';
select ENAME,JOB from EMP where JOB in('Analyst','Salesman');
select * from EMP where JOB='Analyst' or JOB='Salesman';
select EMPNO,ENAME,JOB,HIREDATE from EMP where HIREDATE<TO_DATE('30-Sep-2014','DD-MM-YYYY');
select ENAME,JOB from EMP where JOB<>'Manager';
select ENAME,EMPNO from EMP where EMPNO in(7521, 7839,7934,7788);
select * from EMP where not DEPTNO in(30,40,10);
select ENAME,HIREDATE from EMP where HIREDATE>TO_DATE('30-Jun-2014','DD-MM-YYYY') and HIREDATE<TO_DATE('31-DEC-2014','DD-MM-YYYY');
/*OR*/
select ENAME,HIREDATE from EMP where HIREDATE between TO_DATE('30-Jun-2014','DD-MM-YYYY') and TO_DATE('31-DEC-2014','DD-MM-YYYY');
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
