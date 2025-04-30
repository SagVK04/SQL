select * from dual;
select 'DBMS Lab' from dual;
select 'Sagnik Metiya' as "Name" from dual;

/*A1*/
select ASCII('A') as "Ascii of A" from dual;
select chr(66) as "Character of 66" from dual;

/*A2*/
select replace('I had a bad dream on a bad dat at badwin','bad','good') as "Updated statement" from dual;

/*B1*/
select sysdate,current_date from dual;

alter session set NLS_DATE_FORMAT = 'DD-MM-YYYY HH12:MI:SS';
select sysdate,current_date from dual;
