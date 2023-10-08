/*
Need of stored procedure or function:
======================================
Reusability of code(query)

query or set of queries that are required repeatedly are stored 
in a procedure or function.

when it is required, a call is given to stored procedure or function
and it execute the query.

conclusion: write query once, use many times.

delimiter:
==========
which states the completion of an instruction or query in a code.

DBMS----> ;

delimiter // or $$

delimiter ;


syntax of stored procedure
==========================
delimiter //
create procedure procedure_name(parameter)
BIGIN
body of procedure
END //

delimiter ;

call procedure
===============

call procedure_name();

Drop procedure
===============
drop procedure procedure_name;

parameters in stored procedure
===============================
syntax:

mode variable_name datatype(size)

mode: IN   OUT   INOUT

parameter only accepting value from the call of stored procedure has
to be declared with the mode IN.

if parameter is returning value from stored procedure to call then that
parameter has to be declared as OUT.

accept+return ===> INOUT

declaring a variable inside stored procedure
=============================================

DECLARE variable datatype(size)

to set a value to a variable
=============================

SET variable_name=value;
*/

delimiter //
CREATE PROCEDURE my_procedure_Local_Var()
BEGIN   /* declare local variables */   
DECLARE a INT DEFAULT 10;   
DECLARE b, c INT;    /* using the local variables */   
SET a = a + 100;   
SET b = 2;   
SET c = a + b;    
select a,b,c;
end//
delimiter ;
call my_procedure_Local_Var;

drop procedure my_procedure_user_var;
delimiter //
CREATE PROCEDURE my_procedure_user_Var()
BEGIN   
SET @x = 15;       
SET @y = 10;       
SELECT @x, @y, @x-@y;
END//

delimiter ;
call my_procedure_user_Var();

select * from emp;

drop procedure my_proc_case;
delimiter //
CREATE PROCEDURE my_proc_case(inout no_emp int,in salary int)
BEGIN
case 
when (salary>50000)
then select count(eid) into no_emp from emp where sal>50000;
when (salary<50000)
then select count(eid) into no_emp from emp where sal<50000;
else select count(eid) into no_emp from emp where sal=50000;
end case;
END//

delimiter ;
select * from emp;
call my_proc_case(@c,60000);
select @c;
delimiter //
CREATE PROCEDURE loop_proc(in num int)
BEGIN
declare x int;
set x=0;
loop_label: loop
insert into num value (x);
set x=x+1;
if x>=num
then leave loop_label;
end if;
end loop;
END//

delimiter ;
create table num(i int);
call loop_proc(5);
select * from num;

/*

MySQL: REPEAT Statement

The REPEAT statement executes the statement(s) repeatedly as long as the condition is true. The condition is checked every time at the end of the statements.

[begin_label:] 
REPEAT     
statement_list 
UNTIL search_condition 
END 
REPEAT 
[end_label]
statement_list: List of one or more statements, each statement terminated by a semicolon(;).
search_condition : An expression.

A REPEAT statement can be labeled.

*/
delimiter //
CREATE PROCEDURE repeat_proc(in n int)
BEGIN
set @sum=0;
set @x=1;
repeat 
if mod(@x,2)=0
then set @sum=@sum+@x;
end if;
set @x=@x+1;
until @x>n
end repeat;
END//
delimiter ;

call repeat_proc(10);
select @sum;

drop procedure pqr;
delimiter //
create procedure pqr(IN id int)
    BEGIN
    select * from emp where eid=id;
    END //
delimiter ;
call pqr(1);

delimiter //
CREATE procedure out_p(out cnt int)
BEGIN
select count(eid) into cnt from emp;
END //

delimiter ;
call out_p(@M);
select @M as count;

select * from emp;

# lets say i want highest amount--then

delimiter //
CREATE PROCEDURE out_w3(out highest_amt int)
BEGIN
select max(sal) into highest_amt from emp;
END //
delimiter ;
call out_w3(@M);
select @M as count;
----------------
select * from emp;
delimiter //
CREATE PROCEDURE my_proc_inout(inout gr int,in c varchar(20))
BEGIN
select count(dept) into gr from emp where dept=c;
END//
# inout-----
delimiter ;
call my_proc_inout(@c,"HR");
select @c as count;

#---
/*
	
Decision control instruction
==============================

1)If
2)IF..ELSE
3)ELSEIF

1)IF
------
syntax:

IF condition THEN
	if body
	
END IF;

2)IF..ELSE
-----------
syntax:

IF condition THEN
	if body
ELSE
	else body
	
END IF;

3)ELSEIF
-----------
syntax:

IF condition THEN
	if body
ELSEIF condition THEN
	elseif body
ELSEIF condition THEN
	elseif body
	
ELSE 
	else body
END IF;

example of IF..else
*/
delimiter //
CREATE PROCEDURE elseif_try(inout result varchar(20),in n1 int,in n2 int)
BEGIN
if n1>n2
then
 select "n1 > n2" into result;
elseif n2>n1
 then
 select "n2>n1" into result;
elseif n2=n1
then
select "n2=n1" into result;
elseif n1<0
then
select "n1<0" into result;
else
select "Hello" into result;

 end if;
END//

delimiter ;

call elseif_try(30,30);
call elseif_try(@d,30,40);
select @d;

call elseif_try(@d,-3,40);
select @d;

/*
#----------------------- Stored Functions--------------------------------------

 stored function is a special kind stored program that returns a single value. 
Typically, you use stored functions to encapsulate common formulas or business rules that are reusable among SQL statements or stored programs.

-------Different from a stored procedure, you can use a stored function in SQL statements wherever an expression is used. 
This helps improve the readability and maintainability of the procedural code.

To create a stored function, you use the CREATE FUNCTION statement.

MySQL CREATE FUNCTION syntax
The following illustrates the basic syntax for creating a new stored function:

DELIMITER $$

CREATE FUNCTION function_name(
    param1,
    param2,…
)
RETURNS datatype
[NOT] DETERMINISTIC
BEGIN
 -- statements
END $$

DELIMITER ;

DELIMITER $$

CREATE FUNCTION function_name(
    param1,
    param2,…
)
RETURNS datatype
[NOT] DETERMINISTIC
BEGIN
 -- statements
END $$

DELIMITER ;


In this syntax:

First, specify the name of the stored function that you want to create after CREATE FUNCTION  keywords.

Second, list all parameters of the stored function inside the parentheses followed by the function name. 
By default, all parameters are the IN parameters. You cannot specify IN , OUT or INOUT modifiers to parameters

Third, specify the data type of the return value in the RETURNS statement, which can be any valid MySQL data types.

Fourth, specify if a function is deterministic or not using the DETERMINISTIC keyword.

A deterministic function always returns the same result for the same input parameters whereas 
a non-deterministic function returns different results for the same input parameters.

If you don’t use DETERMINISTIC or NOT DETERMINISTIC, MySQL uses the NOT DETERMINISTIC option by default.

Fifth, write the code in the body of the stored function in the BEGIN END block. Inside the body section, you need to specify at least one RETURN statement. 
The RETURN statement returns a value to the calling programs. Whenever the RETURN statement is reached, the execution of the stored function is terminated immediately.


click on create functions------------------just like create stored procedure ---------------------
Calling a stored function in an SQL statement
The following statement uses the CustomerLevel stored function:

/*
CREATE DEFINER=`root`@`localhost` FUNCTION `cust_level_func`(credit int) RETURNS varchar(20) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
DECLARE customerLevel VARCHAR(20);

    IF credit > 60000 THEN
		SET customerLevel = 'PLATINUM';
    ELSEIF (credit <= 60000 AND 
			credit >= 45000) THEN
        SET customerLevel = 'GOLD';
    ELSEIF credit < 45000 THEN
        SET customerLevel = 'SILVER';
    END IF;
	-- return the customer level
	RETURN (customerLevel);
END
*/

select * from emp;
SELECT 
    name, 
    cust_level_func(sal)
FROM
    emp
ORDER BY 
    sal;
drop procedure GetCustomerLevel;
delimiter //
CREATE PROCEDURE GetCustomerLevel(
    IN  pCustomerNumber INT, 
    OUT pCustomerLevel  VARCHAR(20))
BEGIN
    DECLARE credit DECIMAL DEFAULT 0;

    SELECT sal 
    INTO credit
    FROM emp
    WHERE eid = pCustomerNumber;

    IF credit > 50000 THEN
        SET pCustomerLevel = 'PLATINUM';
    ELSEIF credit <= 50000 AND credit > 10000 THEN
        SET pCustomerLevel = 'GOLD';
    ELSE
        SET pCustomerLevel = 'SILVER';
    END IF;
END //
delimiter ;

CALL GetCustomerLevel(4, @level); 
SELECT @level;

#-------------------- cursor-----

#When sql stmt is executed,DBMS create a memory area.
#This area has all the info required for processing SQL stmt.
#Cursor is the pointer to this memory area.

#eg. select * from emp; then cursor points to first tuple.

#types of cursor are explicit cursor and implicit cursor.
#we write code for explict cursor and implicit cursor is created by the dbms.
#Explicit cursor is created get better control over the context area to which the cursor is 
#pointin

#cursor in stored procedure: 
#we need it to process set of record row by row obtained from select stmt.
#steps--
#1.Declare cursor
#syntax-- DECLARE cursor_name CURSOR FOR select stmt
#2.OPEN cursor_name
#3.FETCH cursor_name INTO variable_list
#4.CLOSE cursor_name

create database school;
use school;
drop table if exists emp;
create table emp(eid int primary key auto_increment, name varchar(20),sal int,dept varchar(20),doj date);
insert into emp values
(1,"Harry",50000,"IT","2017-05-13"),
(2,"Mac",45000,"HR","2016-02-12"),
(3,"Rox",60000,"Support","2015-05-12"),
(4,"Shree",90000,"IT","2018-02-01"),
(5,"Ramesh",50000,"IT","2018-05-13"),
(6,"Seema",32000,"HR","2019-02-12"),
(7,"Purvika",40000,"IT","2018-07-12"),
(8,"Shreepal",51000,"production","2017-05-25");

select name,sal from emp;
show databases;
# declare 2 variable such as n and s to store the name and salary obtained.
# so writing procedure
delimiter //;
/*----------------- stored procedure : cursorrecord
CREATE DEFINER=`root`@`localhost` PROCEDURE `cursorrecord`()
BEGIN
DECLARE n varchar(25);
DECLARE s int;
DECLARE cur1 CURSOR FOR SELECT name,sal from emp;
OPEN cur1;
getrec: LOOP
FETCH cur1 into n,s;
IF s>=50000 THEN
select n as empname,s as salary,"Platinum" as grade;
ELSE
select n as empname,s as salary,"Gold" as grade;
END IF;
END LOOP getrec;
CLOSE cur1;


END

*/
delimiter ;
call cursorrecord();
/*
Now,after execution , we are getting some kind of error.error 1329.So we are going to handle that error.
CREATE DEFINER=`root`@`localhost` PROCEDURE `cursor_record_error_handled`()
BEGIN
DECLARE n varchar(25);
DECLARE s int;
DECLARE cur1 CURSOR FOR SELECT name,sal from emp;
DECLARE exit handler FOR 1329 select "No more records to process" as Message;
OPEN cur1;
getrec: LOOP
FETCH cur1 into n,s;
IF s>=50000 THEN
select n as empname,s as salary,"Platinum" as grade;
ELSE
select n as empname,s as salary,"Gold" as grade;
END IF;
END LOOP getrec;
CLOSE cur1;

END
*/

call cursor_record_error_handled;


call my_procedure_Local_Variables();

#Exception handling in stored procedure-- we require this for customizing error message.
select * from emp;
desc emp;
delimiter //
create procedure error2()
begin
insert into emp(eid,name,sal,dept,doj) values(5,"Manoj",45000,"production","2019-06-12");
end //
delimiter ;
call error2; #-- so,handling error with error_code sqlstate and sqlexception

# So, declaring error handler-- 
/*
syntax-- 
Declare action handler for condition_value statement;

action : 1.exit 2.continue 

# the next part of code is continue_value--:are-- 1.error code, 2.sqlexception  */

drop procedure error2;

/*first we need to see what is an error handler and what is an sqlstate. For eg*/
delimiter //
create procedure error1()
begin
select * from xyz;
end //
delimiter ;

call error1;

# so first we will see this error code--
#0	45	12:30:32	call error1	Error Code: 1146. Table 'school.xyz' doesn't exist	0.000 sec
#0	41	12:16:20	call error2	Error Code: 1062. Duplicate entry '5' for key 'PRIMARY'	0.031 sec-- for erro2

# 1146 and 1062 is the error code. Sqlstate we get by default in mariadb and we are not getting in workbench
# so u can just google.
#42S02,23000 are sqlstate for above error codes.
#Table 'school.xyz' doesn't exist, Duplicate entry '5' for key 'PRIMARY'---- these are the messages.

drop procedure error1;

delimiter //
create procedure error1()
begin
declare exit handler for 1146 select "No such table found, please create it" as Err_msg;
select * from xyz;
select * from emp;
end //

delimiter ;
call error1;

# now,continue--

drop procedure error1;

delimiter //
create procedure error1()
begin
declare continue handler for 1146 select "No such table found, please create it" as Err_msg;
select * from xyz;
select * from emp;
end //

delimiter ;
call error1;

# sqlexception


drop procedure error1;

delimiter //
create procedure error1()
begin
declare continue handler for sqlexception select "No such table found, please create it" as Err_msg;
select * from xyz;
select * from emp;
end //

delimiter ;
call error1;

#named error condition
/*we declare a name for a condition and with the help of that name we handl the error.
syntax:
declare error_name condition for condition_value;

eg.condition_value :1146 1062
*/
drop procedure error1;
delimiter //
create procedure error1()
begin
declare NoTableFound condition for 1146;
declare exit handler for NoTableFound select "No such table found.Please create it" as err_msg;
select * from xyz;
select * from emp;
end //
delimiter ;
call error1;
# so instead of code 1146,weare working with name NoTableFound




 
 









#Trigger-- Triggers are called automatically when some DML operation is called.-----------------

/*
use in database audit i.e. maintaining log of DML opertion on that table,integrity constraint

types of trigger-- row level and stmt level(not supported in mysql)

row level trigger--
CREATE TRIGGER trigger_name
{BEFORE | AFTER} {INSERT | UPDATE| DELETE }
ON table_name FOR EACH ROW
trigger_body;


*/
select * from emp;

# row level trigger--create a table -- logtable(id,action,date_time)

create table logtable(id int primary key auto_increment,
action varchar(100),dt datetime);

# creating trigger for insertion
delimiter // 
create trigger insert_trigger after insert on emp
for each row
begin
insert into logtable(action,dt) values ("Record inserted",now());
end //
select * from logtable;

insert into emp(name,sal,dept,doj) values ("Mano",58000,"production","2019-05-20");
select * from logtable;
insert into emp(name,sal,dept,doj) values ("Nano",58000,"production","2019-05-20"),
("Nanu",68000,"production","2019-05-20"),
("Dino",58000,"production","2019-05-20");

select * from  logtable;

show triggers;

drop trigger insert_trigger;

show triggers;

#https://drive.google.com/drive/folders/1i8UO9M6mLYX8eT3RZxYJxKVWr6d9oLCz

# stmt leveltrigger isnot supportedin mysql
/*
CREATE TRIGGER trigger_name
{BEFORE | AFTER} {INSERT | UPDATE| DELETE }
ON table_name
Begin
trigger_body
end*/

delimiter //
create trigger delete_trigger after delete on emp
for each row
begin
insert into logtable(action,dt) values("Record deleted",now());
end//
delimiter ;
select * from emp;
delete from emp where eid=8;
select * from logtable;
delete from emp where eid in(2,4); 
select * from logtable;

/*
after trigger--
update trigger and new | old keywords

*/
select * from emp;
#adding 2 more cols into logtable for storing before after updates information.

alter table logtable add bef varchar(100),add aft varchar(100);

desc logtable;
delete from emp where eid is Null;
select * from emp;
insert into emp values(8,"Shreepal",51000,"production","2017-05-25"); 
select * from emp;

delimiter //
create trigger update_trigger after update on emp
for each row
begin
insert into logtable(action,dt,bef,aft) values
("Record updated",now(),concat(old.sal,'-',old.dept),concat(new.sal,"-",new.dept));
end//
delimiter ;
update emp set sal=55000,dept="Maintenance" where eid=8;
select * from logtable;

# integrity constraint and before trigger--
/*
lets say i have some constraints like if sal to be inserted
is less than 10000,then record shouldnot be inserted.
*/

delimiter //
create trigger insert_trigger_before before insert on emp
for each row 
begin 
if new.sal<10000 then
signal sqlstate'45000' set message_text="Salary must be greater than 10000";
end if;
end //
delimiter ;
select * from emp;

insert into emp values(9,"Manoj",15000,"Support","2021-11-01"); 
select * from logtable;

insert into emp values(10,"Abhay",9000,"Support","2021-11-01");
select * from logtable;



