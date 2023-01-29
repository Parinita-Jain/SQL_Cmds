show databases;
create database sl_lab;
show databases;
drop database sl_lab;
show databases;
create database sql_lab;
use sql_lab;

#----------------Data Types______________________

create table student_info(roll_no TINYINT, attendance BIT,stud_parents_monthly_income smallint);
desc student_info;
# we have not specified size, by default size is given.

insert into student_info values(1,0,32766);
select * from student_info;
insert into student_info values(256,2,40000); # out of range error
select * from student_info; # converted nearest value is inserted.

#Creating a new table with bigint

create table product(product_id int,product_copies bigint,product_price decimal(3,2));
insert into product values(2147483648,9223372036854775807,7.8);
select * from product;

# Approximate numeric datatype- float and real. 

create table approx_numeric_datademo(float_nos FLOAT, real_nos real);
insert into approx_numeric_datademo values(4.566666678545454565457866666669,-7888986898587.000);
select * from approx_numeric_datademo;

create table date_demo(date_column DATE,time_column TIME,date_time_column DATETIME);
desc date_demo;

insert into date_demo values('2022-03-28','20:42:01','2022-03-28 20:42:01');
select * from date_demo;
create table student(
roll int,
name varchar(20),
address varchar(100),
contact int(10),
marks int);
desc student;
insert into student values(1,'Python','Pune','123456789',56);
insert into student values(2,'Java','Mumbai','123456789',95);
insert into student values(3,'HTML','Nasik','789787878',85);
insert into student values(4,'C','Pune','1238978978',56);
insert into student values(5,'Python','Nasik','67897878',56);
select * from student;
select name,address from student;
select * from student where roll=5;
select * from student where marks<90;
select * from student where address like "%Pune%";
select * from student where address like "_a%";   # All the names with second letter a are printed
select * from student where marks<90 and marks>50;
select * from student where marks between 50 and 90;
select * from student where  roll=1 or roll=2;
select * from student where roll in (1,2);
select distinct address from student;
select * from student order by marks;
select * from student order by marks desc;
select * from student where address='Pune' order by marks;
select * from student where address='Pune' order by marks limit 1;
select * from student order by marks desc limit 1,2;
select * from student limit 3;
select * from student where address is null;
select * from student where address is  not null;
drop table student;
show tables;
#---------------------------------------------------constraints-----------
create table student
    (
     id tinyint(3) unique,
     name varchar(10) not null,
     marks decimal(6,2),
     dateofbirth date,
     course varchar(10)
     );
insert into student values(1,'harry',45,null,null);
select * from student;
insert into student values(1,'harry',45,null,null);
desc student;
insert into student values(null,'harry',45,null,null);
select * from student;
insert into student values(1,'harry',45,null,null);
insert into student values(null,'harry',45,null,null);
select * from student;
drop table student;
create table student
     (
     id tinyint(3) not null unique,
     name varchar(10) not null,
     marks decimal(6,2),
     dateofbirth date,
     course varchar(10)
     );
insert into student values(1,'harry',45,null,null);
insert into student values(1,'harry',45,null,null);
insert into student values(null,'harry',45,null,null);
desc student;
drop table student;
create table student
    (
     id tinyint(3) not null unique,
     name varchar(10) not null,
     marks decimal(6,2),
     dateofbirth date not null unique,
     course varchar(10)
     );
insert into student values(1,'harry',45,null,null);
insert into student values(1,'harry',45,'1990-09-09',null);
insert into student values(2,'harry',45,'1990-09-09',null);
insert into student values(2,'harry',45,'1990-09-10',null);
drop table student;
create table student
    (
     id tinyint(3) not null unique,
     name varchar(10) not null,
     marks decimal(6,2),
     dateofbirth date not null unique,
     course varchar(10)
     );
insert into student values(1,'harry',45,null,null);
insert into student values(1,'harry',45,'1990-09-09',null);
insert into student values(2,'harry',45,'1990-09-09',null);
insert into student values(2,'harry',45,'1990-09-10',null);
desc student;
drop table student;

# primary key with autoincrement
create table teacher(id int primary key auto_increment,
name text,
contact text,
UNIQUE(name(20)));
alter table teacher add unique(contact(10));
desc teacher;

insert into teacher value(1,"ABC","1234566780");
insert into teacher(name, contact) values("PQR","3543857980");
insert into teacher(name, contact) values("bhu","1244347894");
insert into teacher(name, contact) values("adfd","1234356626");
insert into teacher(name, contact) values("vbcmxn","6529897878");


desc teacher;

select * from teacher;

# primary key without autoincrement.
create table student
    (
     id tinyint(3) primary key,
     name varchar(10) not null,
     marks decimal(6,2),
     dateofbirth date not null unique,
     course varchar(10)
     );
desc student;
insert into student values(1,'harry',45,null,null);
insert into student values(1,'harry',45,null,null);
insert into student values(2,'harry',45,'1990-09-09',null);
insert into student values(2,'harry',45,'1990-09-09',null);
insert into student values(null,'harry',45,'1990-09-09',null);
drop table student;
#---------we cannot have 2 primary keys in a table.
create table student
     (
     id tinyint(3) primary key,
     name varchar(10) not null,
     marks decimal(6,2),
     dateofbirth date primary key,
     course varchar(10)
     );
create table student
    (
	 id tinyint(3),
     name varchar(10) not null,
     marks decimal(6,2),
     dateofbirth date not null,
     course varchar(10),
     primary key(id),
     unique(dateofbirth)
     );
desc student;

drop table student;

desc student;
#------------------------------------------------enum
drop table student;
create table student
     (
     id tinyint(3) primary key,
     name varchar(10) not null,
     marks decimal(6,2),
     dateofbirth date not null unique,
     course enum('java','python','php')
     );
desc student;
insert into student values(1,'harry',45,'1990-09-09','java');
insert into student values(1,'harry',45,'1990-09-09','java');
select * from student;
insert into student values(2,'harry',45,'1990-09-08','python');
select * from student;
insert into student values(3,'harry',45,'1991-09-08','html');

select * from student;
insert into student values(4,'ron',45,'1992-09-08','java,python');
select * from student;
#---------------------------------------------------set
drop table student;
create table student
     (
     id tinyint(3) primary key,
     name varchar(10) not null,
	 marks decimal(6,2),
     dateofbirth date not null unique,
     course set('java','python','php')
     );
     

insert into student values(1,'harry',45,'1990-09-09','java');
insert into student values(2,'harry',45,'1990-09-08','python');
select * from student;
insert into student values(3,'harry',45,'1991-09-08','html');
select * from student;
insert into student values(4,'ron',45,'1992-09-08','java,python');
select * from student;
insert into student values(5,'ron',45,'1996-09-08','python,html');
select * from student;
desc student;
drop table student;
#----------------------------------------------------foreign key
drop table customers;
drop table orders;
create table customers(
id int not null,
name varchar(20) not null,
primary key(id));


create table orders(
id int not null,
customer_id int);

alter table orders add constraint cust_f foreign key(customer_id) references customers(id);

insert into customers values(1,"A");
insert into customers values(2,"A");
insert into customers values(3,"A");
insert into customers values(4,"A");

insert into orders values(10,1);
insert into orders values(10,2);
insert into orders values(10,3);
insert into orders values(10,3);

select orders.id, orders.customer_id from orders;
delete from customers where id=4;
delete from customers where id=3;
select * from orders;
select * from customers;

alter table orders drop foreign key cust_f;


#----------------------------------------Alter
create table product_demo(product_id int, product_name varchar(20), product_price int);
desc product_demo;
# i want to rename tablename

alter table product_demo rename to product1;
desc product1;
check table product1;
# adding new col in table,let's say product_category

alter table product1 add column product_category varchar(20) after product_name;
desc product1;

# modify size of datatype ormodify col datatype

alter table product1 modify product_name varchar(15);
desc product1;

#dropping col
alter table product1 drop product_category;
desc product1;
#------drop deletes entire structure of table. Truncate deletes rows of table.

truncate table product1;
desc product1;

drop table product1;
desc product1;


#Constraints are placed on cols.-------------------how to add or drop constraints 

drop table course_p;
create table course_p
(courseid int(3),
coursename varchar(20),
fees decimal(10,2));
alter table course_p
add constraint primary key(courseid);

alter table course_p
drop primary key;

alter table course_p
add constraint primary key(courseid);#------------add primary key again for foreign key constraints.
drop table student;
create table student
(studid int(3) primary key,
sname varchar(20),
cid int(3) not null
);

alter table student
add constraint studcourse foreign key(cid) references course_p(courseid);

alter table student drop foreign key studcourse;

#-------------Data Query Language------------------------
# select



#Arithmetic and Logical Operators : <,>,<=,>=,=

#logical operator and,or not
drop table employee;
create table employee(emp_id int primary key,emp_first_name varchar(20),emp_last_name varchar(20),
emp_job_title varchar(20));
insert into employee(emp_id,emp_first_name,emp_last_name,emp_job_title) values
(1001,"Raj","Ambani","Architect"),
(1002,"Rama","Birla","Data Scintist"),
(1003,"Raja","Ambani","Data Engineer");

select * from employee;

select emp_id,emp_job_title,emp_last_name from employee;
select * from employee where emp_id=1001;
drop table bank_customer;
create table bank_customer(cust_acc_no int primary key, cust_first_name varchar(20),
cust_last_name varchar(20), cust_acc_bal int ,cust_credit_limit int,cust_job_title varchar(20));

desc bank_customer;

insert into bank_customer(cust_acc_no, cust_first_name,
cust_last_name, cust_acc_bal ,cust_credit_limit,cust_job_title)
values (2005,"Raj","Ambani",130000,30000,"Architect"),
(2006,"Rama","Birla",190000,40000,"Data Scientist"),
(2007,"Roma","Ambani",890000,70000,"Data Engineer"),
(2008,"Raja","Mehta",250000,50000,"Architect"),
(2009,"Rajni","Ambani",680000,6000,"Architect")
;
select * from bank_customer;

select cust_acc_no,cust_first_name from bank_customer where cust_acc_bal<200000;
select cust_acc_no,cust_first_name from bank_customer where cust_acc_bal<680000 and
cust_acc_bal>200000;
select cust_acc_no,cust_first_name,cust_last_name from bank_customer where cust_credit_limit<68000 or
cust_credit_limit>20000;
select cust_first_name,cust_credit_limit+20000 as "revised_credit_lmit" from bank_customer;


# Range operator
select cust_acc_no,cust_first_name,cust_last_name from bank_customer where cust_credit_limit
between 20000 and 68000;

select cust_acc_no,cust_first_name,cust_last_name from bank_customer where cust_acc_no
in(2006,2007,2005);

select cust_acc_no,cust_first_name,cust_last_name from bank_customer where cust_last_name 
like '__b%';
select distinct cust_last_name from bank_customer;
select * from bank_customer order by cust_acc_bal;
select * from bank_customer order by cust_acc_bal desc;

select * from bank_customer order by cust_acc_bal limit 2;
select * from bank_customer order by cust_acc_bal limit 2,1;

# case
# ifcustomers bal is30000thenin remarks col bal is less or bal is ok. i.e. if-else
# so using case expression
select cust_acc_bal,case cust_acc_bal when 130000 then "Less Balance"
else "Balance is fine " end as "Remarks"
from bank_customer;
create table Number(i int);
insert into Number values(1),(2),(3),(4);
select * from Number;
select i*i 'Sq_of_i' from Number;

#------------------------------------------------------------------Functions

# Functions


create table Name(F_name varchar(20),L_name varchar(20));
insert into Name values('Harry','Jerry'); 
insert into Name values('Tom','Jerry'); 
insert into Name values('Bob','Merry'); 
select concat(F_name,L_name) 'Names' from Name;
select concat(f_name,' ',l_name) 'Names' from Name;
select * from Name;
select f_name,upper(f_name) from Name;
select f_name,lower(f_name) from Name;
select f_name,length(f_name) from Name;
select replace("Let us earn Python","earn","learn") as "Target";
# substr starts from 1
select substr("Let us learn Machine Learning",12,5);
select substr("Let us learn Machine Learning",-14.5,5);

# Math function

select round(23.45343,2);


select round(34323.6767,1);

select round(34323.6767,-2);


select truncate(34323.6767,2);

select ceil(34323.6767);

select floor(34323.6767);

select sqrt(81);

select pow(2,3);

select mod(29,2);
# coalesce- returns the first non-null value in a list. 
select coalesce(null,1,2);
select coalesce(null,null,2);
select coalesce(null,null,null);
select isnull(1*1);
select isnull(1/0);
select isnull(0/1);
select if(12>13,'Yes','No');
create table Number_(i int);
insert into Number_ values(1),(2),(3),(4);
select avg(i) from Number_;
select max(i) from Number_;
select min(i) from Number_;
select sum(i) from Number_;

select greatest(2,45,6,88,3);
#select greatest(i);
select least(2,45,6,88,3);


#------Date

select curdate();
select now();
select sysdate();
select month(sysdate());
select last_day('2022-02-12');

select adddate(sysdate(),-2);

select adddate(sysdate(),2);

select datediff(sysdate(),'2020-12-10');
select timestampdiff(day,'2020-12-10',sysdate());
select timestampdiff(month,'2020-12-10',sysdate());

select timestampdiff(year,'2020-12-10',sysdate());
select date_format(sysdate(),'%m');

#year (2-digits)
select date_format(sysdate(),'%y');

#year (4-digits)
select date_format(sysdate(),'%Y');

#abbrivated month
select date_format(sysdate(),'%b');

#full month
select date_format(sysdate(),'%M');

#day
select date_format(sysdate(),'%d');

#full weekday
select date_format(sysdate(),'%W');

#abbrivated weekday
select date_format(sysdate(),'%a');

select date_format(sysdate(),'%D');

select date_format(sysdate(),'%D of the %M, %Y, %W');

select date_format(sysdate(),'%d-%m-%Y');

#Only time
select date_format(sysdate(),'%h:%i:%s %p');

#---------------group by---------having------------------------------------------

#=========================================================================================
select emp_id from emp_gp where emp_salary=40000;

#Having clause is like aggregate function with group by clause..
#Group by clause groups rows thhat have same valuesinto summary rows.
#Having Clause with where clause in order to find rows with certain conditions

drop table emp_gp;
create table emp_gp(emp_id int,emp_name varchar(20),emp_city varchar(20),emp_salary int);
insert into emp_gp(emp_id,emp_name,emp_city,emp_salary) values 
(1001,"Karthik","Thane",40000),
(1002,"Selvi","Pune",50000),
(1003,"Raj","Thane",55000),
(1004,"Sarvana","Mumbai",56000),
(1005,"Subha","Pune",20000),
(1006,"Krishna","Mumbai",35000),
(1007,"AB","Delhi",58000),
(1008,"CD","Delhi",38000);
select avg(emp_salary) from emp_gp ;# where emp_city="Thane";
select count(*) from emp_gp;
select * from emp_gp;


#Now if we need to display the departments where the sum of salaries is 50,000 or more. In this condition, we will use HAVING Clause.

SELECT Department, sum(Salary) as Salary
FROM employee
GROUP BY department
HAVING SUM(Salary) >= 50000;  

#Suppose, a teacher wants to announce the toppers in class. For this, she decides to reward every student who scored more than 95%. 
#We need to group the database by name and their percentage and find out who scored more than 95% in that year. 

drop table Student;
CREATE TABLE Student(
   student Varchar(20),
   percentage int
);

INSERT INTO Student VALUES ('Isha Patel', 98),('Harsh Das', 94),('Rachit Sha', 93),('Sumedha', 98),
('Rahat Ali', 98);

select * from student;

SELECT student, percentage
FROM Student
GROUP BY student, percentage
HAVING percentage > 95;

#we can also filter rows on multiple values using the HAVING clause. 
#The HAVING clause also permits filtering rows using more than one aggregate condition.
select SUM(percentage) from Student;
 

SELECT student  
FROM Student
WHERE percentage > 90
GROUP BY student, percentage
Having student like "R%" AND AVG(percentage) > 95;

select emp_city,count(emp_city) from emp_gp group by emp_city;
select emp_city,emp_salary from emp_gp group by emp_city having max(emp_salary)=emp_salary;
select emp_city,avg(emp_salary) from emp_gp group by emp_city; 

create table s1 as select emp_city,avg(emp_salary)from emp_gp group by  emp_city ;
select * from s1;

select emp_name,emp_city,emp_salary from emp_gp where emp_salary >= (select avg(emp_salary) from emp_gp);

select emp_city,emp_name,sum(emp_salary)  from emp_gp  group by emp_city having sum(emp_salary)>=avg(emp_salary);
# do remember to include having colin select clause.

#==============================================================================================

create table customers_gh(id int, fname varchar(20),lname varchar(20),age int,country varchar(20));
insert into customers_gh values(1,"John","Doe",31,"USA"),(2,"Robert","Luna",22,"USA"),
(3,"David","Robinson",22,"UK"),(4,"John","Reindt",25,"UK"),(5,"Betty","Doe",28,"UAE");
;

#Here, the SQL command groups the rows by the country column, and counts the number of each country
# (because of the COUNT() function).

#Note: The GROUP BY clause is used in conjunction with aggregate functions such as
# MIN(), MAX(), SUM(), AVG() and COUNT(), etc.

select country,count(*) from customers_gh group by country;
select * from customers_gh;
SELECT age, country
FROM customers_gh
GROUP BY country
HAVING age >=25;

SELECT COUNT(id), country,sum(age)
FROM customers_gh
GROUP BY country
HAVING COUNT(id) > 1 and sum(age)>28;

SELECT COUNT(id), country
FROM customers_gh
GROUP BY country
HAVING COUNT(id) > 1;

#Here, the SQL command:counts the number of rows by grouping them by country
# and returns the result set if their count is greater than 1

#The HAVING clause in SQL is used if we need to filter the result set based on aggregate functions such as 
#MIN() and MAX(), SUM() and AVG() and COUNT().

#Note: The HAVING clause was introduced because the WHERE clause does not support aggregate functions. 
#Also, GROUP BY must be used before the HAVING clause.

#SQL HAVING Vs WHERE
#HAVING Clause	WHERE Clause
#The HAVING clause checks the condition on a group of rows.	
#The WHERE clause checks the condition on each individual row.

#The HAVING is used with aggregate functions.	
#The WHERE clause cannot be used with aggregate functions.

#The HAVING clause is executed after the GROUP BY clause.	
#The WHERE clause is executed before the GROUP BY clause.


create table orders_gh(id int,product varchar(20),total int,cust_id int);

insert into orders_gh values(1,"paper",500,5),(2,"pen",10,2),(3,"Marker",120,3),(4,"Books",1000,1),
(5,"Erasers",20,4);
#If we want to select rows where the value of the amount column in the Orders table is less than 500, we can write,

select id,total from orders_gh where total<500;

#Now, if we want to select rows and calculate sum off each amount, we can write---
SELECT id, SUM(total) AS total
FROM orders_gh
GROUP BY id
having sum(total)<500
order by sum(total);

#The SQL EXISTS operator executes the outer SQL query if the subquery is not NULL (empty result-set). For example,

SELECT id, fname
FROM customers_gh
WHERE EXISTS (
  SELECT id
  FROM orders_gh
  WHERE orders_gh.cust_id = customers_gh.id
);









#----------------------------------------------------------Sub Queries------------
# subqueries with select ,update ,delete and insert
create table employee_sq(emp_id int,emp_name varchar(20),emp_age int,gender varchar(20),emp_doj date,
emp_dept varchar(20),emp_city varchar(20),emp_salary int);

insert into employee_sq(emp_id,emp_name,emp_age,gender,emp_doj,
emp_dept,emp_city,emp_salary) values
(106,"Ammy",35,"F","2014-12-20","IT","Seatle",83000),
(107,"Jack",40,"M","2012-07-14","Finance","Houston",103000),
(108,"Angela",36,"F","2007-02-04","Tech","New York",113000),
(109,"Marcus",25,"M","2010-07-18","HR","Boston",90000),
(110,"David",34,"M","2009-08-25","Product","Miami",78000),
(111,"Rose",28,"F","2011-02-27","Tech","Chicago",63000);
create table employee_copy(emp_id int,emp_name varchar(20),emp_age int,gender varchar(20),emp_doj date,
emp_dept varchar(20),emp_city varchar(20),emp_salary int);

insert into employee_copy(emp_id,emp_name,emp_age,gender,emp_doj,
emp_dept,emp_city,emp_salary) values
(106,"Ammy",35,"F","2014-12-20","IT","Seatle",83000),
(107,"Jack",40,"M","2012-07-14","Finance","Houston",103000),
(108,"Angela",36,"F","2007-02-04","Tech","New York",113000),
(109,"Marcus",25,"M","2010-07-18","HR","Boston",90000),
(110,"David",34,"M","2009-08-25","Product","Miami",78000),
(111,"Rose",28,"F","2011-02-27","Tech","Chicago",63000);

select * from employee_sq;
select max(emp_salary) from employee_sq;
select emp_dept from employee_sq where emp_salary=(select max(emp_salary) from employee_sq);
select emp_name,emp_dept from employee_sq where emp_salary=(select max(emp_salary) from employee_sq);
select * from employee_sq where emp_salary=(select max(emp_salary) from employee_sq);

#
#The SQL ANY Operator
#The ANY operator:

#returns a boolean value as a result
#returns TRUE if ANY of the subquery values meet the condition
#ANY means that the condition will be true if the operation is true for any of the values in the range

SELECT *
FROM employee_sq
WHERE emp_age = ANY (
  SELECT emp_age
  FROM employee_sq where emp_age>35
);

#SQL ALL compares a value of the first table with all values of the second table and 
#returns the row if there is a match with all values.

#For example, if we want to find teachers whose age is greater than all students, we can use--

SELECT * 
FROM employee_sq
WHERE emp_salary >=  ALL (
  SELECT emp_salary
  FROM employee_sq
);


SELECT * 
FROM employee_sq
WHERE emp_salary = (
  SELECT max(emp_salary)
  FROM employee_sq
);
SELECT emp_salary
  FROM employee_sq;

#We can use any comparison operators like =, >, <, etc. with the ANY and ALL keywords.

#The SQL EXISTS Operator
#The EXISTS operator is used to test for the existence of any record in a subquery.

#The EXISTS operator returns TRUE if the subquery returns one or more records.
SELECT * 
FROM employee_sq
WHERE exists (
  SELECT emp_age
  FROM employee_sq where emp_age=25
);

SELECT * 
FROM employee_sq
WHERE not exists (
  SELECT emp_age
  FROM employee_sq where emp_age=25
);


# updation through subquery

#select emp_id from employee_sq where emp_age>=27;


(select emp_id from employee_copy where emp_age>=28);

update employee_sq set emp_salary=emp_salary+3000 where emp_id in
(select emp_id from employee_copy where emp_age>=28);

delete from employee_sq where emp_id in (select emp_id from employee_copy where emp_age>=27);
select * from employee_sq;
create table product(product_id int,product_name varchar(30),selling_price int
,product_type varchar(20));
insert into product(product_id,product_name,selling_price,product_type)
values (201,"Jewellery",1100,"Luxury"),
(202,"T-Shirt",300,"Non-Luxury"),
(203,"Laptop",1300,"Luxury"),
(204,"Table",400,"Non-Luxury");

desc product;

create table orders_1(order_id int,product_sold varchar(20),selling_price float);

select product_id from product where selling_price>1000;

insert into orders_1 select product_id,product_name,selling_price from product where
 product_id in (select product_id from product where selling_price>=1000);
select * from orders_1;
 
 #------------------------------Joins in SQL----------
 
 # Relational Algebra consists of mathematical expression to represent joins.
 # and in SQL , we implement joins whenever we want to join two or more table to get
 # the desired o/p using common cols of different tables. If nothing is common between 
 # tables, then we cannot apply joins.
 
 #------------see joins.docx------------------------
 
 create table employee_j(emp_no INT PRIMARY KEY,emp_name VARCHAR(20),emp_address VARCHAR(20));
 insert into employee_j(emp_no ,emp_name ,emp_address) values(1,'ram','delhi'),
    (2,'varun','chandigarh'),
    (3,'ravi','chandigarh'),
    (4,'amrit','delhi');
create table department_j(dept_no VARCHAR(10),dept_name VARCHAR(10),emp_no INT, FOREIGN KEY(emp_no) REFERENCES employee_j(emp_no));

insert into department_j(dept_no,dept_name ,emp_no ) values('d1','HR',1),
    ('d2','IT',2),
    ('d3','marketing',4);

# Q.Write a query to find name of the department whole dept_no is d3

select dept_name from department_j where dept_no='d3';

# Now,I don't need to use join in above query.

# Q. Write a query to know the address of the employee whose name is “varun”

select emp_address from employee_j where emp_name='varun';
# Now,I don't need to use join in above query


#Write a query to find emp_name of a employee who is working in “HR” department?

#Step 1→ first find “HR” dept is in which table.

#Step 2: find “emp_name” is in which table
 
#Step 3: joins

#JOINS=cross product + some_condition

#Display employee name who belongs to delhi.Do we need to use joins?No.

Select emp_name from employee_j where emp_address='delhi';

# Q. Obtain all employee name who are working in some department.
# emp_name is in employee_j and department no. is in department_j.
# Emp_no → common between 2 tables
#o/p:
#Ram 
#Varun 
#Amrit
# empno. 3 , Ravi is not present in department_j table
#select emp_name from employee_j,department_j[cross product] where Employee.emp_no=Department.emp_no

# explain naturaljoin multiplication from join.docx
select emp_name from employee_j,department_j where Employee_j.emp_no=Department_j.emp_no;

# This is also like Natural Join.
#select emp_name from employee_j natural join department_j where Employee_j.emp_no=Department_j.emp_no;
select emp_name from employee_j natural join department_j;


#RIGHT OUTER JOIN
# Allthe records of rifght table will be present giving Null if some department value is not present.
Select dept_no,dept_name,emp_name,emp_address from employee_j RIGHT OUTER JOIN department_j
ON employee_j.emp_no=department_j.emp_no;

#LEFT OUTER JOIN

#It gives the matching row and the rows which are in the left table but not in the right table

#select emp_name,emp_address,dept_no,dept_name from [left_table_name] 
#LEFT OUTER JOIN  [right_table_name] ON employee.emp_no=depatment.emp_no

select emp_name,emp_address,dept_no,dept_name from employee_j LEFT OUTER JOIN department_j 
ON employee_j.emp_no=department_j.emp_no;

#FULL OUTER JOIN 

#Select * from first_table_name Union all select * from second_table_name;
select * from department_j UNION ALL select * from employee_j; # employee_j records are merged on department_j
select * from employee_j UNION ALL select * from department_j;
# department_j records are merged on employee_j


# Inner Join
select emp_name,emp_address,dept_no,dept_name from employee_j INNER JOIN department_j 
ON employee_j.emp_no=department_j.emp_no;
# Self join

create table student_j(student_id VARCHAR(10),course_id VARCHAR(10),course_pursuing_since VARCHAR(10));

insert into  student_j(student_id ,course_id ,course_pursuing_since ) values('s1','c1','2016'),
    ('s2','c2','2017'),
    ('s1','c2','2017');
    
# Q.Display that student_id who is enrolled in more than 1 course!!
select student_id from student_j;
# Use aliases because sql compiler looks for two different tables to join.


Select t2.student_id from 
student_j as t1,student_j as t2 where t1.student_id=t2.student_id and t1.course_id!=t2.course_id ;

#And → both conditions should be true
#Or→ any 1 

#----------------------------Views--------

# views is a virtual table. It creates table but donot occupy any space. VIEWS IN SQL.docx----------------------
# it'sjust a dummy or virtual table. So changes in views table are not reflected on original table.

select * from employee_j;

create view emp_view as select emp_no,emp_name from employee_j where emp_address='chandigarh';
# our view is created

select * from emp_view;

#now I want toapply changes onmy view.-- Alter

# Let's say I don't want different cols. I want both the col information in same col.

alter view emp_view as select emp_address,concat(emp_name,' ',emp_address)  from employee_j;

select * from emp_view;

# now views on 2 tables.
select * from employee_j;
select * from department_j;
# i want information of all those employees which have some department no.  assigned to them.
# i.e. ram,varun and amrit

create or replace view emp_dept as select employee_j.emp_name, department_j.dept_no 
from employee_j,department_j
where employee_j.emp_no=department_j.emp_no;
#employee_j.emp_name, department_j.dept_no  is crossproduct or natural join

select * from emp_dept;

#updation on views

update emp_dept set emp_name='amit' where dept_no='d3';
select * from emp_dept;
select * from employee_j;  # this is updatable view.
# i.e. if u make changes in your view, the same gets updated in original table too.


#----------------------------Course completed--
# triggers-triggers are SQL codes that are automatically executed in response to certain events
# on a particular table. This can be used to maintain integrity of data.
create table my_student(student_id int primary key,
first_name varchar(20), last_name varchar(20), address varchar(20),state varchar(10),marks int);
insert into my_student(student_id,first_name,last_name,address,state,marks) values
(1,'Karthik','konar','thane','pune',200),(3,'karthik','raj','thane','pune',400);
select * from my_student;
# create trigger
create trigger marks_trigger before insert on my_student
for each row set new.marks=new.marks+100;
insert into my_student values(6,'bhoomi','sawant','andheri','mumbai',600);

select * from my_student;

create table final_marks_1(total_marks int);

create trigger after_trigger_marks after insert on my_student for each row
insert into final_marks_1 values(new.marks);

insert into my_student values(7,'amit','sahu','thane','pune',600);

# before trigger fired and gave 900,then after trigger
select * from my_student;
select * from final_marks_1;
# display triggers
show triggers in sql_lab;
# delete trigger
drop trigger after_trigger;

#---------------------------------------------------------
create database fifa19;
use fifa19;
create table players(
id int,
name varchar(30),
age int(3),
nationality varchar(255),
overallrating int,
potentialrating int,
club varchar(255),
value int,
wage int,
preferredfoot enum('Left','Right'),
jerseynumber int,
joined date,
height varchar(10),
weight int(3),
penalties int(3)
);

#MariaDB [fifa19]> load data local infile "C:/Users/itvedant/Documents/Parinita/Database/AV/fifa19.csv" into table players columns terminated by "," optionally enclosed by "'" ignore 1 lines;


select sum(wage) as total_wage,jerseynumber from players group by jerseynumber order by total_wage desc
limit 1;

# what is the freq distributionof nationality whose club name starts with M?

select count(*) as freq,nationality from players where club like "M%" group by nationality;

# how many players have joined there respective clubs in the date range 20 May 2018 and 10 Apr 2019
# both inclusive---

#nowthis kind of filtering based on timeline..arevery useful

select count(*) from players where joined >= "2018-05-20" and joined <= "2019-04-10";

# u can alsouse between clause

# now lets say I want to see distribution of players as to how many players have joined there 
# respective clubs date wise orlets say yearwise..we can also use this kind of query like how
# many users connect daily tomy website

select count(*) as freq,date(joined) from players group by date(joined);

# lets say we want to see yearly


select count(*) as freq,year(joined) from players group by year(joined);

select concat(name,' ',nationality) from players limit 10;

select ucase(nationality) from players;
select lcase(nationality) from players;

# trimming string means..u can remove leading and trailing spaces

select ltrim("   Hello");
select rtrim("Hello     ");
select trim("   Hello  ");

# slicing a string or getting substring from a string

#getting only starting 2 letters of players

select left(name,2) from players limit 10; 
# last 2 characters--
select right(name,2) from players limit 10;

# in between characters--
select substring(name,2,5) from players limit 10;

# reg exp is a special sequence of characters that helpsu match or find other strings or setsof strings
# this is what a reg exp looks like- '[a-zA-Z0-9._-]+@\w+\.com'

# lets say we have a text col in our table--
# find out the words that starts with M ?- ^M
# ending with ing ?- ing$
# words that starts with m and c?- ^[mc]
# starts with m ends with y?- ^m.*y$---.* for anything in between
# words that contain digits ?-/d
# find 3 digit numbers ?-^/d{3}$

select distinct nationality from players where nationality regexp '^A'; 
select distinct nationality from players where nationality regexp '^A.*n$';

# date time functions
select now(),curdate(),curtime();

# extracting date and time
select joined from players limit 5;
select date(joined) from players limit 5;
select time(joined) from players limit 5;
select joined ,date(joined),month(joined),day(joined),year(joined) from players limit 5 ;
#formatting date and time as strings-
select joined,date_format(joined,"%m/%d/%y") from players limit 5;

# numeric functions--
select value/wage ,round(value/wage) as nearest_integer,floor(value/wage) as floor_integer,
ceiling(value/wage) as ceil_integer,truncate(value/wage,2) as two_decimal_places
from players limit 3;
# absolute function..so first creating a -ve weight,then take abs value of -ve weight
select -weight,abs(-weight) from players;

# conditional flow--
# case stmt--categorizing players based on rating--

select name, 
case 
when overallratig >90 then "WorldClass"
when overallrating between 80 and 90 then "High Performer"
when overallrating beween 60and 80 then "Average"
else "BelowPar"
end as "Category"
from players; 

# Subqueries--------------------------------
# find count of all players whose overall rating doesnot equal to the maxi overall rating
# fromany nationality?
select count(*) from players where overallrating<>ALL( select max(overallrating)
from players group by nationality); 
select max(overallrating)
from players group by nationality; 

# find count of allplayers whose overall ratings equals to the maximum overall rating from
# any nationality

select count(*) from players where overallrating = Any(
select max(overallrating) from players group by nationality);

# multicol subqueries--

# find name,age and nationality of players whose nationality starts with A and age is lessthan 25
select name,age,nationality from players where (nationality,age) in 
(select nationality,age from players where nationality like "A%" and age<25);

# correlated subqueries---
#find name,nationality and overallrating of players whose overallrating is greater than the 
# avg rating ofplayers within the same nationality
select name,nationality,overallrating from players p1
where overallrating>(select avg(overallrating) from players p2
where p1.nationality=p2.nationality ) order by nationality;

# exists operator--here subquery returns 0,1, or many rows.

#find name,nationality and overallrating,joiningdate of players who have joined before
#2018-07-10
select name,nationality,overallrating,joined from players where exists 
(select 1 from players where joined<'2018-07-10');

# specifies if there exists any record where joined<2018-07-10 
select 1 from players where joined<'2018-07-10';
select * from players limit 1;
# now lets say we want to find all those players who joined after 158023 
select joined from players where id=158023; 
select name from players where joined>(select joined from players where id=158023);

# adding not null and default constraints--
create table emp
( id int not null,first_name varchar(255), salary int default 10000,bonus int
);

insert into emp values(1,"david",12000,1000);
insert into emp(id,first_name,bonus) values(2,"jennifer",1000);

select * from emp;

alter table emp modify first_name varchar(255) not null;

alter table emp modify bonus int default 0;

create table emp_constarints(
id int not null,
first_name varchar(255) not null,
last_name varchar(255) default null,
age int default null,
salary int default 10000,
bonus int default 0,
unique(id),
check (age>22)
);

alter table emp_constarints add constraint salary_bonus check (bonus<0.5*salary);

alter table emp_constarints add constraint unique_name unique(first_name,last_name);


#--------------------------------

show databases;
create database movies;
use movies;
DROP TABLE IF EXISTS customer_profile;

CREATE TABLE customer_profile (
  customer_id varchar(10) NOT NULL,
  customer_name varchar(20) NOT NULL,
  email_id varchar(20) DEFAULT NULL,
  contact_number int NOT NULL,
  PRIMARY KEY(customer_id)
);

INSERT INTO customer_profile VALUES ('UI0811','Love','love2316@gmil.com',2147483647),('UI10000035','Peck','peck3221@gmil.com',2147483647),('UI1000023','Bevan','bevan4114@gmil.com',2147483647),('UI1000706','Reem','reem768@gmil.com',2147483647),('UI10100086','Hareem','hareem8910@gmil.com',2147483647),('UI10200037','Forster','forster9418@gmil.com',2147483647),('UI10300072','Michalina','michalina9867@gmil.c',2147483647),('UI10400053','Sanaya','sanaya2473@gmil.com',2147483647),('UI10500059','Taiba','taiba593@gmil.com',2147483647),('UI10600043','Dean','dean6611@gmil.com',2147483647),('UI10700015','Maisie','maisie4612@gmil.com',2147483647),('UI10800046','Lyra','lyra7102@gmil.com',2147483647),('UI10900013','Arjan','arjan4230@gmil.com',2147483647),('UI11000097','Hammond','hammond5058@gmil.com',2147483647),('UI11000447','Dean','dean7656@gmil.com',2147483647),('UI11100033','Cleveland','cleveland864@gmil.co',2147483647),('UI11200016','Durham','durham7040@gmil.com',2147483647),('UI11300083','Pemberton','pemberton331@gmil.co',2147483647),('UI11400034','Mayer','mayer7615@gmil.com',2147483647),('UI11500072','Hareem','hareem5109@gmil.com',2147483647),('UI11600014','Remi','remi7137@gmil.com',2147483647),('UI11700095','Pemberton','pemberton3401@gmil.c',2147483647),('UI11800069','Reynolds','reynolds3958@gmil.co',2147483647),('UI11900051','Kathleen','kathleen4218@gmil.co',2147483647),('UI12000071','Mindy','mindy7861@gmil.com',2147483647),('UI12000592','Kathleen','kathleen4909@gmil.co',2147483647),('UI12100028','Ammaar','ammaar6957@gmil.com',2147483647),('UI12200021','Carson','carson5435@gmil.com',2147483647),('UI12300073','Mays','mays5036@gmil.com',2147483647),('UI12400030','Sophia','sophia9599@gmil.com',2147483647),('UI12500071','Lambert','lambert1026@gmil.com',2147483647),('UI12600080','Mcgowan','mcgowan2968@gmil.com',2147483647),('UI1270008','Aya','aya9452@gmil.com',2147483647),('UI12800092','Priya','priya4307@gmil.com',2147483647),('UI12900088','Durham','durham7689@gmil.com',2147483647),('UI13000069','Rhona','rhona8950@gmil.com',2147483647),('UI13000827','Ameera','ameera8769@gmil.com',2147483647),('UI13100050','Thorpe','thorpe7027@gmil.com',2147483647),('UI13200043','Mcgowan','mcgowan4651@gmil.com',2147483647),('UI13300075','Cecelia','cecelia8398@gmil.com',2147483647),('UI13400064','Krause','krause3178@gmil.com',2147483647),('UI13500070','Kendra','kendra1060@gmil.com',2147483647),('UI13600048','Gideon','gideon7064@gmil.com',2147483647),('UI13700042','Rudy','rudy9478@gmil.com',2147483647),('UI13800085','Junaid','junaid8838@gmil.com',2147483647),('UI13900010','Benson','benson6873@gmil.com',2147483647),('UI14000023','Ahmed','ahmed9199@gmil.com',2147483647),('UI14000326','Peck','peck1366@gmil.com',2147483647),('UI14100076','Reem','reem7454@gmil.com',2147483647),('UI14200016','Forbes','forbes6653@gmil.com',2147483647),('UI14300047','Cleveland','cleveland1327@gmil.c',2147483647),('UI14400050','Levi','levi1723@gmil.com',2147483647),('UI14500062','Hammond','hammond8367@gmil.com',2147483647),('UI14600045','Stephenson','stephenson6118@gmil.',2147483647),('UI14700047','Cotton','cotton7792@gmil.com',2147483647),('UI14800089','Catrina','catrina7994@gmil.com',2147483647),('UI14900098','Mahoney','mahoney8255@gmil.com',2147483647),('UI15000074','Long','long3425@gmil.com',2147483647),('UI15000740','Hester','hester9651@gmil.com',2147483647),('UI15100075','Chad','chad8145@gmil.com',2147483647),('UI15200087','Shaurya','shaurya6240@gmil.com',2147483647),('UI15300032','Hareem','hareem1866@gmil.com',2147483647),('UI15400042','Mckenzie','mckenzie9217@gmil.co',2147483647),('UI15500064','Samanta','samanta1145@gmil.com',2147483647),('UI15600081','Samanta','samanta459@gmil.com',2147483647),('UI15700055','Benson','benson4775@gmil.com',2147483647),('UI15800052','Cotton','cotton2424@gmil.com',2147483647),('UI15900033','Tait','tait8972@gmil.com',2147483647),('UI16000056','Mcdaniel','mcdaniel9768@gmil.co',2147483647),('UI16000751','Vivaan','vivaan5583@gmil.com',2147483647),('UI16100045','Lina','lina5720@gmil.com',2147483647),('UI16200071','Krisha','krisha9020@gmil.com',2147483647),('UI16300061','Jamaal','jamaal9100@gmil.com',2147483647),('UI16400045','Mackie','mackie7735@gmil.com',2147483647),('UI16500048','Griffin','griffin714@gmil.com',2147483647),('UI16600072','Frost','frost613@gmil.com',2147483647),('UI16700010','Samual','samual2393@gmil.com',2147483647),('UI16800072','Krueger','krueger8035@gmil.com',2147483647),('UI16900040','Tait','tait1670@gmil.com',2147483647),('UI17000037','Stanley','stanley9406@gmil.com',2147483647),('UI17000151','Eshaal','eshaal3460@gmil.com',2147483647),('UI17100089','Aiza','aiza2037@gmil.com',2147483647),('UI17200012','Flynn','flynn9479@gmil.com',2147483647),('UI17300022','Willard','willard5441@gmil.com',2147483647),('UI17400060','Rodriguez','rodriguez4928@gmil.c',2147483647),('UI17500087','Kourtney','kourtney7498@gmil.co',2147483647),('UI17600049','Beech','beech3669@gmil.com',2147483647),('UI17700027','Forbes','forbes1719@gmil.com',2147483647),('UI17800022','Zacharia','zacharia3912@gmil.co',2147483647),('UI17900040','Perez','perez5954@gmil.com',2147483647),('UI18000093','Karter','karter546@gmil.com',2147483647),('UI18000288','Krause','krause8357@gmil.com',2147483647),('UI18100014','Levine','levine6907@gmil.com',2147483647),('UI18200078','Love','love6450@gmil.com',2147483647),('UI18300079','Antoni','antoni9273@gmil.com',2147483647),('UI18400016','Park','park958@gmil.com',2147483647),('UI18500055','Lyra','lyra5905@gmil.com',2147483647),('UI18600045','Keavy','keavy1322@gmil.com',2147483647),('UI18700030','Devan','devan4080@gmil.com',2147483647),('UI18800044','Aria','aria6264@gmil.com',2147483647),('UI18900029','Krueger','krueger9891@gmil.com',2147483647),('UI19000056','Oliver','oliver1230@gmil.com',2147483647),('UI19000292','Hareem','hareem2713@gmil.com',2147483647),('UI19100045','Lawrence','lawrence446@gmil.com',2147483647),('UI1920008','Albert','albert4368@gmil.com',2147483647),('UI19300061','Perez','perez7574@gmil.com',2147483647),('UI19400032','Figueroa','figueroa1451@gmil.co',2147483647),('UI19500055','Duran','duran6146@gmil.com',2147483647),('UI19600061','Finlay','finlay9226@gmil.com',2147483647),('UI19700079','Arran','arran9502@gmil.com',2147483647),('UI19800045','Mackie','mackie7029@gmil.com',2147483647),('UI19900047','Vivaan','vivaan7810@gmil.com',2147483647),('UI20000099','Jimmy','jimmy2248@gmil.com',2147483647),('UI20000575','Harmon','harmon3782@gmil.com',2147483647),('UI2000536','Samual','samual996@gmil.com',2147483647),('UI20100084','Hina','hina3045@gmil.com',2147483647),('UI20200060','Doherty','doherty6718@gmil.com',2147483647),('UI20300058','Morrow','morrow7290@gmil.com',2147483647),('UI20400069','Arthur','arthur7947@gmil.com',2147483647),('UI2050002','Mays','mays4515@gmil.com',2147483647),('UI20600063','Summers','summers1799@gmil.com',2147483647),('UI20700065','Cabrera','cabrera4665@gmil.com',2147483647),('UI20800081','Hawkins','hawkins8102@gmil.com',2147483647),('UI20900087','Reem','reem6370@gmil.com',2147483647),('UI21000027','Aiza','aiza7530@gmil.com',2147483647),('UI21000646','North','north5771@gmil.com',2147483647),('UI21100021','Junaid','junaid4590@gmil.com',2147483647),('UI21200023','Priya','priya4027@gmil.com',2147483647),('UI21300019','Mays','mays1681@gmil.com',2147483647),('UI21400071','Aiza','aiza8869@gmil.com',2147483647),('UI21500090','Taiba','taiba9366@gmil.com',2147483647),('UI21600089','Ronaldo','ronaldo7377@gmil.com',2147483647),('UI21700030','Talley','talley3362@gmil.com',2147483647),('UI21800013','Emir','emir7520@gmil.com',2147483647),('UI21900099','Mcdaniel','mcdaniel6319@gmil.co',2147483647),('UI22000053','Mindy','mindy4346@gmil.com',2147483647),('UI22000648','Cleveland','cleveland9863@gmil.c',2147483647),('UI22100043','White','white1409@gmil.com',2147483647),('UI22200013','Dean','dean1247@gmil.com',2147483647),('UI22300041','Stephenson','stephenson2448@gmil.',2147483647),('UI22400045','Samanta','samanta6722@gmil.com',2147483647),('UI22500019','Pearce','pearce3646@gmil.com',2147483647),('UI22600025','Colby','colby2436@gmil.com',2147483647),('UI22700070','Pineda','pineda8040@gmil.com',2147483647),('UI22800014','Hammond','hammond2538@gmil.com',2147483647),('UI22900074','Rodriguez','rodriguez1430@gmil.c',2147483647),('UI23000014','Peck','peck3612@gmil.com',2147483647),('UI23000810','Keri','keri8017@gmil.com',2147483647),('UI23100036','Ahmed','ahmed6199@gmil.com',2147483647),('UI23200048','Cotton','cotton9608@gmil.com',2147483647),('UI23300091','Shaurya','shaurya9551@gmil.com',2147483647),('UI23400028','Pineda','pineda5087@gmil.com',2147483647),('UI23500028','Love','love3921@gmil.com',2147483647),('UI23600054','Griffin','griffin6431@gmil.com',2147483647),('UI23700013','Calhoun','calhoun9052@gmil.com',2147483647),('UI23800039','Sidrah','sidrah4900@gmil.com',2147483647),('UI23900073','Moses','moses1113@gmil.com',2147483647),('UI24000078','Figueroa','figueroa7001@gmil.co',2147483647),('UI24000738','Aguilar','aguilar9065@gmil.com',2147483647),('UI24100025','Love','love4142@gmil.com',2147483647),('UI24200063','Huda','huda7135@gmil.com',2147483647),('UI24300060','Julien','julien6788@gmil.com',2147483647),('UI24400062','Vivienne','vivienne9352@gmil.co',2147483647),('UI24500054','Ammaar','ammaar723@gmil.com',2147483647),('UI24600037','Harriette','harriette1708@gmil.c',2147483647),('UI24700088','Antoni','antoni9068@gmil.com',2147483647),('UI24800046','Long','long2048@gmil.com',2147483647),('UI24900023','Levine','levine5981@gmil.com',2147483647),('UI25000091','Jameel','jameel9942@gmil.com',2147483647),('UI25000243','Harriette','harriette4860@gmil.c',2147483647),('UI25100031','Blankenship','blankenship7689@gmil',2147483647),('UI25200045','Krause','krause7236@gmil.com',2147483647),('UI25300099','Albert','albert8696@gmil.com',2147483647),('UI25400042','Krause','krause4954@gmil.com',2147483647),('UI25500059','Lawrence','lawrence675@gmil.com',2147483647),('UI25600067','Griffin','griffin2204@gmil.com',2147483647),('UI25700012','Colby','colby7215@gmil.com',2147483647),('UI25800010','Mays','mays3450@gmil.com',2147483647),('UI25900023','Lyra','lyra6618@gmil.com',2147483647),('UI26000078','Aimee','aimee9539@gmil.com',2147483647),('UI2600031','Lancaster','lancaster4991@gmil.c',2147483647),('UI26100072','Lawrence','lawrence2941@gmil.co',2147483647),('UI26200086','Jareth','jareth6357@gmil.com',2147483647),('UI26300025','Keri','keri5669@gmil.com',2147483647),('UI26400093','Esquivel','esquivel8979@gmil.co',2147483647),('UI26500089','Ellesha','ellesha746@gmil.com',2147483647),('UI26600043','Michalina','michalina651@gmil.co',2147483647),('UI26700065','Sidrah','sidrah3481@gmil.com',2147483647),('UI26800095','Mays','mays8455@gmil.com',2147483647),('UI26900049','Gunn','gunn1149@gmil.com',2147483647),('UI27000018','Lina','lina1161@gmil.com',2147483647),('UI2700041','Holland','holland9940@gmil.com',2147483647),('UI27100043','Benson','benson6482@gmil.com',2147483647),('UI27200084','Karter','karter1481@gmil.com',2147483647),('UI27300061','Debra','debra1115@gmil.com',2147483647),('UI27400044','Mayer','mayer1672@gmil.com',2147483647),('UI27500047','Zuniga','zuniga9527@gmil.com',2147483647),('UI27600067','Zaynab','zaynab6314@gmil.com',2147483647),('UI27700023','Odonnell','odonnell5516@gmil.co',2147483647),('UI27800078','Thorpe','thorpe624@gmil.com',2147483647),('UI27900076','Colton','colton6235@gmil.com',2147483647),('UI28000019','Duarte','duarte9775@gmil.com',2147483647),('UI28000258','Frost','frost2872@gmil.com',2147483647),('UI28100017','Mackie','mackie2455@gmil.com',2147483647),('UI28200064','Ammaar','ammaar1799@gmil.com',2147483647),('UI28300071','Mayer','mayer2450@gmil.com',2147483647),('UI28400070','Summers','summers6725@gmil.com',2147483647),('UI28500019','Mcdaniel','mcdaniel5696@gmil.co',2147483647),('UI28600083','Bevan','bevan2114@gmil.com',2147483647),('UI28700079','Lawrence','lawrence6516@gmil.co',2147483647),('UI28800010','Thorpe','thorpe4090@gmil.com',2147483647),('UI28900047','Hudson','hudson5697@gmil.com',2147483647),('UI29000099','Oliver','oliver9734@gmil.com',2147483647),('UI29000831','Aguilar','aguilar8581@gmil.com',2147483647),('UI29100026','White','white6840@gmil.com',2147483647),('UI29200056','Pemberton','pemberton4122@gmil.c',2147483647),('UI29300070','Krisha','krisha6296@gmil.com',2147483647),('UI29400067','Bishop','bishop9475@gmil.com',2147483647),('UI29500046','Lambert','lambert9696@gmil.com',2147483647),('UI29600096','Aguilar','aguilar9496@gmil.com',2147483647),('UI29700020','Keri','keri5892@gmil.com',2147483647),('UI29800028','Mcauley','mcauley810@gmil.com',2147483647),('UI29900075','Thomas','thomas9796@gmil.com',2147483647),('UI30000075','Ellesha','ellesha8669@gmil.com',2147483647),('UI30000407','Rodriguez','rodriguez4797@gmil.c',2147483647),('UI3000495','Eshaal','eshaal4443@gmil.com',2147483647),('UI30100060','Forster','forster5031@gmil.com',2147483647),('UI30200043','Lyra','lyra8611@gmil.com',2147483647),('UI30300082','Junaid','junaid413@gmil.com',2147483647),('UI30400060','Axl','axl7523@gmil.com',2147483647),('UI30500013','Reem','reem9326@gmil.com',2147483647),('UI30600087','Ciaran','ciaran9701@gmil.com',2147483647),('UI30700054','Hareem','hareem870@gmil.com',2147483647),('UI30800086','Love','love7475@gmil.com',2147483647),('UI30900071','Cotton','cotton2177@gmil.com',2147483647),('UI31000057','Chavez','chavez8722@gmil.com',2147483647),('UI31000279','Zainab','zainab7125@gmil.com',2147483647),('UI31100021','Shyam','shyam3988@gmil.com',2147483647),('UI31200030','Ellesha','ellesha3482@gmil.com',2147483647),('UI31300045','Hudson','hudson5961@gmil.com',2147483647),('UI31400018','Debra','debra7724@gmil.com',2147483647),('UI31500057','Dayna','dayna7655@gmil.com',2147483647),('UI31600040','Stott','stott8638@gmil.com',2147483647),('UI31700098','Priya','priya902@gmil.com',2147483647),('UI31800076','Finley','finley2379@gmil.com',2147483647),('UI31900055','Shepard','shepard1306@gmil.com',2147483647),('UI32000066','Bevan','bevan2728@gmil.com',2147483647),('UI32000397','Rosa','rosa8317@gmil.com',2147483647),('UI32100074','Alanna','alanna9105@gmil.com',2147483647),('UI32200099','Maisie','maisie2049@gmil.com',2147483647),('UI32300071','Pearce','pearce6101@gmil.com',2147483647),('UI32400079','Ellesha','ellesha7014@gmil.com',2147483647),('UI32500090','Adamson','adamson4744@gmil.com',2147483647),('UI32600059','Cristian','cristian1191@gmil.co',2147483647),('UI32700092','Mahoney','mahoney4848@gmil.com',2147483647),('UI32800061','Alanna','alanna5717@gmil.com',2147483647),('UI32900022','Summers','summers6466@gmil.com',2147483647),('UI33000086','Dayna','dayna5183@gmil.com',2147483647),('UI33000231','Lancaster','lancaster3260@gmil.c',2147483647),('UI33100072','Esquivel','esquivel1898@gmil.co',2147483647),('UI33200014','Kaiser','kaiser4362@gmil.com',2147483647),('UI33300042','Lynch','lynch7915@gmil.com',2147483647),('UI33400087','Hareem','hareem8349@gmil.com',2147483647),('UI33500081','Jokubas','jokubas9657@gmil.com',2147483647),('UI33600029','Keavy','keavy9194@gmil.com',2147483647),('UI33700077','Franco','franco5483@gmil.com',2147483647),('UI33800086','Zuniga','zuniga8765@gmil.com',2147483647),('UI33900064','Maisie','maisie6995@gmil.com',2147483647),('UI34000063','Colby','colby9688@gmil.com',2147483647),('UI34000321','Aya','aya1055@gmil.com',2147483647),('UI34100084','Siddharth','siddharth5431@gmil.c',2147483647),('UI34200097','Mckenzie','mckenzie7620@gmil.co',2147483647),('UI34300045','North','north1731@gmil.com',2147483647),('UI34400058','Chavez','chavez3577@gmil.com',2147483647),('UI34500014','Karter','karter6730@gmil.com',2147483647),('UI34600099','Rhiannon','rhiannon4133@gmil.co',2147483647),('UI34700057','Escobar','escobar2407@gmil.com',2147483647),('UI34800044','Enrico','enrico6489@gmil.com',2147483647),('UI34900092','Mackie','mackie2518@gmil.com',2147483647),('UI35000097','Darius','darius2851@gmil.com',2147483647),('UI35000290','Shaurya','shaurya5294@gmil.com',2147483647),('UI35100091','Vanesa','vanesa5696@gmil.com',2147483647),('UI35200062','Blankenship','blankenship704@gmil.',2147483647),('UI35300045','Oliver','oliver4003@gmil.com',2147483647),('UI35400073','Joseph','joseph9026@gmil.com',2147483647),('UI35500097','Ahmed','ahmed3601@gmil.com',2147483647),('UI35600053','Terrence','terrence7555@gmil.co',2147483647),('UI35700027','Chavez','chavez2682@gmil.com',2147483647),('UI35800050','Everett','everett2744@gmil.com',2147483647),('UI35900018','Ammaar','ammaar5372@gmil.com',2147483647),('UI36000014','Houghton','houghton7789@gmil.co',2147483647),('UI36000736','Gideon','gideon2779@gmil.com',2147483647),('UI36100012','Morrow','morrow1030@gmil.com',2147483647),('UI36200023','Remi','remi9337@gmil.com',2147483647),('UI36300051','Levine','levine1638@gmil.com',2147483647),('UI36400090','Ray','ray9276@gmil.com',2147483647),('UI36500043','Perez','perez9003@gmil.com',2147483647),('UI36600074','Cotton','cotton7612@gmil.com',2147483647),('UI36700041','Sidrah','sidrah2778@gmil.com',2147483647),('UI36800054','Lucien','lucien2506@gmil.com',2147483647),('UI36900075','Aya','aya3042@gmil.com',2147483647),('UI37000070','Gunn','gunn9135@gmil.com',2147483647),('UI37000209','Jameel','jameel9189@gmil.com',2147483647),('UI37100083','Meera','meera2034@gmil.com',2147483647),('UI37200098','Ammaar','ammaar3181@gmil.com',2147483647),('UI37300078','Cleveland','cleveland4417@gmil.c',2147483647),('UI37400057','Katlyn','katlyn4040@gmil.com',2147483647),('UI37500019','Jamaal','jamaal3647@gmil.com',2147483647),('UI37600048','Lynch','lynch4413@gmil.com',2147483647),('UI37700015','Mcgowan','mcgowan7904@gmil.com',2147483647),('UI37800070','Aguilar','aguilar8427@gmil.com',2147483647),('UI37900081','Kathleen','kathleen5698@gmil.co',2147483647),('UI38000021','Benson','benson4154@gmil.com',2147483647),('UI38000849','Pearce','pearce8172@gmil.com',2147483647),('UI38100046','Antoni','antoni8641@gmil.com',2147483647),('UI38200026','Aydin','aydin4488@gmil.com',2147483647),('UI38300033','Rhona','rhona1907@gmil.com',2147483647),('UI38400073','Rudy','rudy819@gmil.com',2147483647),('UI38500014','Zaynab','zaynab9904@gmil.com',2147483647),('UI38600031','Baker','baker699@gmil.com',2147483647),('UI38700084','Mcauley','mcauley4485@gmil.com',2147483647),('UI38800057','Barajas','barajas5546@gmil.com',2147483647),('UI38900077','Duarte','duarte855@gmil.com',2147483647),('UI39000029','Rudy','rudy2798@gmil.com',2147483647),('UI39000767','Blankenship','blankenship756@gmil.',2147483647),('UI39100081','Stephenson','stephenson1636@gmil.',2147483647),('UI39200090','Merrill','merrill8816@gmil.com',2147483647),('UI39300041','Stott','stott8524@gmil.com',2147483647),('UI39400052','Stott','stott1058@gmil.com',2147483647),('UI39500037','Lawrence','lawrence3756@gmil.co',2147483647),('UI39600094','Ammaar','ammaar4599@gmil.com',2147483647),('UI39700071','Cleveland','cleveland913@gmil.co',2147483647),('UI39800094','Vivienne','vivienne3228@gmil.co',2147483647),('UI39900093','Remi','remi548@gmil.com',2147483647),('UI40000099','Franco','franco563@gmil.com',2147483647),('UI40000566','Zaynab','zaynab3978@gmil.com',2147483647),('UI4000424','Shaurya','shaurya6328@gmil.com',2147483647),('UI40100013','Benitez','benitez9536@gmil.com',2147483647),('UI40200018','Ameera','ameera2888@gmil.com',2147483647),('UI40300029','Cotton','cotton9166@gmil.com',2147483647),('UI40400059','Aimee','aimee2120@gmil.com',2147483647),('UI40500013','Aguilar','aguilar2347@gmil.com',2147483647),('UI40600021','Talley','talley4615@gmil.com',2147483647),('UI40700081','Benitez','benitez5014@gmil.com',2147483647),('UI40800025','Samanta','samanta5934@gmil.com',2147483647),('UI40900050','Aydin','aydin4637@gmil.com',2147483647),('UI41000016','Calhoun','calhoun9853@gmil.com',2147483647),('UI41000975','Junaid','junaid2921@gmil.com',2147483647),('UI41100029','Cabrera','cabrera3672@gmil.com',2147483647),('UI41200096','Dayna','dayna2003@gmil.com',2147483647),('UI41300063','Jameel','jameel7623@gmil.com',2147483647),('UI41400094','Long','long652@gmil.com',2147483647),('UI41500064','Kourtney','kourtney6047@gmil.co',2147483647),('UI4160004','Talley','talley4433@gmil.com',2147483647),('UI41700072','Gideon','gideon2260@gmil.com',2147483647),('UI41800041','Kendra','kendra7800@gmil.com',2147483647),('UI41900088','Zacharia','zacharia2451@gmil.co',2147483647),('UI4200005','Ronaldo','ronaldo7525@gmil.com',2147483647),('UI42000326','Jamaal','jamaal996@gmil.com',2147483647),('UI42100070','Lyra','lyra8354@gmil.com',2147483647),('UI42200056','Mindy','mindy301@gmil.com',2147483647),('UI42300070','Finley','finley1050@gmil.com',2147483647),('UI42400054','Thorpe','thorpe9948@gmil.com',2147483647),('UI42500010','Shyam','shyam1645@gmil.com',2147483647),('UI42600077','Forster','forster9807@gmil.com',2147483647),('UI42700058','Hudson','hudson1800@gmil.com',2147483647),('UI42800069','Debra','debra4165@gmil.com',2147483647),('UI42900062','Pemberton','pemberton9252@gmil.c',2147483647),('UI43000012','Traci','traci443@gmil.com',2147483647),('UI43000118','Eshaal','eshaal2222@gmil.com',2147483647),('UI43100084','Kaiser','kaiser7688@gmil.com',2147483647),('UI43200014','Everett','everett4196@gmil.com',2147483647),('UI43300025','Forbes','forbes3419@gmil.com',2147483647),('UI43400048','Cleveland','cleveland760@gmil.co',2147483647),('UI43500052','Mackie','mackie8416@gmil.com',2147483647),('UI43600052','Vanesa','vanesa7815@gmil.com',2147483647),('UI43700073','Reader','reader1732@gmil.com',2147483647),('UI43800090','Huda','huda1876@gmil.com',2147483647),('UI43900030','Morrow','morrow3090@gmil.com',2147483647),('UI44000045','Julien','julien6307@gmil.com',2147483647),('UI44000416','Ray','ray9522@gmil.com',2147483647),('UI44100085','Zacharia','zacharia2443@gmil.co',2147483647),('UI44200071','Jameel','jameel7337@gmil.com',2147483647),('UI44300016','Priya','priya903@gmil.com',2147483647),('UI44400010','Devan','devan7204@gmil.com',2147483647),('UI44500047','Mcauley','mcauley6481@gmil.com',2147483647),('UI44600063','Darius','darius3263@gmil.com',2147483647),('UI44700012','Finlay','finlay4355@gmil.com',2147483647),('UI44800069','Peck','peck5909@gmil.com',2147483647),('UI44900038','Forbes','forbes6023@gmil.com',2147483647),('UI45000042','Merrill','merrill4458@gmil.com',2147483647),('UI45000302','Colton','colton4661@gmil.com',2147483647),('UI45100071','Gunn','gunn9807@gmil.com',2147483647),('UI45200042','Zuniga','zuniga9484@gmil.com',2147483647),('UI45300058','Aydin','aydin3165@gmil.com',2147483647),('UI45400044','Flynn','flynn1251@gmil.com',2147483647),('UI45500034','Arlo','arlo4274@gmil.com',2147483647),('UI45600050','Forster','forster5028@gmil.com',2147483647),('UI45700067','Stanley','stanley1212@gmil.com',2147483647),('UI45800092','Park','park9762@gmil.com',2147483647),('UI45900011','Taiba','taiba992@gmil.com',2147483647),('UI46000044','Gideon','gideon7261@gmil.com',2147483647),('UI46000197','Butt','butt9617@gmil.com',2147483647),('UI46100020','Colton','colton3551@gmil.com',2147483647),('UI46200086','Arlo','arlo1238@gmil.com',2147483647),('UI46300026','Arran','arran5444@gmil.com',2147483647),('UI46400062','Zaynab','zaynab1340@gmil.com',2147483647),('UI46500074','Forster','forster4262@gmil.com',2147483647),('UI46600054','Love','love1586@gmil.com',2147483647),('UI46700026','Mackie','mackie2936@gmil.com',2147483647),('UI46800044','Acevedo','acevedo5908@gmil.com',2147483647),('UI46900057','Mckenzie','mckenzie1712@gmil.co',2147483647),('UI47000056','Chadwick','chadwick4241@gmil.co',2147483647),('UI47000270','Jimmy','jimmy9488@gmil.com',2147483647),('UI47100088','Terrence','terrence463@gmil.com',2147483647),('UI47200011','Berry','berry7348@gmil.com',2147483647),('UI47300016','Cecelia','cecelia3648@gmil.com',2147483647),('UI47400036','Doherty','doherty7639@gmil.com',2147483647),('UI47500076','Houghton','houghton3407@gmil.co',2147483647),('UI47600058','Rodriguez','rodriguez5289@gmil.c',2147483647),('UI47700023','Acevedo','acevedo8767@gmil.com',2147483647),('UI47800029','Rhiannon','rhiannon8346@gmil.co',2147483647),('UI47900044','Zaynab','zaynab6296@gmil.com',2147483647),('UI48000040','Arjan','arjan9537@gmil.com',2147483647),('UI48000456','Lynch','lynch5106@gmil.com',2147483647),('UI48100097','Lucien','lucien2480@gmil.com',2147483647),('UI48200015','Ray','ray5236@gmil.com',2147483647),('UI48300092','Kailum','kailum3883@gmil.com',2147483647),('UI48400086','Zainab','zainab8905@gmil.com',2147483647),('UI48500041','Shaurya','shaurya9392@gmil.com',2147483647),('UI48600091','Delarosa','delarosa3576@gmil.co',2147483647),('UI48700030','Lina','lina8670@gmil.com',2147483647),('UI48800035','Cleveland','cleveland9345@gmil.c',2147483647),('UI48900022','Rudy','rudy7177@gmil.com',2147483647),('UI49000060','Enrico','enrico7730@gmil.com',2147483647),('UI49000731','Davey','davey4808@gmil.com',2147483647),('UI49100047','Cleveland','cleveland2757@gmil.c',2147483647),('UI49200071','Jamaal','jamaal4259@gmil.com',2147483647),('UI49300044','Levine','levine9561@gmil.com',2147483647),('UI49400088','Berry','berry7843@gmil.com',2147483647),('UI49500092','Benitez','benitez6827@gmil.com',2147483647),('UI49600093','Sidrah','sidrah2944@gmil.com',2147483647),('UI49700074','Lawrence','lawrence2755@gmil.co',2147483647),('UI49800013','Adamson','adamson4864@gmil.com',2147483647),('UI49900062','Antoni','antoni1917@gmil.com',2147483647),('UI50000086','Keri','keri2543@gmil.com',2147483647),('UI50000483','Stanley','stanley4593@gmil.com',2147483647),('UI50006','Melissa','melissa6457@gmil.com',2147483647),('UI50100011','Merrill','merrill3218@gmil.com',2147483647),('UI50200083','Vivienne','vivienne3964@gmil.co',2147483647),('UI50300069','Keavy','keavy4196@gmil.com',2147483647),('UI50400058','Debra','debra1837@gmil.com',2147483647),('UI50500035','Pineda','pineda1041@gmil.com',2147483647),('UI50600068','Sophia','sophia2994@gmil.com',2147483647),('UI50700090','Kaiser','kaiser4823@gmil.com',2147483647),('UI50800039','Daniele','daniele9109@gmil.com',2147483647),('UI50900095','Houghton','houghton6342@gmil.co',2147483647),('UI51000013','Jameel','jameel7947@gmil.com',2147483647),('UI5100091','Shepard','shepard856@gmil.com',2147483647),('UI51100074','Karter','karter6498@gmil.com',2147483647),('UI51200085','Zacharia','zacharia9725@gmil.co',2147483647),('UI51300094','Willard','willard6165@gmil.com',2147483647),('UI51400054','Hammond','hammond7268@gmil.com',2147483647),('UI51500080','Houghton','houghton7749@gmil.co',2147483647),('UI51600027','Vivienne','vivienne8865@gmil.co',2147483647),('UI51700081','Everett','everett1549@gmil.com',2147483647),('UI51800052','Oliver','oliver5818@gmil.com',2147483647),('UI5190006','Traci','traci5481@gmil.com',2147483647),('UI52000088','Axl','axl5592@gmil.com',2147483647),('UI52000201','Perez','perez1868@gmil.com',2147483647),('UI52100084','Barajas','barajas5797@gmil.com',2147483647),('UI52200041','Gideon','gideon8682@gmil.com',2147483647),('UI52300010','Sophia','sophia7393@gmil.com',2147483647),('UI52400058','Blanchard','blanchard2011@gmil.c',2147483647),('UI52500011','Hina','hina3141@gmil.com',2147483647),('UI52600053','Rosa','rosa4502@gmil.com',2147483647),('UI52700015','Mackie','mackie3943@gmil.com',2147483647),('UI52800013','Shyam','shyam4602@gmil.com',2147483647),('UI52900046','Terrence','terrence9072@gmil.co',2147483647),('UI53000011','Barajas','barajas4317@gmil.com',2147483647),('UI53000233','Duran','duran7291@gmil.com',2147483647),('UI53100057','Hawkins','hawkins6809@gmil.com',2147483647),('UI53200040','Thomas','thomas2081@gmil.com',2147483647),('UI53300039','Ahmed','ahmed9411@gmil.com',2147483647),('UI53400020','Cleo','cleo9533@gmil.com',2147483647),('UI53500012','Mahoney','mahoney2619@gmil.com',2147483647),('UI53600038','Tait','tait7792@gmil.com',2147483647),('UI53700013','Frank','frank4840@gmil.com',2147483647),('UI53800010','Jokubas','jokubas8413@gmil.com',2147483647),('UI53900069','Benitez','benitez5049@gmil.com',2147483647),('UI54000058','Harmon','harmon8400@gmil.com',2147483647),('UI54000255','Blankenship','blankenship1169@gmil',2147483647),('UI54100098','Lambert','lambert4497@gmil.com',2147483647),('UI54200019','Forster','forster9509@gmil.com',2147483647),('UI54300060','Emir','emir4184@gmil.com',2147483647),('UI54400099','Samanta','samanta1471@gmil.com',2147483647),('UI54500010','Keavy','keavy3583@gmil.com',2147483647),('UI54600075','Perez','perez7006@gmil.com',2147483647),('UI54700056','Terrence','terrence9825@gmil.co',2147483647),('UI54800042','Stephenson','stephenson7047@gmil.',2147483647),('UI54900046','Rhiannon','rhiannon1411@gmil.co',2147483647),('UI55000077','Cleveland','cleveland1034@gmil.c',2147483647),('UI55000245','Lawrence','lawrence952@gmil.com',2147483647),('UI55100011','Thomas','thomas6634@gmil.com',2147483647),('UI55200074','Lucien','lucien5319@gmil.com',2147483647),('UI55300018','Sanaya','sanaya7500@gmil.com',2147483647),('UI55400035','Jareth','jareth6910@gmil.com',2147483647),('UI55500048','Jimmy','jimmy585@gmil.com',2147483647),('UI55600057','Adamson','adamson7264@gmil.com',2147483647),('UI55700014','Jokubas','jokubas4797@gmil.com',2147483647),('UI55800054','Lina','lina9790@gmil.com',2147483647),('UI55900055','Ronaldo','ronaldo3646@gmil.com',2147483647),('UI56000036','Finley','finley2521@gmil.com',2147483647),('UI56000980','Forster','forster9657@gmil.com',2147483647),('UI56100039','Cabrera','cabrera1545@gmil.com',2147483647),('UI56200028','Ronaldo','ronaldo5151@gmil.com',2147483647),('UI56300062','Daniele','daniele2580@gmil.com',2147483647),('UI56400071','Forbes','forbes2445@gmil.com',2147483647),('UI56500034','Mcauley','mcauley5362@gmil.com',2147483647),('UI56600037','Ahmed','ahmed6910@gmil.com',2147483647),('UI56700016','Robson','robson9068@gmil.com',2147483647),('UI56800079','Pearce','pearce5646@gmil.com',2147483647),('UI56900028','Hudson','hudson8937@gmil.com',2147483647),('UI57000063','Catrina','catrina7987@gmil.com',2147483647),('UI57000456','Frank','frank1014@gmil.com',2147483647),('UI57100068','Debra','debra8890@gmil.com',2147483647),('UI57200046','Franco','franco8399@gmil.com',2147483647),('UI57300092','Terence','terence626@gmil.com',2147483647),('UI57400089','Thomas','thomas5390@gmil.com',2147483647),('UI57500040','Shaurya','shaurya5082@gmil.com',2147483647),('UI57600035','Cabrera','cabrera9856@gmil.com',2147483647),('UI57700062','Kathleen','kathleen4283@gmil.co',2147483647),('UI57800080','Peck','peck8138@gmil.com',2147483647),('UI57900097','Cleo','cleo974@gmil.com',2147483647),('UI58000067','Gunn','gunn570@gmil.com',2147483647),('UI58000475','Rocha','rocha8078@gmil.com',2147483647),('UI58100074','Lyra','lyra5244@gmil.com',2147483647),('UI58200028','Krueger','krueger3696@gmil.com',2147483647),('UI58300057','Antoni','antoni5002@gmil.com',2147483647),('UI58400066','Mahoney','mahoney8121@gmil.com',2147483647),('UI58500021','North','north3832@gmil.com',2147483647),('UI58600092','Sanaya','sanaya2070@gmil.com',2147483647),('UI58700051','Love','love5243@gmil.com',2147483647),('UI58800079','Rocha','rocha4917@gmil.com',2147483647),('UI58900041','Joseph','joseph4465@gmil.com',2147483647),('UI59000095','Patel','patel4645@gmil.com',2147483647),('UI59000405','Sidrah','sidrah6462@gmil.com',2147483647),('UI59100060','Darius','darius1494@gmil.com',2147483647),('UI59200084','Albert','albert7962@gmil.com',2147483647),('UI59300014','Shepard','shepard6952@gmil.com',2147483647),('UI59400093','Kendra','kendra3214@gmil.com',2147483647),('UI59500042','Sophia','sophia1360@gmil.com',2147483647),('UI59600051','Rhiannon','rhiannon1492@gmil.co',2147483647),('UI59700020','Enrico','enrico6085@gmil.com',2147483647),('UI59800028','Cleveland','cleveland6286@gmil.c',2147483647),('UI59900054','Duarte','duarte7239@gmil.com',2147483647),('UI60000061','Sidrah','sidrah9700@gmil.com',2147483647),('UI60000160','Holland','holland3529@gmil.com',2147483647),('UI6000446','May','may7622@gmil.com',2147483647),('UI60100053','Morrow','morrow5557@gmil.com',2147483647),('UI60200022','Lambert','lambert9068@gmil.com',2147483647),('UI60300066','Mckenzie','mckenzie2999@gmil.co',2147483647),('UI60400026','Durham','durham6371@gmil.com',2147483647),('UI60500032','Chad','chad7854@gmil.com',2147483647),('UI60600051','Odonnell','odonnell5887@gmil.co',2147483647),('UI60700084','Aguilar','aguilar6390@gmil.com',2147483647),('UI60800060','Pearce','pearce6461@gmil.com',2147483647),('UI60900023','Priya','priya8114@gmil.com',2147483647),('UI61000067','Mackie','mackie981@gmil.com',2147483647),('UI61000249','Mckenzie','mckenzie9754@gmil.co',2147483647),('UI61100019','Peck','peck2620@gmil.com',2147483647),('UI61200019','Calhoun','calhoun6559@gmil.com',2147483647),('UI61300010','Stott','stott6913@gmil.com',2147483647),('UI61400048','Catrina','catrina9821@gmil.com',2147483647),('UI61500012','Cleo','cleo6668@gmil.com',2147483647),('UI61600087','Lyra','lyra1193@gmil.com',2147483647),('UI61700082','Benitez','benitez6848@gmil.com',2147483647),('UI61800018','Enrico','enrico6241@gmil.com',2147483647),('UI61900084','Morrow','morrow8715@gmil.com',2147483647),('UI62000036','Hawkins','hawkins6996@gmil.com',2147483647),('UI62000480','Stott','stott8583@gmil.com',2147483647),('UI62100016','Blankenship','blankenship4326@gmil',2147483647),('UI62200043','Pemberton','pemberton5069@gmil.c',2147483647),('UI62300051','Joseph','joseph1070@gmil.com',2147483647),('UI62400014','Vivienne','vivienne5796@gmil.co',2147483647),('UI62500043','Elli','elli7003@gmil.com',2147483647),('UI62600070','Figueroa','figueroa1987@gmil.co',2147483647),('UI62700066','Gideon','gideon6228@gmil.com',2147483647),('UI62800023','Rudy','rudy7950@gmil.com',2147483647),('UI62900043','Ameera','ameera9593@gmil.com',2147483647),('UI6300001','Cotton','cotton6844@gmil.com',2147483647),('UI6300089','Catrina','catrina8874@gmil.com',2147483647),('UI63100019','Ray','ray7840@gmil.com',2147483647),('UI63200082','Odonnell','odonnell2671@gmil.co',2147483647),('UI63300094','Julien','julien691@gmil.com',2147483647),('UI63400039','Levine','levine9020@gmil.com',2147483647),('UI63500016','Levi','levi9111@gmil.com',2147483647),('UI63600022','Debra','debra7055@gmil.com',2147483647),('UI63700031','Calhoun','calhoun3870@gmil.com',2147483647),('UI63800013','Priya','priya2300@gmil.com',2147483647),('UI63900094','Perez','perez2129@gmil.com',2147483647),('UI64000053','Cabrera','cabrera3907@gmil.com',2147483647),('UI64000462','Blanchard','blanchard4342@gmil.c',2147483647),('UI64100073','Levine','levine5076@gmil.com',2147483647),('UI64200098','Levine','levine1753@gmil.com',2147483647),('UI64300037','Huda','huda9560@gmil.com',2147483647),('UI64400080','Ahmed','ahmed1052@gmil.com',2147483647),('UI64500014','Debra','debra6937@gmil.com',2147483647),('UI64600066','Forster','forster8585@gmil.com',2147483647),('UI64700075','Katlyn','katlyn1546@gmil.com',2147483647),('UI64800045','Aimee','aimee757@gmil.com',2147483647),('UI64900098','Huda','huda3622@gmil.com',2147483647),('UI65000077','Shepard','shepard8678@gmil.com',2147483647),('UI6500033','Enrico','enrico8362@gmil.com',2147483647),('UI65100066','Terence','terence5849@gmil.com',2147483647),('UI65200091','Chavez','chavez2758@gmil.com',2147483647),('UI65300090','Mahoney','mahoney9552@gmil.com',2147483647),('UI65400079','Lancaster','lancaster911@gmil.co',2147483647),('UI65500066','Chad','chad6019@gmil.com',2147483647),('UI65600091','Chad','chad6997@gmil.com',2147483647),('UI65700050','Patel','patel1700@gmil.com',2147483647),('UI65800079','Pearce','pearce1177@gmil.com',2147483647),('UI65900076','Danyaal','danyaal7394@gmil.com',2147483647),('UI66000026','Mindy','mindy4714@gmil.com',2147483647),('UI66000649','Everett','everett8123@gmil.com',2147483647),('UI66100075','Katlyn','katlyn4705@gmil.com',2147483647),('UI66200013','Phillipa','phillipa9126@gmil.co',2147483647),('UI66300029','Gideon','gideon786@gmil.com',2147483647),('UI66400076','Zaynab','zaynab667@gmil.com',2147483647),('UI66500082','Melissa','melissa9908@gmil.com',2147483647),('UI66600035','Reem','reem7464@gmil.com',2147483647),('UI66700052','Karter','karter5166@gmil.com',2147483647),('UI66800063','Rhiannon','rhiannon4634@gmil.co',2147483647),('UI66900060','Arthur','arthur5411@gmil.com',2147483647),('UI67000033','Calvert','calvert9300@gmil.com',2147483647),('UI67000950','Krisha','krisha903@gmil.com',2147483647),('UI67100057','Arran','arran9729@gmil.com',2147483647),('UI67200048','Vivienne','vivienne7612@gmil.co',2147483647),('UI67300088','Traci','traci9647@gmil.com',2147483647),('UI67400046','Pineda','pineda3537@gmil.com',2147483647),('UI67500051','Zaynab','zaynab4594@gmil.com',2147483647),('UI67600095','Arlo','arlo1208@gmil.com',2147483647),('UI67700062','Jimmy','jimmy6438@gmil.com',2147483647),('UI67800075','Rocha','rocha2562@gmil.com',2147483647),('UI67900088','Julien','julien2898@gmil.com',2147483647),('UI68000015','Grady','grady1494@gmil.com',2147483647),('UI68000418','Kourtney','kourtney9148@gmil.co',2147483647),('UI68100013','Maisie','maisie6903@gmil.com',2147483647),('UI68200051','Hina','hina3950@gmil.com',2147483647),('UI68300049','Bevan','bevan1796@gmil.com',2147483647),('UI68400082','Keavy','keavy7085@gmil.com',2147483647),('UI68500053','Mahoney','mahoney2783@gmil.com',2147483647),('UI68600015','Emir','emir7671@gmil.com',2147483647),('UI68700077','Kathleen','kathleen3052@gmil.co',2147483647),('UI68800040','Patel','patel5744@gmil.com',2147483647),('UI68900053','Jimmy','jimmy3067@gmil.com',2147483647),('UI69000084','Shyam','shyam1105@gmil.com',2147483647),('UI69000165','Aiza','aiza3299@gmil.com',2147483647),('UI69100029','Daniele','daniele6333@gmil.com',2147483647),('UI69200072','Rayner','rayner4548@gmil.com',2147483647),('UI69300075','Shepard','shepard9718@gmil.com',2147483647),('UI69400092','Cabrera','cabrera6836@gmil.com',2147483647),('UI69500015','Danyaal','danyaal7018@gmil.com',2147483647),('UI69600026','Beech','beech7909@gmil.com',2147483647),('UI69700041','Rhona','rhona9888@gmil.com',2147483647),('UI69800069','Emir','emir7305@gmil.com',2147483647),('UI69900011','Ronaldo','ronaldo9833@gmil.com',2147483647),('UI70000018','Gideon','gideon783@gmil.com',2147483647),('UI70000238','Aydin','aydin4604@gmil.com',2147483647),('UI7000582','Odonnell','odonnell9399@gmil.co',2147483647),('UI70100063','Frank','frank2875@gmil.com',2147483647),('UI70200022','Keri','keri6498@gmil.com',2147483647),('UI70300079','Cristian','cristian2122@gmil.co',2147483647),('UI70400097','Dayna','dayna2850@gmil.com',2147483647),('UI70500063','Jokubas','jokubas3249@gmil.com',2147483647),('UI70600048','Krisha','krisha7364@gmil.com',2147483647),('UI70700011','Frank','frank2809@gmil.com',2147483647),('UI70800063','Reader','reader6214@gmil.com',2147483647),('UI70900098','Sidrah','sidrah2059@gmil.com',2147483647),('UI71000061','Franco','franco8872@gmil.com',2147483647),('UI71000920','Dean','dean7107@gmil.com',2147483647),('UI71100090','Mcdaniel','mcdaniel6812@gmil.co',2147483647),('UI71200039','Julien','julien475@gmil.com',2147483647),('UI71300068','Enrico','enrico7593@gmil.com',2147483647),('UI71400097','Hester','hester2431@gmil.com',2147483647),('UI71500081','Sophia','sophia9755@gmil.com',2147483647),('UI71600076','Ameera','ameera8225@gmil.com',2147483647),('UI71700096','Thomas','thomas4159@gmil.com',2147483647),('UI71800040','Shepard','shepard8301@gmil.com',2147483647),('UI71900029','Aimee','aimee8187@gmil.com',2147483647),('UI72000036','Rosa','rosa2649@gmil.com',2147483647),('UI72000427','Aimee','aimee1176@gmil.com',2147483647),('UI72100095','Jimmy','jimmy9835@gmil.com',2147483647),('UI72200028','Davey','davey7005@gmil.com',2147483647),('UI72300050','Pemberton','pemberton9042@gmil.c',2147483647),('UI72400064','Kathleen','kathleen5275@gmil.co',2147483647),('UI72500035','Zacharia','zacharia4710@gmil.co',2147483647),('UI72600093','Benson','benson4036@gmil.com',2147483647),('UI72700040','Mcgowan','mcgowan7695@gmil.com',2147483647),('UI72800021','Joseph','joseph9376@gmil.com',2147483647),('UI72900038','Barajas','barajas9211@gmil.com',2147483647),('UI73000016','Acevedo','acevedo3720@gmil.com',2147483647),('UI73000399','Rocha','rocha2427@gmil.com',2147483647),('UI73100060','Rhiannon','rhiannon8896@gmil.co',2147483647),('UI73200014','Moses','moses8702@gmil.com',2147483647),('UI7330005','Siddharth','siddharth6480@gmil.c',2147483647),('UI73400064','Cabrera','cabrera4103@gmil.com',2147483647),('UI73500035','Daniele','daniele3864@gmil.com',2147483647),('UI73600061','Ahmed','ahmed5604@gmil.com',2147483647),('UI73700065','Ciaran','ciaran7653@gmil.com',2147483647),('UI73800079','Long','long2363@gmil.com',2147483647),('UI73900027','Kailum','kailum1573@gmil.com',2147483647),('UI74000054','Jareth','jareth7303@gmil.com',2147483647),('UI74000416','Jameel','jameel2517@gmil.com',2147483647),('UI74100036','Mahoney','mahoney2924@gmil.com',2147483647),('UI74200039','Katlyn','katlyn4277@gmil.com',2147483647),('UI74300010','Daniele','daniele3293@gmil.com',2147483647),('UI74400040','Mays','mays1460@gmil.com',2147483647),('UI74500096','Ciaran','ciaran2083@gmil.com',2147483647),('UI74600046','Stanley','stanley3105@gmil.com',2147483647),('UI74700091','Cleveland','cleveland3136@gmil.c',2147483647),('UI74800035','Holland','holland446@gmil.com',2147483647),('UI74900058','Arlo','arlo3267@gmil.com',2147483647),('UI75000085','Rudy','rudy4846@gmil.com',2147483647),('UI75000398','Everett','everett6406@gmil.com',2147483647),('UI75100011','Grady','grady5635@gmil.com',2147483647),('UI75200028','Daniele','daniele4694@gmil.com',2147483647),('UI75300038','Taiba','taiba516@gmil.com',2147483647),('UI75400069','Finlay','finlay1897@gmil.com',2147483647),('UI75500042','Cecelia','cecelia9792@gmil.com',2147483647),('UI75600074','Rudy','rudy3134@gmil.com',2147483647),('UI75700013','Acevedo','acevedo1856@gmil.com',2147483647),('UI75800063','Bishop','bishop1964@gmil.com',2147483647),('UI7590000','Shaurya','shaurya7692@gmil.com',2147483647),('UI76000082','Bevan','bevan320@gmil.com',2147483647),('UI76000427','Emir','emir7353@gmil.com',2147483647),('UI76100065','Sidrah','sidrah6460@gmil.com',2147483647),('UI76200053','Jokubas','jokubas8106@gmil.com',2147483647),('UI76300086','Zuniga','zuniga590@gmil.com',2147483647),('UI76400095','Davey','davey4409@gmil.com',2147483647),('UI76500012','Lawrence','lawrence3546@gmil.co',2147483647),('UI76600036','Pemberton','pemberton7588@gmil.c',2147483647),('UI76700061','Aimee','aimee2385@gmil.com',2147483647),('UI76800023','Adamson','adamson8669@gmil.com',2147483647),('UI76900017','Cecelia','cecelia4055@gmil.com',2147483647),('UI77000015','Ciaran','ciaran6100@gmil.com',2147483647),('UI7700055','Duran','duran4386@gmil.com',2147483647),('UI77100040','Bevan','bevan7971@gmil.com',2147483647),('UI77200050','Finlay','finlay7408@gmil.com',2147483647),('UI77300025','Rayner','rayner7769@gmil.com',2147483647),('UI77400051','Hester','hester9872@gmil.com',2147483647),('UI77500079','Meera','meera9295@gmil.com',2147483647),('UI77600055','Long','long1527@gmil.com',2147483647),('UI77700063','Hester','hester7054@gmil.com',2147483647),('UI77800054','Maynard','maynard3343@gmil.com',2147483647),('UI77900060','Summers','summers463@gmil.com',2147483647),('UI78000032','Shepard','shepard8665@gmil.com',2147483647),('UI7800015','Summers','summers4629@gmil.com',2147483647),('UI78100023','Mays','mays5045@gmil.com',2147483647),('UI78200024','Krueger','krueger9518@gmil.com',2147483647),('UI78300039','Reynolds','reynolds7580@gmil.co',2147483647),('UI78400072','Vanesa','vanesa3684@gmil.com',2147483647),('UI78500020','Rayner','rayner9656@gmil.com',2147483647),('UI78600072','Karter','karter5284@gmil.com',2147483647),('UI78700040','Love','love3606@gmil.com',2147483647),('UI78800079','Acevedo','acevedo9599@gmil.com',2147483647),('UI78900074','Morrow','morrow3118@gmil.com',2147483647),('UI79000020','Mays','mays3328@gmil.com',2147483647),('UI79000233','Beech','beech4481@gmil.com',2147483647),('UI79100018','Stott','stott898@gmil.com',2147483647),('UI79200046','Levine','levine6662@gmil.com',2147483647),('UI79300055','Cabrera','cabrera9021@gmil.com',2147483647),('UI79400021','Lina','lina619@gmil.com',2147483647),('UI79500078','Finley','finley494@gmil.com',2147483647),('UI79600083','Devan','devan2796@gmil.com',2147483647),('UI79700091','Colby','colby9701@gmil.com',2147483647),('UI79800094','Aydin','aydin3961@gmil.com',2147483647),('UI79900051','Butt','butt339@gmil.com',2147483647),('UI80000049','Katlyn','katlyn3941@gmil.com',2147483647),('UI80000191','Barajas','barajas4757@gmil.com',2147483647),('UI8000573','Carson','carson7822@gmil.com',2147483647),('UI80100065','Summers','summers4080@gmil.com',2147483647),('UI80200045','Pearce','pearce5966@gmil.com',2147483647),('UI80300021','Zaynab','zaynab4092@gmil.com',2147483647),('UI80400056','White','white4496@gmil.com',2147483647),('UI80500083','Rocha','rocha8451@gmil.com',2147483647),('UI80600010','Rayner','rayner3145@gmil.com',2147483647),('UI80700011','Terence','terence330@gmil.com',2147483647),('UI80800052','Kathleen','kathleen7838@gmil.co',2147483647),('UI80900011','Bishop','bishop5703@gmil.com',2147483647),('UI81000036','Sidrah','sidrah6012@gmil.com',2147483647),('UI81000706','Mindy','mindy7913@gmil.com',2147483647),('UI81100058','Cristian','cristian8660@gmil.co',2147483647),('UI81200035','Emir','emir4096@gmil.com',2147483647),('UI81300059','Zaynab','zaynab8356@gmil.com',2147483647),('UI81400075','Thorpe','thorpe4637@gmil.com',2147483647),('UI81500044','Esquivel','esquivel6835@gmil.co',2147483647),('UI81600082','Patel','patel473@gmil.com',2147483647),('UI81700097','Karter','karter4463@gmil.com',2147483647),('UI81800010','Finley','finley362@gmil.com',2147483647),('UI81900032','Carson','carson3295@gmil.com',2147483647),('UI82000053','Karter','karter2429@gmil.com',2147483647),('UI82000977','Lucien','lucien2693@gmil.com',2147483647),('UI82100071','Barnaby','barnaby1371@gmil.com',2147483647),('UI82200096','Reader','reader5999@gmil.com',2147483647),('UI82300047','Espinoza','espinoza4069@gmil.co',2147483647),('UI82400069','Ameera','ameera2736@gmil.com',2147483647),('UI82500039','Mays','mays8083@gmil.com',2147483647),('UI82600079','Stephenson','stephenson3797@gmil.',2147483647),('UI82700081','Mahoney','mahoney8221@gmil.com',2147483647),('UI82800059','Enrico','enrico7479@gmil.com',2147483647),('UI82900031','Duarte','duarte6219@gmil.com',2147483647),('UI83000076','White','white9936@gmil.com',2147483647),('UI83000735','Hester','hester2920@gmil.com',2147483647),('UI83100044','Beech','beech4176@gmil.com',2147483647),('UI83200076','Forster','forster1618@gmil.com',2147483647),('UI83300037','Franco','franco8488@gmil.com',2147483647),('UI83400059','Ahmed','ahmed2052@gmil.com',2147483647),('UI83500082','Pemberton','pemberton4510@gmil.c',2147483647),('UI83600013','Chadwick','chadwick5219@gmil.co',2147483647),('UI83700060','Forbes','forbes2394@gmil.com',2147483647),('UI83800046','Hareem','hareem2830@gmil.com',2147483647),('UI83900027','Thomas','thomas3138@gmil.com',2147483647),('UI84000078','Frost','frost7847@gmil.com',2147483647),('UI84000492','Lina','lina6832@gmil.com',2147483647),('UI84100062','Calvert','calvert8062@gmil.com',2147483647),('UI84200076','Cabrera','cabrera6505@gmil.com',2147483647),('UI84300085','Rodriguez','rodriguez2689@gmil.c',2147483647),('UI84400024','Chad','chad3385@gmil.com',2147483647),('UI84500081','Calvert','calvert1636@gmil.com',2147483647),('UI84600050','Keri','keri1281@gmil.com',2147483647),('UI84700071','Blankenship','blankenship8502@gmil',2147483647),('UI84800063','Shepard','shepard4879@gmil.com',2147483647),('UI84900048','Ellesha','ellesha398@gmil.com',2147483647),('UI85000065','Griffin','griffin7224@gmil.com',2147483647),('UI85000517','Shaurya','shaurya4981@gmil.com',2147483647),('UI85100062','Siddharth','siddharth1231@gmil.c',2147483647),('UI85200032','Cleo','cleo9920@gmil.com',2147483647),('UI85300054','Pemberton','pemberton2946@gmil.c',2147483647),('UI85400069','Priya','priya7016@gmil.com',2147483647),('UI85500019','Huda','huda3238@gmil.com',2147483647),('UI85600028','Hina','hina846@gmil.com',2147483647),('UI85700033','Butt','butt534@gmil.com',2147483647),('UI85800038','Kailum','kailum2596@gmil.com',2147483647),('UI85900020','Frank','frank2420@gmil.com',2147483647),('UI86000013','Shaurya','shaurya6044@gmil.com',2147483647),('UI8600021','Darius','darius2909@gmil.com',2147483647),('UI86100042','Maisie','maisie7107@gmil.com',2147483647),('UI86200028','Samanta','samanta4013@gmil.com',2147483647),('UI86300061','Arran','arran1663@gmil.com',2147483647),('UI86400047','Arran','arran8948@gmil.com',2147483647),('UI86500092','Everett','everett4469@gmil.com',2147483647),('UI86600090','Keri','keri1465@gmil.com',2147483647),('UI86700041','Julien','julien4444@gmil.com',2147483647),('UI86800096','Stott','stott9810@gmil.com',2147483647),('UI86900073','Sidrah','sidrah1334@gmil.com',2147483647),('UI87000053','Arjan','arjan9328@gmil.com',2147483647),('UI87000676','Antoni','antoni5999@gmil.com',2147483647),('UI87100042','Maisie','maisie7803@gmil.com',2147483647),('UI87200075','Ameera','ameera9081@gmil.com',2147483647),('UI87300088','Vivaan','vivaan6095@gmil.com',2147483647),('UI87400058','Julien','julien8739@gmil.com',2147483647),('UI87500030','Dayna','dayna7649@gmil.com',2147483647),('UI87600054','Rudy','rudy5411@gmil.com',2147483647),('UI87700085','Park','park4005@gmil.com',2147483647),('UI87800067','Joseph','joseph5959@gmil.com',2147483647),('UI87900017','Ciaran','ciaran1633@gmil.com',2147483647),('UI88000025','Rhona','rhona1287@gmil.com',2147483647),('UI88000544','Morrow','morrow3646@gmil.com',2147483647),('UI88100051','Hester','hester7083@gmil.com',2147483647),('UI88200012','Lancaster','lancaster9416@gmil.c',2147483647),('UI88300021','Beech','beech6102@gmil.com',2147483647),('UI88400024','Cabrera','cabrera4105@gmil.com',2147483647),('UI8850009','Jareth','jareth1845@gmil.com',2147483647),('UI88600060','Benitez','benitez4256@gmil.com',2147483647),('UI88700051','Ahmed','ahmed7853@gmil.com',2147483647),('UI88800025','Melissa','melissa3415@gmil.com',2147483647),('UI88900095','Lawrence','lawrence5660@gmil.co',2147483647),('UI89000069','Hudson','hudson5469@gmil.com',2147483647),('UI89000573','Shaurya','shaurya7139@gmil.com',2147483647),('UI89100011','Catrina','catrina1923@gmil.com',2147483647),('UI89200084','Kathleen','kathleen3767@gmil.co',2147483647),('UI89300038','Stott','stott5559@gmil.com',2147483647),('UI89400084','Mckenzie','mckenzie7634@gmil.co',2147483647),('UI89500026','Frank','frank4372@gmil.com',2147483647),('UI89600016','Sanaya','sanaya5991@gmil.com',2147483647),('UI89700047','Axl','axl3942@gmil.com',2147483647),('UI89800022','Lyra','lyra4136@gmil.com',2147483647),('UI89900046','Morrow','morrow4622@gmil.com',2147483647),('UI90000095','Cleo','cleo5556@gmil.com',2147483647),('UI900004','Lambert','lambert4650@gmil.com',2147483647),('UI900029','Cristian','cristian750@gmil.com',2147483647),('UI90100020','Levi','levi1081@gmil.com',2147483647),('UI90200036','Finley','finley9228@gmil.com',2147483647),('UI90300037','Everett','everett9838@gmil.com',2147483647),('UI90400047','Aria','aria721@gmil.com',2147483647),('UI90500027','Ammaar','ammaar5710@gmil.com',2147483647),('UI90600073','Oliver','oliver1084@gmil.com',2147483647),('UI90700059','Stanley','stanley6576@gmil.com',2147483647),('UI90800059','Lynch','lynch4497@gmil.com',2147483647),('UI90900080','Kourtney','kourtney8825@gmil.co',2147483647),('UI91000080','Zacharia','zacharia2336@gmil.co',2147483647),('UI91000574','Kourtney','kourtney6786@gmil.co',2147483647),('UI91100052','Maynard','maynard4040@gmil.com',2147483647),('UI91200068','Vivaan','vivaan1400@gmil.com',2147483647),('UI91300068','Rodriguez','rodriguez3016@gmil.c',2147483647),('UI91400079','Axl','axl6207@gmil.com',2147483647),('UI91500025','Lawrence','lawrence3946@gmil.co',2147483647),('UI91600037','Vanesa','vanesa9757@gmil.com',2147483647),('UI91700022','Frank','frank5722@gmil.com',2147483647),('UI91800037','Shyam','shyam8196@gmil.com',2147483647),('UI91900040','Shepard','shepard1131@gmil.com',2147483647),('UI92000019','Houghton','houghton3091@gmil.co',2147483647),('UI92000978','Katlyn','katlyn476@gmil.com',2147483647),('UI92100063','Morrow','morrow5687@gmil.com',2147483647),('UI92200086','Hareem','hareem9789@gmil.com',2147483647),('UI92300081','Barnaby','barnaby2725@gmil.com',2147483647),('UI92400052','Daniele','daniele4105@gmil.com',2147483647),('UI92500037','Jamaal','jamaal3020@gmil.com',2147483647),('UI92600057','Traci','traci1531@gmil.com',2147483647),('UI92700071','Catrina','catrina3999@gmil.com',2147483647),('UI92800047','Sidrah','sidrah7812@gmil.com',2147483647),('UI92900072','Perez','perez6263@gmil.com',2147483647),('UI93000068','Summers','summers6757@gmil.com',2147483647),('UI93000703','Samanta','samanta7267@gmil.com',2147483647),('UI93100040','Huda','huda5426@gmil.com',2147483647),('UI93200023','Mayer','mayer6141@gmil.com',2147483647),('UI93300095','Krueger','krueger9919@gmil.com',2147483647),('UI93400015','Julien','julien7681@gmil.com',2147483647),('UI93500078','Frank','frank1574@gmil.com',2147483647),('UI93600099','Stephenson','stephenson8566@gmil.',2147483647),('UI93700024','Ameera','ameera8883@gmil.com',2147483647),('UI93800017','Arlo','arlo1165@gmil.com',2147483647),('UI93900080','Hina','hina6915@gmil.com',2147483647),('UI94000088','Priya','priya8275@gmil.com',2147483647),('UI94000393','Odonnell','odonnell6007@gmil.co',2147483647),('UI94100013','Debra','debra8602@gmil.com',2147483647),('UI94200094','Zainab','zainab5753@gmil.com',2147483647),('UI9430001','Harriette','harriette7504@gmil.c',2147483647),('UI94400096','Jameel','jameel3760@gmil.com',2147483647),('UI94500099','Ronaldo','ronaldo3607@gmil.com',2147483647),('UI94600090','Antoni','antoni3426@gmil.com',2147483647),('UI94700038','Rhona','rhona657@gmil.com',2147483647),('UI94800070','Aiza','aiza6277@gmil.com',2147483647),('UI94900049','Zuniga','zuniga4225@gmil.com',2147483647),('UI95000027','Rocha','rocha5272@gmil.com',2147483647),('UI95000665','Hawkins','hawkins4092@gmil.com',2147483647),('UI95100088','Blanchard','blanchard1100@gmil.c',2147483647),('UI95200050','Benitez','benitez3563@gmil.com',2147483647),('UI95300056','Flynn','flynn2753@gmil.com',2147483647),('UI95400043','Junaid','junaid6721@gmil.com',2147483647),('UI95500038','White','white1884@gmil.com',2147483647),('UI95600039','Eshaal','eshaal9484@gmil.com',2147483647),('UI95700041','Frank','frank6491@gmil.com',2147483647),('UI95800021','Eshaal','eshaal4165@gmil.com',2147483647),('UI95900015','Adamson','adamson7049@gmil.com',2147483647),('UI96000022','Figueroa','figueroa7674@gmil.co',2147483647),('UI960007','Benson','benson2265@gmil.com',2147483647),('UI96100046','Baker','baker847@gmil.com',2147483647),('UI96200011','Blankenship','blankenship4262@gmil',2147483647),('UI96300069','Reem','reem4953@gmil.com',2147483647),('UI96400058','Rudy','rudy7992@gmil.com',2147483647),('UI96500070','Baker','baker2612@gmil.com',2147483647),('UI9660002','Maynard','maynard3108@gmil.com',2147483647),('UI96700059','Keavy','keavy4917@gmil.com',2147483647),('UI96800023','Delarosa','delarosa1907@gmil.co',2147483647),('UI96900095','Ammaar','ammaar6957@gmil.com',2147483647),('UI97000098','Mckenzie','mckenzie5969@gmil.co',2147483647),('UI97000899','Love','love9282@gmil.com',2147483647),('UI97100083','Krueger','krueger487@gmil.com',2147483647),('UI97200057','Harmon','harmon1379@gmil.com',2147483647),('UI97300099','Willard','willard4711@gmil.com',2147483647),('UI97400027','Grady','grady3502@gmil.com',2147483647),('UI97500081','Kaiser','kaiser398@gmil.com',2147483647),('UI97600052','Katlyn','katlyn9927@gmil.com',2147483647),('UI97700027','Katlyn','katlyn765@gmil.com',2147483647),('UI97800050','Levine','levine3546@gmil.com',2147483647),('UI97900052','Morrow','morrow1783@gmil.com',2147483647),('UI98000078','Samual','samual7611@gmil.com',2147483647),('UI98000987','Adamson','adamson3458@gmil.com',2147483647),('UI98100074','Traci','traci4249@gmil.com',2147483647),('UI98200022','Butt','butt7731@gmil.com',2147483647),('UI98300060','Harmon','harmon831@gmil.com',2147483647),('UI98400090','Lyra','lyra3375@gmil.com',2147483647),('UI98500066','Frost','frost7518@gmil.com',2147483647),('UI98600081','Keri','keri4701@gmil.com',2147483647),('UI98700079','Sanaya','sanaya3492@gmil.com',2147483647),('UI98800033','Thomas','thomas3658@gmil.com',2147483647),('UI98900078','Mahoney','mahoney3097@gmil.com',2147483647),('UI99000075','Antoni','antoni5833@gmil.com',2147483647),('UI99000898','Terence','terence8989@gmil.com',2147483647),('UI99100066','Hammond','hammond5599@gmil.com',2147483647),('UI99200063','Rosa','rosa385@gmil.com',2147483647),('UI99300041','Merrill','merrill4185@gmil.com',2147483647),('UI99400026','Terrence','terrence7193@gmil.co',2147483647),('UI99500042','Taiba','taiba2142@gmil.com',2147483647),('UI99600047','Arthur','arthur5645@gmil.com',2147483647),('UI99700041','Kailum','kailum7234@gmil.com',2147483647),('UI99800090','Stott','stott1629@gmil.com',2147483647),('UI99900092','Hammond','hammond9838@gmil.com',2147483647);


DROP TABLE IF EXISTS `accounts`;


CREATE TABLE accounts (
  customer_id varchar(10) NOT NULL,
  account_number bigint DEFAULT NULL,
  discount_issued int NOT NULL,
  wallet_balance int NOT NULL,
  UNIQUE KEY (account_number),
  Primary KEY(customer_id),
  CONSTRAINT accounts_ibfk_1 FOREIGN KEY (customer_id) REFERENCES customer_profile(customer_id)
);#ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO accounts VALUES ('UI0811',2147483647,3670,527),('UI1000706',293991863318914,3850,535),('UI2000536',293996505681115,3860,832),('UI3000495',293997057398085,3700,1070),('UI4000424',293998468795380,3600,670),('UI50006',293994954953307,3750,781),('UI6000446',293992413648967,3700,841),('UI7000582',293992009768509,3410,565),('UI8000573',293999934061769,3980,1005),('UI900029',293996149167146,3200,760),('UI1000023',293997850336373,3640,287),('UI11000447',293993022022575,3910,783),('UI12000592',293991527432797,3370,882),('UI13000827',293997715561674,3010,1162),('UI14000326',293993239336799,3540,424),('UI15000740',293998731566632,3340,848),('UI16000751',293999779667669,3720,960),('UI17000151',293998656797944,3600,246),('UI18000288',293997481746993,3840,216),('UI19000292',293994652038132,3170,1040),('UI20000575',293991539122749,3450,220),('UI21000646',293997871385337,3590,611),('UI22000648',29399318655550,3680,101),('UI23000810',293991485657855,3750,580),('UI24000738',293992613099724,3980,402),('UI25000243',29399463889305,3030,109),('UI2600031',293999046594830,3880,288),('UI2700041',293999245138833,3340,809),('UI28000258',293995236940351,3710,631),('UI29000831',293991607886228,3480,450),('UI30000407',293997326974987,3840,1017),('UI31000279',293997385451366,3410,668),('UI32000397',293993313750687,3830,900),('UI33000231',293991326698604,3210,863),('UI34000321',293999478180165,3340,354),('UI35000290',293998653637341,3210,156),('UI36000736',293996606914408,3040,511),('UI37000209',293997028664361,3010,70),('UI38000849',293995477955695,3830,28),('UI39000767',293994953522508,3250,881),('UI40000566',293999404560717,3810,81),('UI41000975',293995064044559,3020,1098),('UI42000326',293991208356980,3920,1071),('UI43000118',293994778944405,3670,425),('UI44000416',293997358262288,3830,1006),('UI45000302',29399856474787,3090,587),('UI46000197',293992850742899,3590,215),('UI47000270',293992388478370,3820,1138),('UI48000456',293997052139659,3980,1134),('UI49000731',293995883159491,3020,150),('UI50000483',293994129543953,3720,89),('UI5100091',293994029857405,3090,231),('UI52000201',293993566723923,3250,892),('UI53000233',293996595556155,3870,39),('UI54000255',29399876013328,3790,614),('UI55000245',293992968062740,3270,367),('UI56000980',293992430817604,3420,581),('UI57000456',293997811554451,3200,391),('UI58000475',293995375992716,3820,142),('UI59000405',293997466065263,3460,1200),('UI60000160',293991962252501,3720,26),('UI61000249',29399800736449,3770,61),('UI62000480',293994220186104,3470,462),('UI6300089',293999948726321,3650,769),('UI64000462',293996002066535,3550,112),('UI6500033',293994237147342,3900,492),('UI66000649',293997300987232,3400,390),('UI67000950',293994655270607,3070,746),('UI68000418',293993132436192,3570,633),('UI69000165',293991059656523,3990,263),('UI70000238',29399259133920,3160,428),('UI71000920',293995770464478,3520,872),('UI72000427',293995687858003,3510,422),('UI73000399',293992095836618,3130,370),('UI74000416',293999418957632,3550,342),('UI75000398',293991082452096,3200,1088),('UI76000427',293999619330749,3360,579),('UI7700055',293993568934872,3760,1071),('UI7800015',293992246213559,3280,552),('UI79000233',293994595914121,3120,319),('UI80000191',293994357284428,3770,337),('UI81000706',293999500956221,3520,1161),('UI82000977',293993811195190,3410,952),('UI83000735',293991615931791,3320,210),('UI84000492',293995910060343,3170,1078),('UI85000517',293999955139646,3320,409),('UI8600021',293992459338060,3230,594),('UI87000676',293994685990984,3750,99),('UI88000544',293996372839107,3930,553),('UI89000573',293991368620729,3980,665),('UI900004',293993064554608,3490,288),('UI91000574',293991278392890,3180,646),('UI92000978',293999020041362,3140,612),('UI93000703',293993143595571,3680,552),('UI94000393',293996325430551,3730,1193),('UI95000665',293991939038203,3650,157),('UI960007',293994921914364,3790,1062),('UI97000899',293992059217873,3820,670),('UI98000987',29399575731300,3510,926),('UI99000898',293995511914968,3350,277),('UI10000035',293993093922937,3750,926),('UI10100086',293996254595146,3540,470),('UI10200037',293998541961844,3030,280),('UI10300072',293996255871788,3130,794),('UI10400053',293993521041073,3720,491),('UI10500059',293996098126994,3120,784),('UI10600043',293991577770035,3410,1104),('UI10700015',293991217343925,3850,866),('UI10800046',293994786791520,3070,463),('UI10900013',293997576854135,3440,991),('UI11000097',293992772980728,3360,394),('UI11100033',293999789388250,3930,770),('UI11200016',293991297048829,3030,115),('UI11300083',293997569584288,3790,1002),('UI11400034',293997958071889,3670,785),('UI11500072',293997312141760,3710,1136),('UI11600014',293992532388503,3150,371),('UI11700095',293995220351366,3540,1057),('UI11800069',29399990973901,3600,386),('UI11900051',293998903068105,3570,82),('UI12000071',293993644288096,3390,411),('UI12100028',293994268647424,3030,768),('UI12200021',29399925767994,3720,622),('UI12300073',293998009823711,3090,153),('UI12400030',293998168362397,3110,1140),('UI12500071',293995937086447,3740,60),('UI12600080',293997298963748,3110,488),('UI1270008',293994404518183,3970,932),('UI12800092',293994172125797,3170,73),('UI12900088',293996441375612,3290,9),('UI13000069',293991960075568,3920,528),('UI13100050',293991191227413,3870,258),('UI13200043',293996531125715,3750,450),('UI13300075',293991370871136,3830,1055),('UI13400064',293991254134676,3250,841),('UI13500070',293994862619594,3790,909),('UI13600048',293992344191443,3840,929),('UI13700042',293992383394610,3360,223),('UI13800085',293996210620105,3210,453),('UI13900010',293999449086074,3140,207),('UI14000023',293998085340735,3450,1065),('UI14100076',293998410975775,3480,59),('UI14200016',293991659424592,3020,922),('UI14300047',293993245993889,3810,513),('UI14400050',293992908668584,3370,1080),('UI14500062',293993210420168,3780,906),('UI14600045',293996071251105,3160,1095),('UI14700047',293994600790078,3600,224),('UI14800089',293994948961105,3720,183),('UI14900098',293992940798442,3040,121),('UI15000074',293996863013293,3500,862),('UI15100075',293995544886341,3910,176),('UI15200087',293991244749937,3980,24),('UI15300032',293993887791937,3440,546),('UI15400042',293999510831138,3400,929),('UI15500064',293992592931989,3130,517),('UI15600081',293996872738168,3970,437),('UI15700055',293998389836634,3290,889),('UI15800052',293996965059490,3590,860),('UI15900033',29399933945308,3830,72),('UI16000056',293996901737382,3340,755),('UI16100045',293996935866226,3260,329),('UI16200071',293999902757237,3150,883),('UI16300061',293994700585672,3720,133),('UI16400045',293994507915916,3190,741),('UI16500048',293999030955434,3850,613),('UI16600072',293998910535434,3230,469),('UI16700010',293995275195896,3620,41),('UI16800072',293996854142647,3020,32),('UI16900040',293996969064331,3840,626),('UI17000037',293998464231826,3570,301),('UI17100089',293999175329221,3930,477),('UI17200012',293996502013465,3750,176),('UI17300022',293997262638863,3740,824),('UI17400060',293997346699862,3680,476),('UI17500087',293993518959456,3760,453),('UI17600049',293996596560849,3310,77),('UI17700027',293991515180482,3860,195),('UI17800022',293997726139393,3170,7),('UI17900040',293995330130778,3260,1012),('UI18000093',293999128643116,3710,471),('UI18100014',293997303264345,3670,128),('UI18200078',29399500355387,3600,58),('UI18300079',29399359842645,3310,475),('UI18400016',293992297346183,3430,718),('UI18500055',293993648678459,3840,154),('UI18600045',293997776685808,3430,773),('UI18700030',29399994929339,3940,1114),('UI18800044',29399955671680,3050,727),('UI18900029',293992265895172,3090,836),('UI19000056',293995992679436,3710,646),('UI19100045',293997285552604,3570,960),('UI1920008',293996680249013,3250,1085),('UI19300061',29399789171576,3160,543),('UI19400032',293995624043352,3960,304),('UI19500055',293993230713117,3250,663),('UI19600061',293995633045190,3100,615),('UI19700079',293993116139283,3880,419),('UI19800045',293997865022301,3310,592),('UI19900047',293995755274654,3180,920),('UI20000099',293991013717566,3460,68),('UI20100084',293995256942106,3830,508),('UI20200060',293992497184014,3190,227),('UI20300058',293993662173572,3840,1155),('UI20400069',293995128213966,3420,312),('UI2050002',293996880025905,3470,74),('UI20600063',293991548323411,3670,779),('UI20700065',293991639356159,3170,802),('UI20800081',293997575350010,3720,572),('UI20900087',293991728752099,3850,407),('UI21000027',293991981758727,3340,189),('UI21100021',293993764415814,3920,574),('UI21200023',293995177564005,3830,171),('UI21300019',293998216450644,3790,544),('UI21400071',293996705648913,3000,135),('UI21500090',293997985582996,3990,902),('UI21600089',293994217133295,3190,1007),('UI21700030',293993848655690,3770,609),('UI21800013',293994842988419,3070,38),('UI21900099',293996471765681,3050,226),('UI22000053',293993321834838,3920,156),('UI22100043',293998000574623,3130,473),('UI22200013',293995166141436,3610,576),('UI22300041',293996317689721,3960,1165),('UI22400045',293996400293820,3810,90),('UI22500019',293993219780389,3610,980),('UI22600025',293996366834222,3840,727),('UI22700070',293991845290932,3860,1121),('UI22800014',293996503180584,3620,1142),('UI22900074',293998412616934,3570,12),('UI23000014',293999839289798,3370,408),('UI23100036',293995794770829,3160,381),('UI23200048',293998743362856,3740,942),('UI23300091',293998939299913,3500,526),('UI23400028',293995541577241,3220,642),('UI23500028',293999726928870,3040,398),('UI23600054',293995704997613,3810,595),('UI23700013',293995049275869,3470,356),('UI23800039',293997815430821,3510,441),('UI23900073',29399490231504,3120,57),('UI24000078',293998457745546,3060,196),('UI24100025',293992887780505,3550,713),('UI24200063',293992392780661,3860,380),('UI24300060',293991617353248,3550,58),('UI24400062',293998797275478,3130,527),('UI24500054',293995536735992,3580,285),('UI24600037',293998824216017,3080,571),('UI24700088',293991995959707,3930,737),('UI24800046',293999356794441,3970,1163),('UI24900023',293995243235325,3030,1003),('UI25000091',293998261270312,3530,1080),('UI25100031',293996596497613,3190,538),('UI25200045',29399874369262,3730,266),('UI25300099',293997567693125,3530,1119),('UI25400042',293995335860436,3700,377),('UI25500059',293993400349970,3310,1071),('UI25600067',293994923740832,3010,324),('UI25700012',293993749147955,3000,1101),('UI25800010',293999326635818,3340,341),('UI25900023',293999973026404,3090,975),('UI26000078',293992726072696,3120,916),('UI26100072',293994347599393,3340,955),('UI26200086',293998226084327,3810,779),('UI26300025',293998249911485,3600,432),('UI26400093',293998494540339,3800,994),('UI26500089',293995973352652,3520,185),('UI26600043',293998800219313,3120,418),('UI26700065',293991177671736,3010,999),('UI26800095',293999294115453,3290,407),('UI26900049',293996885891179,3080,1175),('UI27000018',293995478150715,3120,705),('UI27100043',293999044577353,3010,1085),('UI27200084',293992109698685,3550,1143),('UI27300061',293995323969269,3630,381),('UI27400044',293991702795673,3950,905),('UI27500047',293991230192300,3030,1113),('UI27600067',293996015823379,3070,718),('UI27700023',293991242928351,3040,151),('UI27800078',293992409361373,3290,47),('UI27900076',293999537742914,3060,929),('UI28000019',293997478836950,3750,482),('UI28100017',293991345789018,3490,467),('UI28200064',29399485064854,3320,1099),('UI28300071',293998966572587,3440,1199),('UI28400070',293996744455386,3850,764),('UI28500019',29399890197604,3970,254),('UI28600083',293993618373814,3520,845),('UI28700079',293992497551852,3260,3),('UI28800010',293993569766170,3940,632),('UI28900047',293994759311612,3610,957),('UI29000099',293997432765205,3170,1064),('UI29100026',293994059797521,3210,278),('UI29200056',293991451417292,3870,67),('UI29300070',293997492189368,3190,699),('UI29400067',293997539683433,3970,630),('UI29500046',293994337761143,3340,536),('UI29600096',293995413384821,3910,75),('UI29700020',293997484897074,3990,887),('UI29800028',293992912033339,3010,341),('UI29900075',293993114572158,3870,813),('UI30000075',293995283959743,3550,1035),('UI30100060',293996059881536,3940,678),('UI30200043',29399336124324,3260,339),('UI30300082',293992999745369,3580,570),('UI30400060',293996303720904,3510,75),('UI30500013',293996407088485,3930,356),('UI30600087',293991142051154,3250,752),('UI30700054',293991721839539,3660,241),('UI30800086',293994749840100,3710,697),('UI30900071',293996394256361,3180,630),('UI31000057',293994141136450,3720,39),('UI31100021',293996456174792,3710,1047),('UI31200030',293998513391077,3160,367),('UI31300045',293995376630390,3560,925),('UI31400018',293997983142895,3360,274),('UI31500057',293993643697619,3610,776),('UI31600040',293993673566918,3120,296),('UI31700098',293994901783263,3430,1098),('UI31800076',293997935253487,3120,956),('UI31900055',293994745550316,3410,1109),('UI32000066',293999351372751,3130,797),('UI32100074',293996581361398,3990,115),('UI32200099',293992300154830,3160,641),('UI32300071',293998430674238,3480,990),('UI32400079',293999127368131,3260,47),('UI32500090',293994722384940,3440,1179),('UI32600059',29399358897112,3190,652),('UI32700092',293991012019805,3020,158),('UI32800061',293998157822214,3480,936),('UI32900022',293994192191485,3200,988),('UI33000086',293994041775971,3730,709),('UI33100072',293997498335767,3320,898),('UI33200014',293996653883613,3320,742),('UI33300042',293997423180735,3810,852),('UI33400087',293994427624373,3840,623),('UI33500081',293993902036870,3810,1110),('UI33600029',293996090480458,3630,224),('UI33700077',293997282153230,3790,827),('UI33800086',293994821140870,3610,861),('UI33900064',29399617750122,3520,799),('UI34000063',293999577948094,3740,331),('UI34100084',293998778045397,3320,355),('UI34200097',293998787720250,3750,683),('UI34300045',293995988750671,3610,571),('UI34400058',293999083015454,3930,76),('UI34500014',293995056917240,3400,820),('UI34600099',293999311784739,3720,632),('UI34700057',293998457442264,3290,705),('UI34800044',293997165851059,3830,533),('UI34900092',293996838652417,3300,216),('UI35000097',293997505273420,3900,310),('UI35100091',293996383440939,3170,673),('UI35200062',293991346113731,3900,891),('UI35300045',293992642438770,3570,1019),('UI35400073',293997473713927,3720,1086),('UI35500097',293991919219632,3650,236),('UI35600053',293994791439047,3260,1034),('UI35700027',293992461020341,3350,834),('UI35800050',293991152863230,3600,920),('UI35900018',293997394740216,3870,1071),('UI36000014',29399769580895,3800,145),('UI36100012',293991980060652,3990,861),('UI36200023',29399902458654,3740,792),('UI36300051',293996603248941,3020,379),('UI36400090',293996312448182,3840,471),('UI36500043',293997664243503,3230,175),('UI36600074',293995450974684,3490,18),('UI36700041',293995090898166,3550,871),('UI36800054',293998413977307,3740,998),('UI36900075',293993043484671,3310,952),('UI37000070',293998766076509,3330,380),('UI37100083',293999113221976,3680,187),('UI37200098',293992181053038,3280,92),('UI37300078',293997377572908,3160,648),('UI37400057',293991709530358,3400,489),('UI37500019',293993265715358,3380,717),('UI37600048',293994507519683,3290,1017),('UI37700015',293999705568516,3810,87),('UI37800070',293991723030996,3740,903),('UI37900081',293992246235777,3310,107),('UI38000021',29399249521968,4000,217),('UI38100046',293991169568010,3640,471),('UI38200026',293998819225580,3040,1055),('UI38300033',293999215193527,3080,314),('UI38400073',293995525246770,3800,516),('UI38500014',293991651772127,3170,263),('UI38600031',293994644348317,3300,177),('UI38700084',293997870325135,3810,886),('UI38800057',293994683440544,3210,437),('UI38900077',293992046012344,3660,509),('UI39000029',293999271293144,3780,618),('UI39100081',293992491666776,3720,602),('UI39200090',293992211624767,3630,264),('UI39300041',293997055337390,3780,114),('UI39400052',293995338681677,3900,503),('UI39500037',293999780045659,3720,253),('UI39600094',293993321098656,3660,83),('UI39700071',293991479922271,3650,796),('UI39800094',293993172876815,3940,614),('UI39900093',293996435625697,3040,1066),('UI40000099',293996903074002,3910,920),('UI40100013',293995528313096,3810,314),('UI40200018',293993284184709,3270,76),('UI40300029',293993751084324,3560,1027),('UI40400059',293997394471925,3230,941),('UI40500013',293994697795351,3060,814),('UI40600021',293994144046453,3320,856),('UI40700081',293995188254545,3170,77),('UI40800025',293996520076402,3640,745),('UI40900050',293992631483440,3830,983),('UI41000016',293998869249865,3730,42),('UI41100029',293991067438149,3870,819),('UI41200096',293997591854499,3860,63),('UI41300063',293992187045805,3460,55),('UI41400094',293995050765353,3820,143),('UI41500064',293995994988829,3630,920),('UI4160004',293996394924563,3990,589),('UI41700072',293999752747553,3530,750),('UI41800041',293996163066787,3940,99),('UI41900088',293994718938623,3810,773),('UI4200005',293999626233967,3200,1124),('UI42100070',293998355680420,3250,936),('UI42200056',293996544248501,3800,187),('UI42300070',293993169549056,3090,30),('UI42400054',293998140322126,3260,1030),('UI42500010',29399486784750,3490,291),('UI42600077',293996055484271,3440,375),('UI42700058',293994656341893,3550,740),('UI42800069',293996498242849,3390,907),('UI42900062',29399919486620,3670,519),('UI43000012',293996583983227,3120,535),('UI43100084',293991215494355,3910,578),('UI43200014',293996589034896,3590,697),('UI43300025',293997566788031,3980,998),('UI43400048',293996066351947,3100,685),('UI43500052',293998878778756,3870,298),('UI43600052',293995155636998,3070,460),('UI43700073',293997800265746,3120,888),('UI43800090',29399635950382,3400,452),('UI43900030',293994238523834,3540,481),('UI44000045',293991885149510,3650,1117),('UI44100085',293994698247998,3670,764),('UI44200071',293991394990285,3660,936),('UI44300016',293999652215523,3900,143),('UI44400010',29399876615968,3870,768),('UI44500047',293997753758463,3390,632),('UI44600063',29399663992157,3850,35),('UI44700012',293999913677010,3640,767),('UI44800069',293995777861189,3090,1065),('UI44900038',293998494321839,3000,1034),('UI45000042',293996624244269,3090,387),('UI45100071',293997984428549,3460,66),('UI45200042',293995200644260,3680,1023),('UI45300058',293995749768571,3780,71),('UI45400044',293992711532786,3300,184),('UI45500034',293997561877098,3540,676),('UI45600050',293995842459806,3940,862),('UI45700067',293992298493502,3990,1181),('UI45800092',293993632033353,3100,951),('UI45900011',293993118046391,3510,756),('UI46000044',293998117118442,3050,1053),('UI46100020',293994346774815,3230,773),('UI46200086',293999437929721,3610,372),('UI46300026',293995478585490,3680,513),('UI46400062',293992569689091,3560,16),('UI46500074',293994445825857,3700,179),('UI46600054',293999338840979,3520,612),('UI46700026',293993176679054,3900,172),('UI46800044',293996537071131,3030,833),('UI46900057',293991774587514,3620,183),('UI47000056',293995721827983,3550,666),('UI47100088',29399546598609,3160,616),('UI47200011',293999188684332,3800,310),('UI47300016',293991592529353,3380,117),('UI47400036',29399463749921,3790,8),('UI47500076',293997923665222,3410,96),('UI47600058',293996004786923,3640,189),('UI47700023',293998931963555,3500,371),('UI47800029',293998231049612,3490,984),('UI47900044',293995062686722,3660,1173),('UI48000040',293993419791664,3040,1118),('UI48100097',293999684255051,3930,829),('UI48200015',293996255268625,3990,2),('UI48300092',293998263936943,3250,355),('UI48400086',293992992834031,3450,224),('UI48500041',29399523779667,3950,347),('UI48600091',293992392743342,3550,686),('UI48700030',293995954768319,3260,910),('UI48800035',293999780287573,3800,829),('UI48900022',29399603132960,3530,668),('UI49000060',293991970118237,3050,721),('UI49100047',293998460789091,3490,888),('UI49200071',293992304492363,3540,1038),('UI49300044',293991056195668,3270,81),('UI49400088',293999759687457,3520,583),('UI49500092',293991492258478,3720,447),('UI49600093',293997794418522,3280,136),('UI49700074',293997516296668,3330,605),('UI49800013',293998033350467,3840,367),('UI49900062',293999839213890,3340,558),('UI50000086',293994627891317,3860,167),('UI50100011',293991680870976,3430,256),('UI50200083',293991506784375,3360,831),('UI50300069',293997357017089,3150,439),('UI50400058',29399825174718,3500,254),('UI50500035',293999111442356,3670,163),('UI50600068',293998455927861,3650,48),('UI50700090',293994133665389,3150,439),('UI50800039',293999000413893,3820,1095),('UI50900095',293992283357196,3420,109),('UI51000013',293991789675830,3000,835),('UI51100074',293999064177359,3610,15),('UI51200085',293993269651866,3110,342),('UI51300094',293998871091871,3980,230),('UI51400054',293994670740825,3130,245),('UI51500080',29399927175926,3000,109),('UI51600027',293992133823342,3930,738),('UI51700081',293994055665248,3190,83),('UI51800052',293994390977575,3690,1102),('UI5190006',29399472765766,3410,1089),('UI52000088',293991702320239,3000,249),('UI52100084',293995685592395,3220,427),('UI52200041',29399541633330,3180,99),('UI52300010',293991444515161,3160,82),('UI52400058',293998579047601,3780,978),('UI52500011',293991589632355,3970,511),('UI52600053',293994961779823,3830,761),('UI52700015',293997374991441,3560,1087),('UI52800013',293995697081487,3490,52),('UI52900046',293999416226900,3130,1141),('UI53000011',293995286842565,3110,2),('UI53100057',293999557128414,3320,779),('UI53200040',293992468383962,3100,326),('UI53300039',29399627818584,3930,480),('UI53400020',293997043248652,3090,65),('UI53500012',293998104438232,3450,1061),('UI53600038',29399315451327,3450,15),('UI53700013',293996884451893,3480,957),('UI53800010',293994978198713,3920,519),('UI53900069',293993226885875,3340,948),('UI54000058',293996275697738,3630,200),('UI54100098',293994993669951,3750,331),('UI54200019',293993464085111,3110,381),('UI54300060',293996904148926,3180,1102),('UI54400099',293995264793972,3200,685),('UI54500010',293993836159539,3780,1125),('UI54600075',29399585182957,3210,57),('UI54700056',293994404317977,3730,143),('UI54800042',29399427931828,3330,924),('UI54900046',293998998585306,3920,463),('UI55000077',293991433133203,3530,1087),('UI55100011',293997178773554,3750,258),('UI55200074',293996876783237,3980,1017),('UI55300018',293997781821870,3830,140),('UI55400035',293995349657689,3570,92),('UI55500048',293995477993868,3770,512),('UI55600057',293999385147179,3530,549),('UI55700014',293996830196132,3410,913),('UI55800054',293996117038437,3530,94),('UI55900055',29399469740869,3780,562),('UI56000036',293999821913266,3400,956),('UI56100039',293998529972851,3050,355),('UI56200028',293999043873962,3120,1195),('UI56300062',293999780631374,3040,187),('UI56400071',293997740181765,3940,17),('UI56500034',293991141819160,3560,975),('UI56600037',293998829962452,3440,914),('UI56700016',29399511940798,3780,931),('UI56800079',293996659072582,3770,147),('UI56900028',293998587650719,3790,681),('UI57000063',293998216992271,3900,811),('UI57100068',293995401750190,3850,948),('UI57200046',293997251247390,3520,334),('UI57300092',293991143279271,3210,3),('UI57400089',293999056742112,3430,456),('UI57500040',293991132845379,3510,427),('UI57600035',293996037080839,3510,594),('UI57700062',293993125978817,3440,349),('UI57800080',293993722390566,3380,38),('UI57900097',293993627328389,3230,1094),('UI58000067',293994871373240,3680,468),('UI58100074',293997239737518,3230,1013),('UI58200028',29399421128362,3120,1025),('UI58300057',293994914867085,3940,20),('UI58400066',293997231859777,3850,679),('UI58500021',293999024449763,3060,347),('UI58600092',293996086495569,3810,100),('UI58700051',293993534113294,3730,97),('UI58800079',293991456915902,3720,1192),('UI58900041',293992078377796,3590,733),('UI59000095',293998869937103,3890,418),('UI59100060',293999496096074,3450,225),('UI59200084',293995473562656,3940,1187),('UI59300014',293996000997150,3680,369),('UI59400093',293995190071336,3560,1117),('UI59500042',293999931041285,3310,463),('UI59600051',293991854169652,3840,899),('UI59700020',293995784227211,3860,828),('UI59800028',29399922174866,3880,213),('UI59900054',293994941818367,3480,998),('UI60000061',293999070616452,3850,1029),('UI60100053',293998274269793,3570,841),('UI60200022',293996949783430,3110,937),('UI60300066',293996529352236,3590,270),('UI60400026',293991448412080,3250,685),('UI60500032',293993682728985,3560,594),('UI60600051',293996950538855,3200,624),('UI60700084',293994795174031,3550,806),('UI60800060',293994904331894,3770,403),('UI60900023',293996300481744,3040,110),('UI61000067',293997134478333,3840,1183),('UI61100019',293993354222525,3170,448),('UI61200019',293992582687565,3110,1166),('UI61300010',293991048294590,3130,960),('UI61400048',293995221583211,3750,820),('UI61500012',293995432775706,3100,306),('UI61600087',293997919681898,3980,1164),('UI61700082',293992563834537,3270,51),('UI61800018',29399965182052,3420,171),('UI61900084',293996444430036,3570,854),('UI62000036',293993992641658,3540,420),('UI62100016',293996685945255,3550,163),('UI62200043',293999015090955,3990,956),('UI62300051',293997555040115,3310,75),('UI62400014',293992328953124,3030,582),('UI62500043',293998393470926,3460,562),('UI62600070',293996494127671,3440,565),('UI62700066',293997795298728,3330,585),('UI62800023',293994070444955,3290,1004),('UI62900043',293999848176343,3930,909),('UI6300001',293992055749675,3590,1137),('UI63100019',293993408253229,3960,476),('UI63200082',293993280136885,3980,950),('UI63300094',293991367122226,3330,1074),('UI63400039',293998503565426,3040,650),('UI63500016',293992495457581,3450,1174),('UI63600022',293992348639076,3670,326),('UI63700031',293998890684799,3630,462),('UI63800013',293995529545120,3370,839),('UI63900094',293991642377403,3380,383),('UI64000053',293999515041776,3260,794),('UI64100073',293998709120467,3510,825),('UI64200098',293999423433850,3410,381),('UI64300037',293991871057082,3680,1),('UI64400080',293994816488310,3880,1112),('UI64500014',293993616447692,3940,254),('UI64600066',293998072859546,3610,94),('UI64700075',293999433898264,3130,38),('UI64800045',293991225196544,3990,344),('UI64900098',293996158625849,3870,1088),('UI65000077',293996678190880,3450,980),('UI65100066',293994797815275,3820,541),('UI65200091',293996723957199,3950,346),('UI65300090',293994388486274,3250,1029),('UI65400079',293996690529254,3000,11),('UI65500066',293995645086057,3710,154),('UI65600091',293991697268039,3220,911),('UI65700050',293991330789784,3230,659),('UI65800079',293998207418583,3580,1105),('UI65900076',293995084215764,3590,957),('UI66000026',293993985188291,3770,163),('UI66100075',293995987498566,3880,1160),('UI66200013',293992173869555,3830,816),('UI66300029',293999248825116,3400,828),('UI66400076',293993962463054,3210,1181),('UI66500082',293996807384047,3470,757),('UI66600035',293999003946457,3220,50),('UI66700052',293992292355458,3050,1135),('UI66800063',293997562881331,3480,1159),('UI66900060',293996166217483,3750,346),('UI67000033',293996351459076,3690,962),('UI67100057',293992804578496,3650,827),('UI67200048',293991482084932,3140,165),('UI67300088',293992916946789,3370,791),('UI67400046',293998865396728,3360,505),('UI67500051',293993244159406,3130,130),('UI67600095',293993499093780,3500,795),('UI67700062',293994075144714,3950,427),('UI67800075',293999735871798,3810,368),('UI67900088',293998095779116,3880,196),('UI68000015',293994816052332,3410,564),('UI68100013',293992324543725,3370,124),('UI68200051',293993044137425,3250,765),('UI68300049',293991193136743,3490,296),('UI68400082',293995870549817,3670,950),('UI68500053',29399957318184,3850,1180),('UI68600015',293998305499964,3730,169),('UI68700077',293999144349820,3050,399),('UI68800040',293997720394852,3160,598),('UI68900053',293991846259518,3090,1120),('UI69000084',293992891581803,3620,544),('UI69100029',29399266232251,3640,740),('UI69200072',293997813319521,3630,141),('UI69300075',293991359838595,3630,130),('UI69400092',293992939451323,3410,244),('UI69500015',293997668595401,3140,865),('UI69600026',293997528854277,3430,36),('UI69700041',293996709937825,3370,719),('UI69800069',293994256332683,3140,684),('UI69900011',293997354877380,3080,15),('UI70000018',293996530657532,3400,985),('UI70100063',29399959255890,3430,323),('UI70200022',293995797573055,3840,133),('UI70300079',293996165454042,3170,167),('UI70400097',293996671234981,3590,1119),('UI70500063',293992508115941,3350,913),('UI70600048',293995945450176,3660,1163),('UI70700011',293996768486749,3790,696),('UI70800063',293999482514300,3390,32),('UI70900098',293995123419172,3780,991),('UI71000061',29399437972624,3000,438),('UI71100090',293992027916680,3220,124),('UI71200039',293994140267069,3140,608),('UI71300068',293998320416343,3030,541),('UI71400097',293994548716346,3380,306),('UI71500081',293994714657099,3320,1176),('UI71600076',293999626073812,3880,852),('UI71700096',293998713530977,3330,534),('UI71800040',293998663812815,3770,540),('UI71900029',293992895919299,3940,516),('UI72000036',293992190394248,3710,602),('UI72100095',293995635965151,3650,505),('UI72200028',293996258477399,3070,72),('UI72300050',293992335418734,3920,923),('UI72400064',293994863358791,3530,626),('UI72500035',293996452546989,3690,396),('UI72600093',293999626577172,3540,150),('UI72700040',293995381592074,3290,639),('UI72800021',293997252735360,3930,140),('UI72900038',293996864247979,3690,133),('UI73000016',293991346373344,3960,1057),('UI73100060',293997217447422,3010,168),('UI73200014',293991618773449,3450,1003),('UI7330005',293993845782015,3260,364),('UI73400064',293992506271294,3600,1097),('UI73500035',293991227286686,3450,124),('UI73600061',293992161591081,3100,969),('UI73700065',293994219357224,3250,539),('UI73800079',293997626367462,3090,835),('UI73900027',293992825432679,3030,109),('UI74000054',29399655737206,3920,685),('UI74100036',29399817673088,3060,117),('UI74200039',293993859284319,3040,910),('UI74300010',293993705298384,3610,202),('UI74400040',293993504546215,3120,105),('UI74500096',293996696438948,3890,389),('UI74600046',293994108674645,3680,1007),('UI74700091',293993713928554,3250,1101),('UI74800035',29399335164682,3050,275),('UI74900058',293993078073378,3380,1155),('UI75000085',293991299770413,3720,720),('UI75100011',293997903134703,3500,749),('UI75200028',293991862389730,3410,1027),('UI75300038',293991286488050,3390,898),('UI75400069',29399822561118,3670,242),('UI75500042',293993091331613,3710,258),('UI75600074',29399993114354,3510,430),('UI75700013',293991353445299,3390,554),('UI75800063',293991914739838,3270,970),('UI7590000',293993979145773,3250,550),('UI76000082',293998425461941,3640,790),('UI76100065',293998053175496,3080,281),('UI76200053',293996578281525,3930,196),('UI76300086',293999021279522,3890,698),('UI76400095',293996234525412,3270,68),('UI76500012',293995125878835,3940,1012),('UI76600036',293999217535976,3680,1081),('UI76700061',293998853619202,3880,109),('UI76800023',293995056343470,3700,267),('UI76900017',293995049390176,3300,744),('UI77000015',293993079671715,3180,194),('UI77100040',293991889331863,3700,335),('UI77200050',293991908071073,3240,553),('UI77300025',29399899767762,3220,345),('UI77400051',293994231097994,3860,684),('UI77500079',293999643751555,3030,319),('UI77600055',293992473145431,3750,587),('UI77700063',293991877424878,3760,212),('UI77800054',293991823629005,3910,578),('UI77900060',29399817812723,3860,192),('UI78000032',293996796150776,3100,1165),('UI78100023',293994843519103,3760,476),('UI78200024',293995402892445,3710,1151),('UI78300039',293997075923765,3720,1065),('UI78400072',293996317220659,3630,1150),('UI78500020',293993512327236,3640,13),('UI78600072',293998512821422,3760,389),('UI78700040',29399606394912,3220,717),('UI78800079',293995960338093,3560,1167),('UI78900074',293999071870136,3020,527),('UI79000020',293993145815003,3750,1040),('UI79100018',293995460839347,3010,870),('UI79200046',293991545062657,3270,424),('UI79300055',293997147282025,3880,296),('UI79400021',293993499569731,3990,284),('UI79500078',293992079522245,3450,279),('UI79600083',293994899616802,3830,1048),('UI79700091',293998620968472,3660,934),('UI79800094',293997642578417,3870,873),('UI79900051',293998439637703,3840,555),('UI80000049',293991749236657,3970,135),('UI80100065',293993069776873,3480,160),('UI80200045',293995638077809,3650,1131),('UI80300021',293996821067956,3840,1036),('UI80400056',293995449621503,3570,1092),('UI80500083',29399609566519,3340,1086),('UI80600010',293993394114522,3430,112),('UI80700011',293997169557597,3710,572),('UI80800052',293997310650740,3520,900),('UI80900011',293994643653609,3680,1071),('UI81000036',293991824383472,3690,854),('UI81100058',293998309922422,3750,888),('UI81200035',293998324093970,3770,544),('UI81300059',293993801436121,3290,308),('UI81400075',293995102459689,3000,491),('UI81500044',293994067664273,3380,371),('UI81600082',293992544090578,3710,800),('UI81700097',29399731161686,3450,1193),('UI81800010',293995462698648,3140,656),('UI81900032',293993651094227,3750,925),('UI82000053',293994433064842,3520,519),('UI82100071',293995744425716,3020,990),('UI82200096',293991121826238,3290,1138),('UI82300047',293994424625474,3990,208),('UI82400069',29399644218166,3780,123),('UI82500039',29399551286053,3510,997),('UI82600079',293997696780823,3800,775),('UI82700081',293994295970815,3340,543),('UI82800059',293998780825461,3460,397),('UI82900031',293998219280077,3140,136),('UI83000076',293995256736914,3100,323),('UI83100044',293995531751376,3730,946),('UI83200076',293994621851713,3440,1180),('UI83300037',293995123587257,3820,990),('UI83400059',293997141864507,3710,436),('UI83500082',293991598940015,3360,1077),('UI83600013',293992980520681,3230,148),('UI83700060',293997256080905,3090,520),('UI83800046',293998366933691,4000,955),('UI83900027',293993677026027,3720,282),('UI84000078',293996422527967,3570,240),('UI84100062',293996950385566,3710,312),('UI84200076',293998377234919,3410,258),('UI84300085',293992076159154,3950,1052),('UI84400024',293998386399052,3490,1045),('UI84500081',293997555695469,3030,766),('UI84600050',293992777577880,3750,86),('UI84700071',293997579831465,3010,399),('UI84800063',293999151762761,3520,851),('UI84900048',293991322483675,3580,1098),('UI85000065',293991731588294,3180,681),('UI85100062',293996191926822,3510,961),('UI85200032',293992174276527,3100,878),('UI85300054',293994324648458,3820,1029),('UI85400069',293999172622699,3200,1093),('UI85500019',293994718037186,3700,788),('UI85600028',293991700138659,3730,16),('UI85700033',293999838121178,3410,924),('UI85800038',293999108542058,3720,1193),('UI85900020',293998737962802,3780,511),('UI86000013',293995596525119,3540,3),('UI86100042',293997319880126,3690,292),('UI86200028',293992516436278,3280,205),('UI86300061',293999376413501,3530,1019),('UI86400047',293995179964287,3880,510),('UI86500092',293993052912902,3710,928),('UI86600090',293998952748069,3290,977),('UI86700041',293993323049103,3870,699),('UI86800096',293993509679273,3450,56),('UI86900073',293998805115064,3130,468),('UI87000053',293992833428704,3880,73),('UI87100042',293993262477930,3000,876),('UI87200075',29399914523966,3660,838),('UI87300088',29399300556012,3620,157),('UI87400058',293995829945900,3920,134),('UI87500030',293993622466319,3110,342),('UI87600054',29399699356915,3500,55),('UI87700085',29399884863367,3170,576),('UI87800067',293998397817494,3880,902),('UI87900017',29399895020933,3810,410),('UI88000025',293997120355565,3310,687),('UI88100051',293994510935680,3000,398),('UI88200012',293995119489573,3580,452),('UI88300021',293995290318291,3030,883),('UI88400024',293998743880451,3630,1017),('UI8850009',29399452795055,3800,253),('UI88600060',293992021797455,3080,848),('UI88700051',293994491776938,3290,65),('UI88800025',293994435961209,3340,840),('UI88900095',293995987211564,3500,1185),('UI89000069',293991771755324,3880,1200),('UI89100011',293999387551256,3450,811),('UI89200084',293995060776974,3000,44),('UI89300038',293999881699991,3120,550),('UI89400084',293991521525649,3120,299),('UI89500026',293997799491204,3030,880),('UI89600016',293996717212844,3330,417),('UI89700047',293998460724714,3170,314),('UI89800022',293991118031163,3730,878),('UI89900046',293997343479726,3900,1014),('UI90000095',293996412988462,3890,192),('UI90100020',293997660967438,3120,1093),('UI90200036',293993474573775,3200,1189),('UI90300037',293999527193806,3180,175),('UI90400047',293994238232988,3700,224),('UI90500027',29399349744390,3140,142),('UI90600073',29399310966537,3970,154),('UI90700059',29399690566622,3030,785),('UI90800059',293999777489879,3810,380),('UI90900080',29399241076152,3010,628),('UI91000080',293997164016171,3210,214),('UI91100052',293997843398801,3880,16),('UI91200068',293995167676851,3530,334),('UI91300068',293998315179550,3490,887),('UI91400079',293995374054264,3920,1155),('UI91500025',293997040291268,3720,1147),('UI91600037',293996790830253,3180,397),('UI91700022',293992901833146,3650,845),('UI91800037',293999549130302,3400,343),('UI91900040',293995725714901,3370,1184),('UI92000019',293993486567664,3610,120),('UI92100063',293993501191806,3200,258),('UI92200086',293998040177952,3690,266),('UI92300081',293993056190157,3880,571),('UI92400052',293994598479436,3880,640),('UI92500037',293997547539617,3730,179),('UI92600057',29399785414827,3780,530),('UI92700071',29399639592898,3470,343),('UI92800047',293995424574482,3990,731),('UI92900072',293991968630409,3470,139),('UI93000068',293992819095495,3130,595),('UI93100040',293998211776849,3770,728),('UI93200023',293998860912544,3310,537),('UI93300095',293995736891253,3550,11),('UI93400015',293997338743769,3880,694),('UI93500078',293996816732698,3570,941),('UI93600099',293993243418319,3630,1068),('UI93700024',293997357992933,3470,700),('UI93800017',293996773950657,3320,790),('UI93900080',293991588678323,3310,161),('UI94000088',293998926885494,3940,805),('UI94100013',293999546041625,3530,790),('UI94200094',293995431692865,3250,730),('UI9430001',293997739895706,3750,1197),('UI94400096',293996912286187,3520,966),('UI94500099',293993243559573,3150,1019),('UI94600090',29399743357676,3110,284),('UI94700038',293994485915356,3930,819),('UI94800070',293994775824213,3040,640),('UI94900049',293994979685761,3120,535),('UI95000027',293994370118622,3250,977),('UI95100088',293995678396702,3420,119),('UI95200050',29399393742887,3660,319),('UI95300056',293996729329044,3480,1035),('UI95400043',293992997773056,3530,1184),('UI95500038',293992653221603,3740,901),('UI95600039',293999807481139,3940,376),('UI95700041',293995722236637,3550,436),('UI95800021',293995700787654,3070,451),('UI95900015',293999069136632,3200,1014),('UI96000022',293997744788524,3160,1126),('UI96100046',293992057099877,3720,695),('UI96200011',293996212969191,3550,1186),('UI96300069',293998701675782,3310,847),('UI96400058',293998248015185,3410,89),('UI96500070',293997803412176,3350,130),('UI9660002',293998948063001,3690,804),('UI96700059',293999870426928,3300,765),('UI96800023',293994492740750,3410,637),('UI96900095',293997746456297,3550,25),('UI97000098',293999236274520,3780,452),('UI97100083',293999126137938,3130,955),('UI97200057',29399876634863,3800,436),('UI97300099',293999269567356,3470,307),('UI97400027',293993889740074,3150,80),('UI97500081',293998594724297,3660,460),('UI97600052',293999143276890,3650,849),('UI97700027',293999258970568,3350,71),('UI97800050',293992066729948,3280,722),('UI97900052',293994285292174,3340,555),('UI98000078',293998934138905,3450,30),('UI98100074',29399627813829,3100,230),('UI98200022',293993095434063,3590,1130),('UI98300060',293995693012755,3090,1068),('UI98400090',293993877619916,3700,655),('UI98500066',293992434463942,3370,189),('UI98600081',29399983498537,3740,1071),('UI98700079',293998001693108,3050,309),('UI98800033',293995647996682,3530,276),('UI98900078',293994280712866,3290,342),('UI99000075',293995945774936,3770,128),('UI99100066',293994121461629,3970,1019),('UI99200063',29399742579427,3280,1086),('UI99300041',293991880285456,3620,848),('UI99400026',293999863112729,3650,305),('UI99500042',293996135134724,3520,886),('UI99600047',29399689294909,3340,825),('UI99700041',293994230388394,3560,407),('UI99800090',293994231948930,3360,506),('UI99900092',293991130233051,3460,422);


--
-- Table structure for table `customer_profile`
--



--
-- Dumping data for table `customer_profile`
--

LOCK TABLES `customer_profile` WRITE;
/*!40000 ALTER TABLE `customer_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS movie;

CREATE TABLE movie (
  movie_id varchar(10) NOT NULL,
  movie_name varchar(25) NOT NULL,
  duration varchar(15) NOT NULL,
  average_rating int NOT NULL,
  languages_available varchar(30) NOT NULL,
  PRIMARY KEY (`movie_id`)
);# ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO movie VALUES ('MOVIE10483','Manchester by the Sea','118 Minutes',3,'English'),('MOVIE10977','The Secret Life of Pets','96 Minutes',5,'English'),('MOVIE11744','Arrival','138 Minutes',4,'English'),('MOVIE11968','Gold','109 Minutes',5,'English'),('MOVIE12904','Trolls','150 Minutes',3,'English'),('MOVIE13298','Lion','112 Minutes',4,'English'),('MOVIE13861','Moana','120 Minutes',4,'Hindi'),('MOVIE14001','Hounds of Love','144 Minutes',5,'English'),('MOVIE14789','Rogue One','144 Minutes',5,'English'),('MOVIE15929','Why Him?','91 Minutes',3,'English'),('MOVIE16647','Jason Bourne','143 Minutes',5,'Hindi'),('MOVIE17802','Assassin\'s Creed','134 Minutes',4,'Hindi'),('MOVIE18163','Hidden Figures','145 Minutes',4,'Hindi'),('MOVIE18765','Paris pieds nus','101 Minutes',5,'Hindi'),('MOVIE18817','Independence Day: Resurge','93 Minutes',5,'English'),('MOVIE19427','Deadpool','114 Minutes',3,'English'),('MOVIE3658','Hacksaw Ridge','141 Minutes',4,'Hindi'),('MOVIE6205','Dead Awake','123 Minutes',3,'English'),('MOVIE6691','Colossal','113 Minutes',4,'English'),('MOVIE8041','Bahubali: The Beginning','90 Minutes',3,'English');

DROP TABLE IF EXISTS `shows`;

CREATE TABLE shows (
  show_id varchar(10) NOT NULL,
  movie_id varchar(10) NOT NULL,
  theatre_id varchar(10) NOT NULL,
  show_timings varchar(20) NOT NULL,
  price_per_ticket int NOT NULL,
  PRIMARY KEY (show_id),
  #Primary KEY movie_id (movie_id),
  #Primary KEY theatre_id (theatre_id),
  CONSTRAINT shows_ibfk_1 FOREIGN KEY (movie_id) REFERENCES movie (movie_id),
  CONSTRAINT shows_ibfk_2 FOREIGN KEY (theatre_id) REFERENCES theatre (theatre_id)
); 

INSERT INTO shows VALUES ('SH103ASP','MOVIE18163','TH120011','7 PM - 9 PM',220),('SH105ASP','MOVIE15929','TH820085','7 PM - 9 PM',240),('SH110ASP','MOVIE10483','TH340020','6 PM - 8 PM',170),('SH113ASP','MOVIE15929','TH400026','12 PM - 1 AM',170),('SH114ASP','MOVIE6205','TH310039','9 PM - 11 PM',220),('SH129ASP','MOVIE12904','TH370094','5 PM - 7 PM',150),('SH142ASP','MOVIE17802','TH64005','9 AM - 11 AM',220),('SH146ASP','MOVIE3658','TH32004','9 PM - 11 PM',170),('SH148ASP','MOVIE14789','TH350032','7 PM - 9 PM',360),('SH156ASP','MOVIE11968','TH60098','9 PM - 11 PM',170),('SH158ASP','MOVIE13298','TH120011','7 PM - 9 PM',360),('SH162ASP','MOVIE11744','TH470089','9 AM - 11 AM',170),('SH164ASP','MOVIE11744','TH039','2 PM - 4 PM',150),('SH165ASP','MOVIE18163','TH32004','6 PM - 8 PM',170),('SH178ASP','MOVIE10977','TH039','9 PM - 11 PM',220),('SH180ASP','MOVIE8041','TH520098','9 PM - 11 PM',150),('SH181ASP','MOVIE18817','TH970088','6 PM - 8 PM',150),('SH198ASP','MOVIE3658','TH790033','6 PM - 8 PM',280),('SH200ASP','MOVIE11968','TH670013','12 PM - 1 AM',280),('SH202ASP','MOVIE18765','TH490053','9 PM - 11 PM',280),('SH204ASP','MOVIE18765','TH360065','12 PM - 1 AM',150),('SH209ASP','MOVIE14001','TH760035','12 PM - 1 AM',170),('SH221ASP','MOVIE10977','TH350032','5 PM - 7 PM',280),('SH226ASP','MOVIE12904','TH530037','1 PM - 3 PM',360),('SH227ASP','MOVIE14001','TH920056','6 PM - 8 PM',170),('SH230ASP','MOVIE11968','TH50043','7 PM - 9 PM',170),('SH232ASP','MOVIE17802','TH260075','2 PM - 4 PM',170),('SH235ASP','MOVIE11744','TH600097','1 PM - 3 PM',280),('SH250ASP','MOVIE18163','TH840083','2 PM - 4 PM',170),('SH251ASP','MOVIE6205','TH800047','6 PM - 8 PM',220),('SH257ASP','MOVIE14789','TH270032','5 PM - 7 PM',150),('SH260ASP','MOVIE14789','TH550031','6 PM - 8 PM',170),('SH261ASP','MOVIE11744','TH60098','9 PM - 11 PM',150),('SH267ASP','MOVIE11744','TH380060','9 AM - 11 AM',220),('SH269ASP','MOVIE18817','TH930064','5 PM - 7 PM',150),('SH270ASP','MOVIE13298','TH120011','6 PM - 8 PM',360),('SH275ASP','MOVIE13861','TH80073','7 PM - 9 PM',240),('SH278ASP','MOVIE11744','TH150033','9 PM - 11 PM',280),('SH279ASP','MOVIE6205','TH810011','2 PM - 4 PM',360),('SH280ASP','MOVIE3658','TH810011','5 PM - 7 PM',280),('SH285ASP','MOVIE18817','TH440088','7 PM - 9 PM',220),('SH287ASP','MOVIE8041','TH750064','7 PM - 9 PM',170),('SH288ASP','MOVIE10977','TH270032','7 PM - 9 PM',280),('SH294ASP','MOVIE6205','TH660045','12 PM - 1 AM',280),('SH300ASP','MOVIE8041','TH470089','12 PM - 1 AM',150),('SH302ASP','MOVIE16647','TH490053','12 PM - 1 AM',360),('SH305ASP','MOVIE18163','TH340020','5 PM - 7 PM',280),('SH309ASP','MOVIE14001','TH330023','9 PM - 11 PM',150),('SH319ASP','MOVIE18163','TH770037','1 PM - 3 PM',240),('SH320ASP','MOVIE12904','TH30098','1 PM - 3 PM',170),('SH321ASP','MOVIE11744','TH790033','9 AM - 11 AM',280),('SH336ASP','MOVIE10483','TH500056','12 PM - 1 AM',220),('SH338ASP','MOVIE11744','TH69003','6 PM - 8 PM',300),('SH339ASP','MOVIE6691','TH100051','6 PM - 8 PM',280),('SH345ASP','MOVIE16647','TH20030','12 PM - 1 AM',240),('SH351ASP','MOVIE18817','TH100051','2 PM - 4 PM',280),('SH364ASP','MOVIE16647','TH580095','1 PM - 3 PM',280),('SH366ASP','MOVIE18765','TH670013','9 PM - 11 PM',280),('SH367ASP','MOVIE13298','TH270032','9 AM - 11 AM',360),('SH387ASP','MOVIE11968','TH50043','5 PM - 7 PM',360),('SH388ASP','MOVIE13298','TH260075','2 PM - 4 PM',170),('SH389ASP','MOVIE10977','TH750064','12 PM - 1 AM',360),('SH392ASP','MOVIE13861','TH700029','9 PM - 11 PM',220),('SH397ASP','MOVIE18765','TH330023','7 PM - 9 PM',300),('SH400ASP','MOVIE13298','TH21007','2 PM - 4 PM',240),('SH417ASP','MOVIE6205','TH380060','9 PM - 11 PM',280),('SH418ASP','MOVIE10483','TH610082','1 PM - 3 PM',280),('SH420ASP','MOVIE11744','TH420024','1 PM - 3 PM',170),('SH427ASP','MOVIE13298','TH950030','12 PM - 1 AM',280),('SH443ASP','MOVIE18817','TH670013','9 AM - 11 AM',360),('SH447ASP','MOVIE18765','TH150033','2 PM - 4 PM',170),('SH448ASP','MOVIE12904','TH460071','7 PM - 9 PM',240),('SH458ASP','MOVIE6205','TH590016','5 PM - 7 PM',280),('SH470ASP','MOVIE15929','TH40043','9 AM - 11 AM',360),('SH475ASP','MOVIE17802','TH490053','1 PM - 3 PM',300),('SH478ASP','MOVIE15929','TH580095','6 PM - 8 PM',150),('SH484ASP','MOVIE10977','TH350032','9 PM - 11 PM',280),('SH493ASP','MOVIE8041','TH40043','5 PM - 7 PM',360),('SH498ASP','MOVIE10977','TH72007','6 PM - 8 PM',170),('SH501ASP','MOVIE3658','TH600097','12 PM - 1 AM',150),('SH507ASP','MOVIE6205','TH740018','2 PM - 4 PM',170),('SH508ASP','MOVIE8041','TH350032','1 PM - 3 PM',150),('SH511ASP','MOVIE15929','TH950030','6 PM - 8 PM',280),('SH512ASP','MOVIE11968','TH220056','9 AM - 11 AM',280),('SH527ASP','MOVIE17802','TH80073','5 PM - 7 PM',150),('SH535ASP','MOVIE3658','TH740018','5 PM - 7 PM',280),('SH537ASP','MOVIE18765','TH370094','12 PM - 1 AM',280),('SH538ASP','MOVIE14001','TH460071','7 PM - 9 PM',170),('SH542ASP','MOVIE18765','TH63008','5 PM - 7 PM',150),('SH545ASP','MOVIE19427','TH590016','12 PM - 1 AM',150),('SH546ASP','MOVIE18765','TH940013','9 PM - 11 PM',150),('SH548ASP','MOVIE6205','TH200012','9 PM - 11 PM',360),('SH555ASP','MOVIE14001','TH40043','1 PM - 3 PM',280),('SH561ASP','MOVIE8041','TH150033','5 PM - 7 PM',240),('SH567ASP','MOVIE14789','TH70034','1 PM - 3 PM',280),('SH574ASP','MOVIE10483','TH100051','9 AM - 11 AM',300),('SH576ASP','MOVIE13298','TH110065','7 PM - 9 PM',280),('SH583ASP','MOVIE18765','TH660045','6 PM - 8 PM',150),('SH588ASP','MOVIE8041','TH820085','7 PM - 9 PM',280),('SH591ASP','MOVIE14789','TH480027','7 PM - 9 PM',150),('SH594ASP','MOVIE16647','TH70034','5 PM - 7 PM',280),('SH596ASP','MOVIE6205','TH64005','6 PM - 8 PM',150),('SH597ASP','MOVIE18765','TH310039','6 PM - 8 PM',170),('SH601ASP','MOVIE14789','TH980085','2 PM - 4 PM',240),('SH615ASP','MOVIE18765','TH340020','5 PM - 7 PM',150),('SH625ASP','MOVIE19427','TH780042','9 PM - 11 PM',220),('SH632ASP','MOVIE6205','TH700029','6 PM - 8 PM',240),('SH634ASP','MOVIE13298','TH770037','7 PM - 9 PM',220),('SH639ASP','MOVIE17802','TH900073','2 PM - 4 PM',240),('SH644ASP','MOVIE8041','TH120011','6 PM - 8 PM',360),('SH645ASP','MOVIE6691','TH200012','5 PM - 7 PM',280),('SH659ASP','MOVIE12904','TH160046','9 PM - 11 PM',240),('SH660ASP','MOVIE6205','TH240055','2 PM - 4 PM',170),('SH671ASP','MOVIE14789','TH420024','9 AM - 11 AM',220),('SH674ASP','MOVIE11744','TH810011','9 PM - 11 PM',170),('SH679ASP','MOVIE11968','TH340020','12 PM - 1 AM',170),('SH680ASP','MOVIE14001','TH590016','6 PM - 8 PM',300),('SH698ASP','MOVIE6691','TH260075','7 PM - 9 PM',240),('SH701ASP','MOVIE18817','TH430074','5 PM - 7 PM',300),('SH711ASP','MOVIE6691','TH100051','5 PM - 7 PM',170),('SH712ASP','MOVIE18163','TH860010','12 PM - 1 AM',170),('SH716ASP','MOVIE13861','TH72007','7 PM - 9 PM',220),('SH718ASP','MOVIE14001','TH660045','9 AM - 11 AM',150),('SH722ASP','MOVIE14001','TH500056','12 PM - 1 AM',240),('SH724ASP','MOVIE13861','TH950030','1 PM - 3 PM',170),('SH729ASP','MOVIE11744','TH30098','7 PM - 9 PM',150),('SH730ASP','MOVIE8041','TH910087','2 PM - 4 PM',240),('SH732ASP','MOVIE16647','TH970088','2 PM - 4 PM',300),('SH733ASP','MOVIE6205','TH400026','12 PM - 1 AM',280),('SH742ASP','MOVIE18765','TH760035','5 PM - 7 PM',280),('SH744ASP','MOVIE14789','TH730071','9 PM - 11 PM',150),('SH747ASP','MOVIE12904','TH440088','2 PM - 4 PM',170),('SH749ASP','MOVIE8041','TH970088','7 PM - 9 PM',170),('SH755ASP','MOVIE18765','TH260075','9 AM - 11 AM',360),('SH756ASP','MOVIE6205','TH780042','7 PM - 9 PM',150),('SH771ASP','MOVIE10483','TH120011','6 PM - 8 PM',150),('SH778ASP','MOVIE17802','TH960030','7 PM - 9 PM',150),('SH781ASP','MOVIE11744','TH290046','9 PM - 11 PM',150),('SH795ASP','MOVIE15929','TH840083','5 PM - 7 PM',220),('SH796ASP','MOVIE11744','TH670013','9 PM - 11 PM',220),('SH798ASP','MOVIE13298','TH420024','6 PM - 8 PM',150),('SH805ASP','MOVIE13861','TH500056','6 PM - 8 PM',360),('SH808ASP','MOVIE12904','TH450049','9 AM - 11 AM',150),('SH815ASP','MOVIE6205','TH80073','5 PM - 7 PM',280),('SH821ASP','MOVIE18765','TH990040','2 PM - 4 PM',360),('SH823ASP','MOVIE10483','TH980085','5 PM - 7 PM',300),('SH830ASP','MOVIE12904','TH200012','2 PM - 4 PM',280),('SH833ASP','MOVIE13861','TH390064','2 PM - 4 PM',150),('SH841ASP','MOVIE3658','TH470089','9 AM - 11 AM',280),('SH847ASP','MOVIE18765','TH260075','5 PM - 7 PM',300),('SH850ASP','MOVIE18765','TH970088','9 AM - 11 AM',220),('SH851ASP','MOVIE18163','TH730071','5 PM - 7 PM',220),('SH854ASP','MOVIE18817','TH920056','2 PM - 4 PM',220),('SH857ASP','MOVIE17802','TH890045','5 PM - 7 PM',150),('SH860ASP','MOVIE18765','TH260075','5 PM - 7 PM',170),('SH862ASP','MOVIE19427','TH840083','9 PM - 11 PM',300),('SH876ASP','MOVIE14789','TH860010','6 PM - 8 PM',170),('SH877ASP','MOVIE17802','TH460071','2 PM - 4 PM',240),('SH879ASP','MOVIE16647','TH960030','6 PM - 8 PM',360),('SH885ASP','MOVIE11744','TH360065','12 PM - 1 AM',360),('SH894ASP','MOVIE17802','TH470089','9 PM - 11 PM',240),('SH898ASP','MOVIE18765','TH890045','1 PM - 3 PM',170),('SH899ASP','MOVIE6691','TH370094','2 PM - 4 PM',240),('SH902ASP','MOVIE13298','TH770037','5 PM - 7 PM',360),('SH903ASP','MOVIE15929','TH930064','9 AM - 11 AM',360),('SH904ASP','MOVIE11744','TH240055','9 PM - 11 PM',240),('SH912ASP','MOVIE13861','TH990040','9 PM - 11 PM',300),('SH913ASP','MOVIE6691','TH180086','2 PM - 4 PM',240),('SH917ASP','MOVIE15929','TH10082','7 PM - 9 PM',240),('SH918ASP','MOVIE14789','TH240055','9 PM - 11 PM',170),('SH921ASP','MOVIE18817','TH80073','9 AM - 11 AM',220),('SH936ASP','MOVIE8041','TH30004','1 PM - 3 PM',280),('SH937ASP','MOVIE14001','TH740018','2 PM - 4 PM',280),('SH941ASP','MOVIE6691','TH40043','1 PM - 3 PM',360),('SH944ASP','MOVIE8041','TH880023','7 PM - 9 PM',150),('SH957ASP','MOVIE10977','TH30004','12 PM - 1 AM',170),('SH967ASP','MOVIE17802','TH200012','1 PM - 3 PM',170),('SH974ASP','MOVIE17802','TH480027','9 AM - 11 AM',170),('SH977ASP','MOVIE13861','TH400026','9 AM - 11 AM',220),('SH978ASP','MOVIE14789','TH69003','2 PM - 4 PM',220),('SH979ASP','MOVIE14789','TH500056','12 PM - 1 AM',170),('SH982ASP','MOVIE17802','TH600097','1 PM - 3 PM',150),('SH983ASP','MOVIE13298','TH330023','2 PM - 4 PM',300),('SH987ASP','MOVIE18163','TH220056','12 PM - 1 AM',170),('SH994ASP','MOVIE3658','TH740018','7 PM - 9 PM',170),('SH996ASP','MOVIE11744','TH730071','2 PM - 4 PM',360),('SH999ASP','MOVIE6205','TH910087','6 PM - 8 PM',280);


--
-- Table structure for table `theatre`
--

DROP TABLE IF EXISTS theatre;

CREATE TABLE theatre (
  theatre_id varchar(10) NOT NULL,
  seating_capacity int NOT NULL,
  city varchar(20) NOT NULL,
  PRIMARY KEY (theatre_id)
);# ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


INSERT INTO `theatre` VALUES ('TH039',122,'Noida'),('TH100051',143,'Dehradun'),('TH10082',223,'Hyderabad'),('TH110065',199,'Faridabad'),('TH120011',187,'Mumbai'),('TH130079',210,'Delhi'),('TH140042',249,'Noida'),('TH150033',170,'Faridabad'),('TH160046',126,'Delhi'),('TH170071',109,'Delhi'),('TH180086',144,'Kolkata'),('TH190039',205,'Hyderabad'),('TH200012',143,'Bengaluru'),('TH20030',100,'Hyderabad'),('TH21007',202,'Chennai'),('TH220056',219,'Mumbai'),('TH230037',150,'Chennai'),('TH240055',241,'Delhi'),('TH25006',246,'Faridabad'),('TH260075',101,'Mumbai'),('TH270032',155,'Faridabad'),('TH280079',219,'Dehradun'),('TH290046',239,'Kolkata'),('TH30004',185,'Delhi'),('TH30098',148,'Chennai'),('TH310039',134,'Hyderabad'),('TH32004',108,'Gurugram'),('TH330023',182,'Faridabad'),('TH340020',138,'Hyderabad'),('TH350032',154,'Jaipur'),('TH360065',158,'Hyderabad'),('TH370094',151,'Chennai'),('TH380060',168,'Bengaluru'),('TH390064',111,'Noida'),('TH400026',229,'Faridabad'),('TH40043',226,'Delhi'),('TH410099',116,'Faridabad'),('TH420024',143,'Gurugram'),('TH430074',190,'Jaipur'),('TH440088',160,'Gurugram'),('TH450049',226,'Jaipur'),('TH460071',123,'Mumbai'),('TH470089',194,'Mumbai'),('TH480027',250,'Faridabad'),('TH490053',233,'Delhi'),('TH500056',122,'Gurugram'),('TH50043',150,'Bengaluru'),('TH510023',171,'Chennai'),('TH520098',217,'Bengaluru'),('TH530037',238,'Noida'),('TH540037',105,'Delhi'),('TH550031',216,'Faridabad'),('TH560019',213,'Gurugram'),('TH570018',105,'Kolkata'),('TH580095',202,'Kolkata'),('TH590016',121,'Noida'),('TH600097',229,'Faridabad'),('TH60098',233,'Mumbai'),('TH610082',235,'Hyderabad'),('TH620040',108,'Jaipur'),('TH63008',113,'Delhi'),('TH64005',119,'Mumbai'),('TH650081',158,'Chennai'),('TH660045',110,'Kolkata'),('TH670013',189,'Dehradun'),('TH680028',168,'Jaipur'),('TH69003',165,'Gurugram'),('TH700029',227,'Bengaluru'),('TH70034',112,'Chennai'),('TH710092',199,'Mumbai'),('TH72007',249,'Faridabad'),('TH730071',185,'Kolkata'),('TH740018',176,'Kolkata'),('TH750064',157,'Hyderabad'),('TH760035',137,'Mumbai'),('TH770037',182,'Chennai'),('TH780042',144,'Delhi'),('TH790033',142,'Jaipur'),('TH800047',230,'Hyderabad'),('TH80073',226,'Gurugram'),('TH810011',222,'Hyderabad'),('TH820085',212,'Faridabad'),('TH830082',203,'Bengaluru'),('TH840083',157,'Kolkata'),('TH850061',204,'Jaipur'),('TH860010',175,'Hyderabad'),('TH870054',210,'Kolkata'),('TH880023',169,'Chennai'),('TH890045',105,'Gurugram'),('TH900073',216,'Chennai'),('TH90043',222,'Gurugram'),('TH910087',239,'Faridabad'),('TH920056',145,'Hyderabad'),('TH930064',153,'Delhi'),('TH940013',230,'Chennai'),('TH950030',198,'Hyderabad'),('TH960030',171,'Faridabad'),('TH970088',141,'Bengaluru'),('TH980085',243,'Jaipur'),('TH990040',212,'Faridabad');



CREATE TABLE ticket (
  ticket_id varchar(50) NOT NULL,
  customer_id varchar(10) DEFAULT NULL,
  show_id varchar(10) NOT NULL,
  seat_numbers varchar(200) NOT NULL,
  PRIMARY KEY (ticket_id)
  #KEY `customer_id` (`customer_id`)
); # ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



INSERT INTO ticket VALUES ('TIND00006085-1F71-402F-B107-6B9E9D2B89B7','OFFLINE','SH110ASP','[11, 12]'),('TIND00006175-1F71-402F-B105-6B0E9D2B89B7','OFFLINE','SH821ASP','[95, 96]'),('TIND00006175-1F71-402F-B107-6B9E9D2B89B7','UI98000987','SH821ASP','[97, 83, 93, 98, 54]'),('TIND00006624-1F71-402F-B107-6B9E9D2B72B7','OFFLINE','SH114ASP','[44, 54, 55]'),('TIND00007898-1F71-402F-B107-6B9E9D2B89B7','OFFLINE','SH114ASP','[22]'),('TIND00008624-1F72-402F-B107-6B9E9D2B72B7','OFFLINE','SH110ASP','[56]'),('TIND00080BB3-CCF9-4442-9E81-A3286DB3F796','UI6300089','SH860ASP','[94]'),('TIND000BDC4E-8E54-42EB-A634-757453D06816','UI33800086','SH733ASP','[63, 94, 71, 95, 65]'),('TIND001781F3-77D4-4801-99AB-678D3AAF3A2D','UI99200063','SH898ASP','[71, 75]'),('TIND00A8AC7D-E255-477E-88C6-6E476DF43EE8','UI4200005','SH798ASP','[61, 70, 74, 86]'),('TIND00B6DEE3-55FF-46CE-9CA7-B0A0D739D1D9','UI19600061','SH280ASP','[92, 55, 49]'),('TIND00CD6605-2A18-4A32-8050-85F568C8A41B','UI59300014','SH674ASP','[57, 39, 61, 63, 83, 71]'),('TIND00F5227B-0821-478D-B3EC-1C8271EEC0FB','UI66700052','SH967ASP','[37, 57, 43, 99]'),('TIND01310307-F696-43B2-B159-486120454F1F','UI66500082','SH918ASP','[86, 74, 91, 90, 100]'),('TIND016AE431-8E8D-44FA-977A-541A3E78B1F0','UI55500048','SH443ASP','[96, 65, 31]'),('TIND01B929D4-4898-4531-A51F-45CD9222D781','UI60800060','SH397ASP','[40, 71, 74]'),('TIND01CDBBC0-ED69-4DAC-A255-3A89AC132FA4','UI15700055','SH659ASP','[47]'),('TIND01EA239D-4669-4EA6-90C4-BA0B62F1D518','UI62800023','SH447ASP','[84, 86]'),('TIND01F9124B-EFD6-47F8-97A5-8C6CDE5A18C9','UI92400052','SH319ASP','[57, 75, 90, 75, 65, 40]'),('TIND02005F15-90B7-4F6F-8899-1C6F11D53100','UI28700079','SH860ASP','[80, 46, 76]'),('TIND0262BBDC-0C1B-46E0-8046-BBB679924729','UI44000416','SH279ASP','[94, 49]'),('TIND02788898-E5F7-4BDB-91FC-EA3686246702','UI96700059','SH367ASP','[56, 60, 32, 34, 34, 34]'),('TIND030DD7E4-08F1-47EF-AF74-8F168A9A1916','UI44000045','SH671ASP','[50]'),('TIND0346AFD4-DB69-43AC-9793-5D6FE62EF531','UI52800013','SH288ASP','[75, 92, 69]'),('TIND0397457D-B341-4794-83FA-A37551698C7A','UI49600093','SH178ASP','[43, 65, 75]'),('TIND03E2475F-89CA-4048-98AA-394435ACDFEA','UI29000831','SH847ASP','[64]'),('TIND04004BA2-EBAA-49FC-A6A3-5D1D763516D0','UI38700084','SH732ASP','[57, 34, 91, 67, 63, 79]'),('TIND0400753A-11D2-47F2-8EFC-1448BF960B7D','UI26400093','SH937ASP','[93, 93, 95, 81, 98]'),('TIND047B50E3-F545-473F-A08C-A43521B91C44','UI25600067','SH319ASP','[91, 90, 55]'),('TIND0605E87F-78E0-4A80-99E1-F98B621DF8F4','UI19800045','SH718ASP','[52, 63]'),('TIND060F839B-A87D-4550-B828-E85DEC610E43','UI77400051','SH594ASP','[50, 54]'),('TIND06205202-FC0F-4573-8CE8-BB16E7F45A70','UI42000326','SH470ASP','[100, 56, 34]'),('TIND06812510-2603-4F01-BBC9-494903D7D9C8','UI18600045','SH320ASP','[37, 70]'),('TIND0688914B-B99C-4E2A-8C5F-A029F306EBD0','UI87800067','SH967ASP','[47, 91, 42]'),('TIND068F94A8-6DF4-43A1-A2B9-69652C47020B','UI28800010','SH113ASP','[80, 33, 50]'),('TIND06A10BA9-9DBC-4CC1-9119-685A3A1E92E1','UI91600037','SH285ASP','[88, 59, 85, 54, 44]'),('TIND06DA7E8F-B52B-4E50-8B0C-5470B20CDABB','UI71400097','SH899ASP','[72, 74]'),('TIND07374565-842C-4DCE-9BD3-012AF13628ED','UI41800041','SH821ASP','[96, 33, 64, 32, 60, 44]'),('TIND08602B33-8126-4CD0-ADF7-FBBFF66CF835','UI79000020','SH744ASP','[67, 64]'),('TIND086086AC-FE1C-462E-B127-83465F683AD7','UI92500037','SH305ASP','[44, 31, 31, 78, 34]'),('TIND0888B252-D538-4735-B887-62E64DAA9CD7','UI67900088','SH698ASP','[69, 58, 74, 51, 77, 82]'),('TIND08B07FF7-C25B-45BB-ABB7-4A3E9EBFE669','UI48600091','SH698ASP','[59, 36, 42, 91]'),('TIND0913BF0D-1463-4F8D-8A09-141B16CB4204','UI42800069','SH400ASP','[79, 46, 38, 39, 77, 82]'),('TIND0934C31A-D5C2-4F1E-8FF6-8704D95347A6','UI47300016','SH798ASP','[80, 62, 86, 59, 84, 99]'),('TIND095441A6-86AB-46BF-9C9A-E5F1CDC6E1D1','UI49100047','SH796ASP','[90, 73]'),('TIND09A390E2-33B6-441D-BAEF-51D41D10A764','UI87800067','SH257ASP','[43, 89, 43, 84]'),('TIND09B7DBEE-ED9D-4E9F-89BC-2681B14412DC','UI61000249','SH711ASP','[49]'),('TIND0A082357-B1AB-415A-8A1C-03EFA94F79C3','UI26900049','SH389ASP','[34, 49, 34]'),('TIND0A649F59-5C03-4C92-8615-AECEEBAF0E7F','UI63500016','SH235ASP','[61, 30, 60, 36]'),('TIND0A7024E2-556A-41EC-9A55-0DD2C3D55829','UI29400067','SH987ASP','[99, 36, 48]'),('TIND0A75DA75-EE54-4389-B36E-604B1F1EEDDC','UI38900077','SH795ASP','[50, 70, 65, 54, 90]'),('TIND0AA9B693-3F83-4D15-A956-9BB68953B5BE','UI57800080','SH230ASP','[38]'),('TIND0B18F293-110F-46ED-A405-F7718EC2E8D1','UI60900023','SH756ASP','[92]'),('TIND0B23CD99-6BF4-4BD2-872C-B5DCCE60C526','UI34900092','SH146ASP','[51, 84, 74]'),('TIND0B2904B3-3822-4A7C-B17A-34BA94765900','UI46600054','SH781ASP','[35, 32]'),('TIND0B300A11-ACFE-4005-A55B-A426077F8C1A','UI33000086','SH733ASP','[99, 58, 52]'),('TIND0B3AF345-5C12-48F1-A70C-48CE7D023396','UI52000088','SH903ASP','[57, 83]'),('TIND0B3F3823-A270-4EA5-9B99-CFAB4B0884A9','UI80900011','SH724ASP','[92, 36, 93, 85, 73, 82]'),('TIND0B461D0A-9A3E-4AB2-9A79-326D285C22D8','UI44300016','SH574ASP','[77, 97]'),('TIND0B8742FE-9F02-4C21-8AE3-A44B13911821','UI30100060','SH164ASP','[62, 51]'),('TIND0B8B4AF1-05E3-4E1D-A569-2F0F49923F68','UI39300041','SH796ASP','[38, 59, 81, 96, 57, 93]'),('TIND0BAEE96A-C90D-4208-BFEC-D3EE03D2D5B5','UI53200040','SH287ASP','[37, 72, 46, 83, 79, 99]'),('TIND0BDCAA0D-F84B-4D7D-B9C0-2BDF282B5DD7','UI53900069','SH484ASP','[61, 82, 32, 58, 94]'),('TIND0C7FDBE4-A40E-4FBF-968F-ECCE37119AFD','UI23900073','SH260ASP','[98, 96, 93, 82]'),('TIND0CA7C9ED-1AD1-42E8-AE63-16F6E4EB07EA','UI25500059','SH756ASP','[100, 63, 57, 88, 51, 61]'),('TIND0CEBD63A-5DE7-4F0F-85D2-B7587B3A5FD2','UI80900011','SH847ASP','[76]'),('TIND0D2D73CE-8CD7-4C22-A6B5-993A93A5720B','UI93600099','SH574ASP','[70, 55, 36, 33, 80, 89]'),('TIND0D543D88-6365-4D7C-B70A-5D253384E951','UI41100029','SH979ASP','[65, 72, 69]'),('TIND0D694B75-4880-414F-BDF2-ED852A0D1632','UI99600047','SH632ASP','[32, 98, 47]'),('TIND0D6A2D4D-4614-43D1-9100-E3106D6E4632','UI51700081','SH877ASP','[75]'),('TIND0D9D95A4-064A-4FDC-938B-3E5D299D07C2','UI80700011','SH538ASP','[42]'),('TIND0EDB71BE-450F-49A3-9883-BF01277B82EC','UI69000165','SH749ASP','[46, 60, 41]'),('TIND0F013300-E2DA-44B1-8F4B-74CC294FDFB3','UI72400064','SH162ASP','[39, 55]'),('TIND0F147715-1222-4E39-908C-D3C57BFB536E','UI16000056','SH583ASP','[56, 37, 88]'),('TIND0F16A2DD-6FEB-455C-9802-E4499708C6DA','UI19600061','SH974ASP','[78, 33, 82, 95, 56, 54]'),('TIND0F18DE90-8B17-4C98-910A-DE7E488EFC75','UI89500026','SH921ASP','[98, 89, 32, 84]'),('TIND0F5B1B8B-ECA8-4CFC-BD12-594B4B101D46','UI62900043','SH548ASP','[53, 96]'),('TIND0F8DB87B-9025-44D4-BDBA-0638FF948F59','UI76600036','SH110ASP','[98, 63, 62, 62, 52, 72]'),('TIND102E23B9-C493-41F5-A715-217654B604CD','UI15600081','SH388ASP','[99]'),('TIND104A98E1-14A6-4C79-BD5B-D08526269932','UI83600013','SH545ASP','[90]'),('TIND11551D9C-EB97-4A93-889E-2264BBC723CB','UI77600055','SH756ASP','[47, 62, 46]'),('TIND11955C91-8A48-45F9-A7EB-6114D72470CB','UI56200028','SH671ASP','[93, 73, 32, 75, 93]'),('TIND122B3D49-6AA8-4237-9DB1-9A7434657819','UI78400072','SH508ASP','[37, 93, 30]'),('TIND1272DD16-109E-47F7-8276-2F8A84C6A1CF','UI69300075','SH698ASP','[71, 49, 70, 44, 31, 42]'),('TIND12D94D69-3120-4A17-B1A6-759B38FAA910','UI35200062','SH771ASP','[43, 62, 40, 72, 61, 81]'),('TIND141CAE89-2392-4F85-90A6-F06256043FB8','UI48400086','SH941ASP','[33, 80, 73, 36, 36]'),('TIND1424D30B-BD4E-4686-A25F-E0A88CC4D22A','UI19000056','SH339ASP','[56, 34, 78, 73, 64, 89]'),('TIND1445E010-F306-4EF4-B47F-BEF9ECAB20D5','UI76000082','SH388ASP','[47, 90, 58, 55, 30]'),('TIND1454069C-140D-4351-AC86-653698B56DB6','UI91800037','SH512ASP','[66, 97]'),('TIND1515CDD3-15B0-401E-BC30-13AD8A9BAC1C','UI55700014','SH387ASP','[77, 64, 72, 81, 82]'),('TIND153B9949-06C6-4A32-9289-846A67C3D5F9','UI97800050','SH771ASP','[74, 35, 53, 38, 51]'),('TIND15A98091-469C-42EB-B32B-D58FB625539B','UI94100013','SH701ASP','[89, 50, 44, 81, 68, 61]'),('TIND15B1CA39-9A80-4C05-95BC-A8C76277F38B','UI67500051','SH287ASP','[81, 72]'),('TIND15DEDBCD-6BE9-4F34-B33E-4997EC694DBB','UI61200019','SH388ASP','[54]'),('TIND15E2046E-6CBF-4F58-B9EC-E0AC3F764307','UI13500070','SH470ASP','[63, 52, 92, 48, 57]'),('TIND16444434-AF80-4464-931D-7DE02F033C6E','UI59700020','SH309ASP','[47]'),('TIND1647978C-CA01-4491-A5CE-A6D914ACBE5B','UI81700097','SH755ASP','[60]'),('TIND16961D0B-7158-471B-977C-24B8AFC22FF0','UI26400093','SH538ASP','[95, 97]'),('TIND16BE6878-3C41-48AC-96F6-D01669175616','UI88800025','SH918ASP','[65, 47]'),('TIND18074C74-CD55-4961-9BCC-920514F47396','UI63400039','SH583ASP','[45, 45, 61, 50, 87]'),('TIND181312EC-925A-4041-86D9-731524BD8523','UI26600043','SH279ASP','[60, 86, 32, 66]'),('TIND18691AF7-DEAC-4801-B185-C7BAB3D92920','UI60000160','SH744ASP','[97, 84]'),('TIND18EAA341-2CE4-4C30-8A4A-CE46CC09C487','UI25600067','SH418ASP','[84]'),('TIND18F4D542-3319-4BA4-80A7-F9BCA4B536F1','UI56900028','SH830ASP','[65, 68]'),('TIND195727E6-F3EC-4A5D-A54B-21D763221E66','UI23400028','SH659ASP','[77, 76, 66, 49, 37]'),('TIND1964108C-EABB-49A6-BEB2-6B34B9632878','UI73000399','SH146ASP','[92]'),('TIND19D91662-3B95-4480-BDB3-DA2D7978CB51','UI35000097','SH345ASP','[40, 58]'),('TIND1A3687B2-2C25-47FD-8EE7-E1866CE1FE58','UI24600037','SH110ASP','[70]'),('TIND1B59B9EC-C068-4330-9526-02E627A33A3C','UI86900073','SH732ASP','[61, 92, 36, 90]'),('TIND1BAA7DC7-6E59-4697-9329-F97987280205','UI96200011','SH400ASP','[82, 89, 70, 96, 78, 39]'),('TIND1C0605C0-0ED9-4FB9-9D64-8AC18D0E9895','UI97000098','SH267ASP','[83, 49, 86, 60]'),('TIND1C3F314E-13B5-491D-80E0-F01E88DF05F8','UI47100088','SH181ASP','[48, 63, 71, 99, 73, 79]'),('TIND1C4B8F22-0FBC-4EB7-A988-5C657F7C838E','UI83900027','SH918ASP','[75, 74, 48, 85, 65, 42]'),('TIND1CA6AC33-53FE-4E53-854B-EB2BBE1BEA66','UI83400059','SH181ASP','[69, 78, 97, 97]'),('TIND1D14B105-CE9A-407E-8467-5611ED8BCF8E','UI33300042','SH625ASP','[37, 32, 64, 77, 61]'),('TIND1D21BA97-2221-4B6C-A694-1AC0EE8D174E','UI15800052','SH443ASP','[92, 70, 38]'),('TIND1D296960-DA65-47A2-B063-C0F14128472B','UI55500048','SH397ASP','[57, 52, 84, 67]'),('TIND1D2BE1AD-5602-4212-9AF7-44B8A7F19AD0','UI51400054','SH198ASP','[95, 99, 46]'),('TIND1D2C2FCE-1586-473A-AA4C-43E3DBBD7A69','UI1920008','SH660ASP','[82, 64]'),('TIND1DD3B8C8-482F-4247-9694-27A174FD8021','UI47600058','SH574ASP','[86, 42, 83]'),('TIND1E4524B3-7BC1-4BDB-B7E6-487A5673C9CB','UI36800054','SH576ASP','[97, 99, 35, 51, 87]'),('TIND1EBA1769-8C13-4B86-A0A2-CCCB577EE35D','UI37700015','SH588ASP','[93, 66, 99]'),('TIND1ED38831-14D2-482F-A6EE-D91835CD2513','UI86400047','SH597ASP','[89, 100]'),('TIND1EE2C48E-2272-45D4-8709-0040EAB0E869','UI62400014','SH545ASP','[30, 65, 96, 62, 74, 68]'),('TIND1EF94E81-7021-410E-B670-4C191EB2375A','UI75200028','SH711ASP','[72, 98, 67, 74, 57, 57]'),('TIND1F736DB6-FB54-4A48-BC57-16666CFF5F74','UI72600093','SH913ASP','[81, 85, 56, 51, 64, 78]'),('TIND1F8C6531-81F4-45E6-9C98-F1C947BBC076','UI67800075','SH427ASP','[100, 34, 44, 49, 99, 53]'),('TIND1FB1999F-6C67-43E1-89A9-DB9256DDA046','UI98800033','SH114ASP','[65, 33, 63, 99, 33, 64]'),('TIND1FB4512F-595F-4785-ACA9-A2206E7533EF','UI99100066','SH944ASP','[32, 59, 33, 51, 76, 61]'),('TIND1FD9BAA7-F24C-45B0-AA41-520D194E322F','UI73600061','SH200ASP','[86, 84, 68, 67, 100, 54]'),('TIND201A069D-0BF6-4D34-B610-B29A05137A5A','UI80900011','SH645ASP','[45, 86, 48, 92, 88]'),('TIND20255226-683F-4431-AAC4-6976E204ED8F','UI5190006','SH512ASP','[52, 80, 64]'),('TIND20291856-4F69-4399-969B-E398F6BD833B','UI27600067','SH226ASP','[73]'),('TIND2034FB53-FA13-40A8-A886-DD010758AA64','UI10000035','SH512ASP','[72, 35, 73, 58, 78]'),('TIND209D8058-A6C1-4EB1-837E-922E0EF1F111','UI65800079','SH156ASP','[93]'),('TIND20CCB31D-624C-40C5-A48B-E7D777CF6457','UI74300010','SH913ASP','[67, 38, 68, 33, 72]'),('TIND20D9ABD5-A27A-4BAF-9B66-900AE00A7755','UI44400010','SH546ASP','[74, 39, 81, 55]'),('TIND2198A551-3883-48F6-99C0-0726E9F9B7EC','UI95600039','SH639ASP','[43, 38, 83]'),('TIND21CCECFB-9398-4E57-BD8C-6028D97C44EF','UI18900029','SH305ASP','[94, 53, 96]'),('TIND2265727B-F786-4025-A48E-79F7258068CD','UI45200042','SH114ASP','[66, 89, 41, 97]'),('TIND22D7D5C6-2A48-41C7-8CED-CC6EEB88983F','UI51400054','SH345ASP','[88, 97]'),('TIND2333ABC7-335E-45C9-8C27-43DCCC2160F8','UI27700023','SH854ASP','[68, 63]'),('TIND23414AC3-6EF7-457E-83AF-2505005625B2','UI22400045','SH747ASP','[65, 82]'),('TIND2367970B-3AEE-4140-9D5A-FAC74A28E8A7','UI8600021','SH798ASP','[49, 61, 73, 73, 82]'),('TIND238E9CCF-05DA-445E-B100-A24B1BA885BA','UI31900055','SH996ASP','[47, 72, 55, 85]'),('TIND23AA6516-D045-4110-B6A2-28A158FFB6B0','UI64500014','SH275ASP','[51, 75, 94, 34, 80]'),('TIND23EBFD67-394F-4762-8B55-4718CD98CA53','UI17900040','SH418ASP','[92, 51, 85, 87, 84, 88]'),('TIND240C0F18-889A-496B-8D6B-7871A775C817','UI28700079','SH894ASP','[67, 69, 67, 99]'),('TIND24357E07-F524-455A-B1ED-FA6910DB14C2','UI61100019','SH857ASP','[94, 86, 51, 85]'),('TIND254514E7-6F7E-4FF4-B7AE-9494DBE6CDD1','UI50800039','SH944ASP','[79, 94, 58]'),('TIND25D9F69F-0EFA-4937-9C08-BA23E1ACD841','UI73200014','SH977ASP','[67]'),('TIND25E4EAB6-5A49-401A-BC1A-25A52F345FE9','UI56100039','SH904ASP','[42, 93, 97, 52, 44, 84]'),('TIND2609E151-D2CB-4FA1-8296-DE6E876DC599','UI49400088','SH232ASP','[88, 74, 87, 57, 87, 80]'),('TIND262CA3FE-F08B-4EB9-A70B-CFEBC49005EA','UI99900092','SH537ASP','[50, 94, 92, 83]'),('TIND26314EFE-7429-4C43-B8B9-A48798CB1408','UI16400045','SH420ASP','[83, 46, 34, 95]'),('TIND269F0413-4107-4A40-81FC-2E1F5B7D82B3','UI61500012','SH601ASP','[44, 75, 30]'),('TIND26F69CDB-9DA2-49CE-87B0-6F76E77820C7','UI71400097','SH114ASP','[79]'),('TIND270E3C65-CD5F-4FDC-8B3E-535CE5A78E60','UI26000078','SH418ASP','[62, 90]'),('TIND2791127D-0A2D-427D-B83E-CBE205FEC1D2','UI64300037','SH251ASP','[56, 63, 32, 80, 64, 43]'),('TIND27B36FC6-CE3F-427C-BA84-AB8A122CA818','UI82100071','SH596ASP','[47, 91, 94, 80, 71]'),('TIND27CFD56F-D2F9-404B-8517-E9AF7E8A756B','UI82900031','SH904ASP','[99, 30, 39, 57, 86, 46]'),('TIND27D0CD81-B076-4960-BFEF-66906FB0F60A','UI40700081','SH180ASP','[45, 78, 84, 85, 75, 35]'),('TIND281234CD-DB64-4EF6-8894-FA0F08508268','UI59000095','SH261ASP','[81, 90]'),('TIND28F62D0B-B359-4F9A-88FC-A9D92AACFEEA','UI90700059','SH744ASP','[84, 35, 72, 36, 67, 77]'),('TIND297CA0AD-16A2-4129-8CDC-A94C81DB6DA7','UI69000165','SH576ASP','[82, 65, 93]'),('TIND29B8B051-4C85-42F7-9562-751609243E5E','UI51000013','SH815ASP','[58, 31, 70]'),('TIND29C7CCC0-8093-48AD-A5DB-EC7A72BD5500','UI7000582','SH227ASP','[68, 64]'),('TIND29FB7A01-A745-4B52-B4EF-45EFC2D5CFB4','UI13100050','SH879ASP','[99, 39, 56, 91, 68, 47]'),('TIND2A42E74F-433F-41F4-AAD8-BAC47807EB33','UI73800079','SH542ASP','[66, 52, 51, 90, 93, 93]'),('TIND2A8D0099-E73C-48F4-8672-476597D4301B','UI46600054','SH448ASP','[38]'),('TIND2AA146C8-36A4-42F6-81FE-F85746CDF7AE','UI76800023','SH917ASP','[36, 36, 55, 34, 86, 66]'),('TIND2AF34D87-F6A6-4310-892F-F3209918CBD4','UI81800010','SH778ASP','[63, 96, 42, 46]'),('TIND2B083C4E-6D53-46BD-832B-EF1FEAD838C4','UI26500089','SH198ASP','[50, 47]'),('TIND2B2BF3BE-DF67-4FD1-B182-4EE01827AE8F','UI13600048','SH142ASP','[81, 51, 44, 56, 49]'),('TIND2B7C71BF-8AD7-4519-BB62-025155A8F453','UI44600063','SH983ASP','[37, 63, 75, 45]'),('TIND2BA4DD61-B112-4698-9557-9C91E75B71FE','UI6300001','SH821ASP','[51]'),('TIND2BB1B1B5-0BFC-46D2-85D6-A99F3DCEE378','UI72000036','SH146ASP','[48, 61, 87]'),('TIND2C28BBB2-BF12-458F-936A-4ACC18341407','UI26000078','SH808ASP','[69, 68]'),('TIND2CBD9995-495C-4833-B790-0898F38285DA','UI47900044','SH711ASP','[76, 79, 87, 65, 37]'),('TIND2CC77B17-8BF0-4274-BE6F-21E36643F78D','UI40100013','SH711ASP','[50, 57, 95, 87]'),('TIND2D37DC07-825E-4DE7-A195-4A9B6EEA8AE0','UI73000399','SH367ASP','[49, 74]'),('TIND2DA8D6D6-F213-4FA5-964F-8C221D161356','UI87400058','SH913ASP','[32]'),('TIND2DD2684E-9032-41CC-A5AE-5A24C5241192','UI18900029','SH729ASP','[76, 42]'),('TIND2DE5C20D-40EA-48F5-89F3-94B335F3B302','UI12000592','SH198ASP','[43]'),('TIND2E2E57E3-EF4A-4B1E-8C87-9A75794E4CB8','UI23900073','SH389ASP','[95, 44, 98, 35, 73, 53]'),('TIND2E3F135A-1E7A-4533-B569-E80578F2BC45','UI25200045','SH821ASP','[36, 52, 71]'),('TIND2E439C20-B4AB-4DC4-9E3A-382C07328155','UI96300069','SH798ASP','[68]'),('TIND2ED111B4-33B1-46C9-8E35-C5454558DA63','UI76100065','SH417ASP','[68]'),('TIND2EFA92CD-75A6-4021-90C1-8FCED0511AA4','UI43600052','SH679ASP','[71]'),('TIND2F285847-9CAA-4C56-A5DB-BCD1EE6228E1','UI36300051','SH527ASP','[96, 83, 53, 99, 95]'),('TIND2F6415BF-845E-4C26-8CA7-6F6EB4CE9D0A','UI58300057','SH724ASP','[39, 97]'),('TIND2F791D66-5EE4-443E-A4E3-38CBD5D54B6A','UI26900049','SH447ASP','[55, 46]'),('TIND2FE58545-794C-4372-9D6B-9AFAB7BE8C73','UI70300079','SH680ASP','[42]'),('TIND2FF62E71-9240-4AB6-B521-2AAF3AD405A4','UI70700011','SH321ASP','[80, 99, 42]'),('TIND30113C95-5C63-4EF7-8420-890C9D693831','UI45200042','SH716ASP','[77]'),('TIND301E95AD-46C0-4B39-BAAB-C01FB96ACC60','UI28900047','SH904ASP','[43, 30, 52, 71]'),('TIND3021862E-9C1B-461F-8C65-1B45D23A199D','UI81700097','SH567ASP','[62, 36]'),('TIND304D3591-D2BC-47A8-BAC0-FEC757A7C07C','UI62100016','SH957ASP','[65, 66]'),('TIND3075029E-ECAE-4051-9CF9-4D46E99AA54A','UI78100023','SH198ASP','[37]'),('TIND3105C96B-E3E5-4E26-A750-FFFC13E351E0','UI23600054','SH302ASP','[78]'),('TIND318546F3-F262-4713-A64A-C81499EC38EE','UI88400024','SH596ASP','[54, 46]'),('TIND321BEBA4-5AC3-466F-ADB2-DCA858BCFCE8','UI78600072','SH978ASP','[57, 98, 30]'),('TIND32280331-6C99-478D-8ED8-BD5D2E811062','UI41400094','SH877ASP','[40, 62, 87]'),('TIND328E6B14-6DA2-41A6-9876-48EF25A1A768','UI55400035','SH257ASP','[52]'),('TIND32AC6310-0F53-4382-9CE2-DE7287A3F075','UI57600035','SH978ASP','[59, 56, 78, 56, 74, 84]'),('TIND32CD85CF-5E51-449F-9363-39506957346B','UI65600091','SH279ASP','[74, 88, 97]'),('TIND32E29502-3012-4FD3-9D19-0FD5FAA7931A','UI82500039','SH894ASP','[85, 90, 70]'),('TIND33081B9A-16E0-4183-8AE3-9F6925606A15','UI82700081','SH542ASP','[61, 83, 47, 75, 74]'),('TIND33A5CA06-3DD8-4BFA-A1DC-47F4DF7C64F9','UI43600052','SH722ASP','[85, 49, 77]'),('TIND346C4BA6-B239-4C19-B8DF-8D2AF95F421B','UI61600087','SH178ASP','[92]'),('TIND34842F7D-A843-4378-9D59-F3C5C16F281E','UI17600049','SH232ASP','[30, 75, 52, 80]'),('TIND34A0B500-EABD-4355-AF94-2928B61B26AE','UI76000427','SH588ASP','[92, 32]'),('TIND34A6A149-F3C4-4126-B299-761A400B8279','UI36700041','SH979ASP','[88, 53, 35, 52]'),('TIND352C551B-ADB0-4902-BAD9-DF62163493F7','UI98100074','SH729ASP','[98, 93, 86, 100, 68, 37]'),('TIND35480B87-3089-436A-8570-E0EAAB8C95E8','UI61800018','SH278ASP','[45, 56, 86]'),('TIND35D34552-0620-4445-B048-87735F2B86A3','UI79100018','SH876ASP','[45, 57]'),('TIND35FCFF8A-422C-41F7-9C38-8B7ED01D5753','UI88600060','SH275ASP','[65, 58, 36, 61, 52]'),('TIND365BDC5F-B089-4F41-BD2F-EDC458A979C3','UI39200090','SH285ASP','[34, 78, 78, 59, 80, 63]'),('TIND36C52095-4E45-492D-A7DC-18199927D567','UI20800081','SH850ASP','[70, 34, 61, 34, 90]'),('TIND371F9EBC-475D-4A3D-BAB9-27CED9792D72','UI21400071','SH967ASP','[38]'),('TIND378EF04E-8191-4DC8-A429-1EFFD3E02BFE','UI59000095','SH833ASP','[69]'),('TIND37A5528A-AB6B-494A-836C-DEBEA3FA6A36','UI72100095','SH418ASP','[43, 87]'),('TIND37C32C28-CCF5-4170-9CB6-DCA62ACAB196','UI80100065','SH305ASP','[93]'),('TIND37C6E872-8B17-43AD-9D78-E14C497439DE','UI94100013','SH200ASP','[83]'),('TIND37DC378E-79AE-4B70-8573-D73C91CC925E','UI28700079','SH148ASP','[66, 49, 90, 59]'),('TIND388C0832-8965-46D6-BC6D-9994BA72E8CA','UI58600092','SH944ASP','[40, 99, 58, 92, 43]'),('TIND38EEE24E-B704-47F1-8678-88095A0030E3','UI67700062','SH977ASP','[98, 53, 58]'),('TIND39FFCC91-2BF3-4BCF-B91C-69E185C3ACCC','UI96500070','SH815ASP','[39, 78, 43]'),('TIND3B332EF0-C222-4B79-89E4-A15E8AA81F9E','UI81100058','SH478ASP','[78, 59, 38]'),('TIND3C1B2D6A-00DD-4BB7-8BEC-35CDB2756090','UI42800069','SH941ASP','[70, 53, 92, 38, 83]'),('TIND3C43AE6D-022A-4C10-9DC2-E5494335234B','UI58200028','SH596ASP','[89, 76, 78]'),('TIND3CC27E36-AA01-4602-BD03-585BDAE46659','UI25300099','SH366ASP','[100, 47]'),('TIND3CC4270B-D318-4075-8DD8-97028F11B580','UI67000033','SH226ASP','[33, 62, 75, 72, 40]'),('TIND3CDE1E3C-D842-49FC-B4AE-82F19CD051D2','UI13500070','SH698ASP','[66, 55, 76, 54, 49, 62]'),('TIND3CE991E7-4057-46B3-B4D1-B526D62F4D30','UI21700030','SH367ASP','[75, 87, 60, 30]'),('TIND3D0BE3C7-7F54-4769-B2BE-F00A0B5F5D81','UI25400042','SH833ASP','[31, 57, 37, 30, 60, 79]'),('TIND3D2EC836-F369-442E-85BD-488FB2E04A9D','UI79700091','SH146ASP','[75, 53, 86]'),('TIND3D360513-F503-4790-86F8-509F144A1A0E','UI11300083','SH808ASP','[69, 34, 36]'),('TIND3D998B71-78EC-43EB-8FED-77B5B7DB9FE7','UI96500070','SH711ASP','[51, 96, 54]'),('TIND3E8F0871-E4A8-43B5-BA7D-E263E3436DCE','UI46000044','SH507ASP','[62]'),('TIND3F0138AD-1EE6-4B12-A139-4FA6E34CF7CF','UI70400097','SH204ASP','[72]'),('TIND3F057001-DD69-4EB3-9DCE-2423ACA3C02F','UI81900032','SH722ASP','[46, 35]'),('TIND3F866769-A314-4F99-8DD0-BE10CD8CFEE5','UI83100044','SH294ASP','[38]'),('TIND4058DF00-5922-4628-8FAB-6BF7C0AD60DE','UI24100025','SH982ASP','[43, 70, 66, 45, 76, 41]'),('TIND40C25D3C-3DBD-4EED-9E9D-0C538E4D9DDA','UI24600037','SH181ASP','[94, 60, 91, 65]'),('TIND40D6AD75-BE78-4C0D-80C9-739A7DDFABFC','UI36000736','SH974ASP','[72]'),('TIND4134A0CC-53A8-4F7A-9C7D-34EDB663B711','UI76100065','SH493ASP','[53, 41, 93, 59]'),('TIND417E2000-02E4-46D0-B726-3EB40BA25045','UI57700062','SH105ASP','[87, 62, 62]'),('TIND41D20678-973D-446B-993A-591F03EDF3F1','UI80700011','SH941ASP','[99, 50, 87, 36, 96]'),('TIND4202974D-B31C-4C99-AAC3-8510019EA181','UI4200005','SH701ASP','[59, 81, 100, 94]'),('TIND42B9119F-C076-4FD3-B477-7F0E547DB115','UI33600029','SH625ASP','[87, 91, 56, 36, 67]'),('TIND42F679F3-DD44-49AF-88D8-F1844483FFC9','UI9430001','SH716ASP','[62, 99, 66, 94]'),('TIND4308D664-7F85-48EA-A900-E3A800FA71F2','UI42300070','SH594ASP','[48, 65, 77, 46, 60, 96]'),('TIND43648865-0777-46A1-92FE-CAF5582E3B46','UI46000197','SH269ASP','[92, 84]'),('TIND4370EF33-225B-491E-AE8E-DC8EDB3F1357','UI33100072','SH747ASP','[83, 64, 32, 98]'),('TIND43984C02-D7A3-4189-958B-09E700442146','UI71400097','SH351ASP','[84, 66, 50, 70, 45]'),('TIND43BF0192-1B99-4CDB-AF84-03F0341451C7','UI99400026','SH448ASP','[31, 85, 32, 38, 35]'),('TIND4401210D-40FE-412D-931A-C2A4CC27F126','UI6300089','SH470ASP','[30, 99, 32, 77, 74]'),('TIND440CF44F-AF20-470D-B792-C355F6E18365','UI34200097','SH561ASP','[42, 60, 92]'),('TIND44126956-652D-4673-B042-630927E2D98F','UI83000076','SH302ASP','[41, 32, 35, 82]'),('TIND44A4E1AD-95ED-448B-8DDD-ACE615766423','UI89100011','SH594ASP','[64, 42, 44]'),('TIND44CDB0A5-1B22-49B4-B353-3F3F4748144F','UI17900040','SH749ASP','[83]'),('TIND4523C0EE-9749-4A78-BA94-AA212309856B','UI82400069','SH847ASP','[67, 96]'),('TIND45536F63-FD89-45E8-8159-6CBA9DE17613','UI31800076','SH671ASP','[69]'),('TIND45605BD3-654E-42FC-AF75-C845898BFF7D','UI19100045','SH555ASP','[53, 94, 45]'),('TIND4624D710-03CF-4543-B875-800E621EF182','UI93300095','SH548ASP','[55, 78, 93, 83]'),('TIND4631D52E-0F9E-4571-9E8B-D29BF7A115B7','UI91000080','SH232ASP','[92, 99]'),('TIND469BCEFB-9173-4505-A2DC-1481CE6D7D6A','UI33400087','SH936ASP','[99, 60, 73, 86, 46, 82]'),('TIND46A0A290-D641-42B2-BDA8-6D54B871DC67','UI61800018','SH917ASP','[73]'),('TIND46E1CDF8-DF46-466B-A4B4-815DC27F613B','UI91100052','SH389ASP','[91, 78]'),('TIND46FD70F7-8548-49AE-942B-57BA93647D1B','UI26100072','SH387ASP','[37, 59, 89, 88, 64]'),('TIND47005B42-8AAC-4BF0-9EFE-25D2525C7B50','UI92000978','SH879ASP','[30]'),('TIND471077C9-C4B2-4E03-8056-9A09CF2461CD','UI93100040','SH257ASP','[36, 58]'),('TIND4755EADF-8489-4002-AB64-47A23C47907C','UI70000018','SH732ASP','[70, 91, 33]'),('TIND47DBAE5A-4B67-49A9-B1E6-A1810F97F25B','UI95000665','SH209ASP','[87, 69]'),('TIND47DCFDC2-18BE-4149-A282-6BE91464194A','UI58900041','SH204ASP','[44, 48, 78, 77]'),('TIND47F91740-C479-4109-B67C-88E07F29B43F','UI32700092','SH712ASP','[50, 48]'),('TIND481E7A5C-23D2-47C8-8F03-E508839BB952','UI80000191','SH458ASP','[72, 86]'),('TIND48499D9A-2D0F-49E2-8AB4-FDD9A2111608','UI58300057','SH983ASP','[90, 65, 64]'),('TIND49A60A68-6DE4-4FDB-AD1E-C604C4B8DD7F','UI97900052','SH716ASP','[66, 75, 78, 97, 42, 60]'),('TIND49BD074E-B196-445F-B6D6-4880C36755C3','UI95900015','SH912ASP','[52, 38]'),('TIND49E1407B-95D2-40FC-B6DB-30DE35BA2737','UI26100072','SH921ASP','[40]'),('TIND49E60D97-0D48-4C2F-AC44-AD88D07BC93B','UI91800037','SH142ASP','[69, 43, 64, 80]'),('TIND4A051857-7A40-4185-8A9E-C8CA158CF7C7','UI73100060','SH507ASP','[44, 33, 49]'),('TIND4A5C90FF-555F-435B-9235-D390E00E0849','UI57300092','SH574ASP','[44, 95]'),('TIND4AF14E5C-7BE4-4CD3-BB62-EFBAF19593AB','UI19700079','SH110ASP','[40, 83, 83, 62, 75, 100]'),('TIND4B7E7C65-CB47-4A32-BA52-B677A3CBC497','UI13900010','SH288ASP','[41, 79, 55]'),('TIND4B92DD71-ACAF-4E99-B1C5-B22B7C11D25A','UI38500014','SH300ASP','[40, 45]'),('TIND4BEDB135-3A07-42DA-98C0-26B67AF84165','UI71600076','SH389ASP','[41, 52, 82]'),('TIND4C6AA29C-E940-4FCE-BDFB-A55816EA8850','UI30400060','SH679ASP','[60, 87, 30, 57, 72]'),('TIND4CABE350-7A77-4167-9CC4-D7A0601FD3D4','UI95000665','SH511ASP','[98, 94, 31, 39, 90]'),('TIND4CC1CBBB-C4D0-4B5E-8F15-AD6102A2B153','UI17400060','SH200ASP','[33]'),('TIND4DAEC4AA-A9ED-4EFC-9C45-F0C4B49047B8','UI78800079','SH742ASP','[37, 85, 51, 93, 96, 77]'),('TIND4DF93242-9A7F-465A-A43E-E472DFEFD03F','UI54400099','SH645ASP','[99]'),('TIND4E1CCD22-9DAD-4656-A98F-9F7C549EF4FA','UI10800046','SH857ASP','[93, 63]'),('TIND4E4F87BE-BC54-418D-8434-CA5BD0194351','UI98100074','SH319ASP','[100, 81, 67, 30, 48, 87]'),('TIND4E6C5E2D-790B-43FA-A5F7-20E8869A20D5','UI66200013','SH841ASP','[100, 43, 91, 40]'),('TIND4E6F8E54-47EE-4465-97F7-9A1592806DB7','UI38400073','SH680ASP','[89, 74, 85, 41, 40, 37]'),('TIND4E8654CA-89B8-4013-AC01-10E8D9B4F577','UI73500035','SH475ASP','[69, 53, 36]'),('TIND4F7EF774-CD9C-4C51-B5B2-81E7563FDF8E','UI66600035','SH388ASP','[96, 84, 52, 84, 46]'),('TIND4FB5E5DA-DE06-4353-BC4D-375C1924052E','UI1000023','SH202ASP','[80, 47, 58, 42, 84]'),('TIND4FD22EA3-B891-42B1-BE95-31E812CD4DAE','UI53000233','SH400ASP','[54, 70, 80]'),('TIND4FDE4940-C7D0-49D9-8B43-2D30CCD190D4','UI84800063','SH319ASP','[68, 91, 95, 68, 66]'),('TIND500BF550-B88F-4781-82A9-B92B78F5C572','UI13100050','SH987ASP','[85, 72]'),('TIND50427A56-D3E2-40CE-8020-4ABC073EC709','UI96900095','SH729ASP','[98, 62, 95, 61]'),('TIND504A6356-D5FE-4717-9109-9A883277F6B4','UI86400047','SH588ASP','[34, 53, 66]'),('TIND5096A6DA-A01A-4B6B-9C28-E67EFF25D1F7','UI52900046','SH278ASP','[76, 32, 58, 47, 40]'),('TIND50A37C63-5411-41AA-9D92-24B4816D9FE0','UI87900017','SH180ASP','[71]'),('TIND50E66A6F-9E9A-4CAF-988B-85AF60CC5800','UI62600070','SH257ASP','[74, 78, 73]'),('TIND50ED3060-B0B8-4F8E-9C99-42F86A02DFFE','UI37900081','SH542ASP','[91, 40, 84, 49, 50]'),('TIND51221575-8CC1-4E6C-95D8-81F3E3E28DD7','UI17500087','SH634ASP','[38, 65, 36, 34, 92, 89]'),('TIND51823154-968B-4CBB-9028-4B434633FD21','UI22000053','SH336ASP','[87]'),('TIND52198997-1E6E-4664-87E0-8C0E197A6448','UI33400087','SH625ASP','[34, 45]'),('TIND52291FB1-FB14-44D3-B206-909B82A66E6E','UI13900010','SH387ASP','[40]'),('TIND52C838D8-B52A-4431-9439-4FB61E3D37FE','UI12000592','SH781ASP','[76, 44, 95]'),('TIND5319BF6C-C33D-4230-BA61-918B4AE95245','UI62200043','SH545ASP','[65, 84]'),('TIND5329D5F1-D560-4DD8-90D8-4C1DA5982E93','UI30900071','SH561ASP','[35]'),('TIND538E3E05-3173-4BD2-A2EC-4FB8B447062D','UI73200014','SH501ASP','[43]'),('TIND539A153D-672B-4224-A8F6-295804EC8368','UI87100042','SH545ASP','[73, 95, 76, 63, 67]'),('TIND53BB2AE7-EBD2-41DB-A9FB-57787F0A70D3','UI46400062','SH561ASP','[82, 65, 64, 68, 39, 83]'),('TIND54727100-B368-4748-9530-B6DF4D4A638C','UI30000075','SH142ASP','[69, 30, 74, 62]'),('TIND54D10491-6EAC-4859-92D4-5C19C899D8F2','UI15900033','SH833ASP','[45]'),('TIND54D39520-6127-4854-9AD5-4FA54861E999','UI27800078','SH711ASP','[81, 39, 58, 47, 100, 48]'),('TIND550C4834-2C94-49AE-A9D8-FEADD2DD90CD','UI46700026','SH941ASP','[62]'),('TIND551B08D7-DCB9-4919-AA81-E830B6084F5A','UI33700077','SH718ASP','[59, 50, 88, 36, 71]'),('TIND551B5FF8-050B-47FC-B5E9-3F91E804131D','UI70900098','SH548ASP','[100, 42, 40, 94]'),('TIND554DFCFF-09FC-45FB-A1EC-EF464F19F652','UI72900038','SH851ASP','[75]'),('TIND55A88A52-1598-42C5-8EF0-1B3335BC649A','UI28700079','SH857ASP','[34, 90, 81, 51, 83]'),('TIND55E7E842-9EA1-401F-A758-5F395CEF9942','UI95000665','SH862ASP','[69, 51, 48, 73, 47]'),('TIND565E6E85-FA94-4DE5-B624-8CC25CBE3992','UI49200071','SH338ASP','[60, 54]'),('TIND56725A1C-F62D-4A0B-A4D0-CB30C95EAB51','UI69500015','SH729ASP','[95, 91]'),('TIND56FD6049-9ECC-4B99-AD03-5C62A989D8AC','UI7700055','SH478ASP','[85, 35, 62]'),('TIND571E2E77-3434-4FE4-8445-F5B64E5FAA30','UI26400093','SH862ASP','[89, 30, 74, 54, 37]'),('TIND5833759D-B5D5-4AD8-93D3-21D6BABE59F5','UI64900098','SH712ASP','[97, 90, 83, 66]'),('TIND5925164B-41E1-4A79-AC77-A205B58C5F76','UI79300055','SH876ASP','[81, 46, 89, 52, 63]'),('TIND59462F2B-1029-4ACA-AF44-2B75EF6F20C9','UI4160004','SH833ASP','[59, 97]'),('TIND59BF426B-E9B2-42FA-8A5D-D65D22413C43','UI12600080','SH857ASP','[89, 53]'),('TIND5A93E577-BE2B-4575-9851-61F486E6C2F1','UI12000071','SH458ASP','[100, 43, 67, 47, 55]'),('TIND5AAF7605-2E38-44A1-A4AC-B6BF1D37E9F5','UI78700040','SH879ASP','[30, 62, 79]'),('TIND5ADFCFF7-3227-4256-A09F-97FC1C2D0B81','UI67400046','SH336ASP','[48, 84, 95, 94]'),('TIND5B03B2B5-6EAF-4C42-B406-5BCA2B1D01C9','UI56100039','SH755ASP','[39, 57, 64, 80]'),('TIND5B0B5D22-E3A7-424A-88B3-6773341A0CF6','UI52000201','SH309ASP','[76, 86]'),('TIND5B14490B-F994-4AE9-8ACC-FD4D8AD1D6E6','UI38900077','SH659ASP','[48, 94, 82]'),('TIND5B39EC5F-30F8-46E0-966D-7F2643840388','UI23100036','SH226ASP','[92, 95, 47, 89, 96, 67]'),('TIND5B9E3892-B03B-4B41-AD73-15EBE085A890','UI65500066','SH747ASP','[72, 48, 55, 89]'),('TIND5BBC3CA2-38B9-4912-9223-5499CA2B3A03','UI63700031','SH294ASP','[48, 36, 76, 96, 62, 85]'),('TIND5C082E12-0402-4C8B-8186-49D4706DA0EC','UI43800090','SH561ASP','[50, 35, 68, 52, 63]'),('TIND5C165DBA-54B6-46BC-A2DE-96F4722B1E00','UI69400092','SH392ASP','[32]'),('TIND5CE8C2C3-0622-4266-B77F-3EF924D29823','UI37700015','SH275ASP','[99]'),('TIND5D025CAD-85A3-4A75-B700-85D0FC71D930','UI77600055','SH537ASP','[60, 61, 59]'),('TIND5D478444-358F-4302-BECA-45FD1C3D57B1','UI73700065','SH478ASP','[80, 44, 32, 100, 46]'),('TIND5D92544F-7AC5-48DC-BCC3-F1F59DCD1443','UI91400079','SH493ASP','[85, 66, 54, 46]'),('TIND5DAB9597-C1FA-4F7C-A08C-03BD99D9D2E5','UI12000071','SH615ASP','[86]'),('TIND5DEFA028-9A83-4548-BCA5-678A9C5BD94B','UI17000151','SH165ASP','[48, 44, 88, 51, 70, 97]'),('TIND5E4EF47C-1764-487F-A4E6-D84D2FF3A171','UI40300029','SH615ASP','[58, 72, 90]'),('TIND5E9A3E72-773F-4293-A747-BA0FF0B16152','UI38400073','SH798ASP','[77, 78, 99, 83, 78]'),('TIND5ED01DAF-644E-4DDF-A978-61D1E1535CD8','UI10700015','SH625ASP','[98, 40, 35, 30]'),('TIND5F9223F2-9C4A-430F-855B-2053E23CAA92','UI90200036','SH250ASP','[45, 51, 70, 93, 71, 91]'),('TIND5FAE8930-4C6A-4C10-83C8-E52105BA028A','UI82400069','SH854ASP','[43, 76, 55, 39, 46, 60]'),('TIND5FC40787-4A7D-49EA-8FC5-1DB44906B08C','UI70000018','SH977ASP','[70, 35, 70, 97, 67, 94]'),('TIND5FD24542-B6E1-40AA-93B7-52A698F1C1A3','UI16900040','SH722ASP','[38, 57, 57, 46]'),('TIND5FE6A65E-B621-43A0-BCD3-9A187AB12135','UI61000249','SH235ASP','[45, 65]'),('TIND5FFEB4BF-E456-4120-918C-3A765285ACD6','UI48300092','SH146ASP','[64, 87, 30, 79, 33, 71]'),('TIND6029AFE3-CABC-4802-A909-304C3FDD7510','UI52600053','SH957ASP','[65, 42]'),('TIND603AB84B-7F7D-47D2-B563-A91589E60713','UI58800079','SH110ASP','[51, 51]'),('TIND605E6B9B-95BC-456F-AEBB-67F09D276C6A','UI76400095','SH698ASP','[48, 59]'),('TIND60689D64-89D8-4DF8-80B0-BABC19F61ED9','UI53100057','SH475ASP','[92, 45, 66, 89]'),('TIND609FE72C-8237-4B50-AF2B-C15D53E2187C','UI69500015','SH527ASP','[69]'),('TIND6135D513-B108-4741-BDBB-2DC2011F7376','UI47900044','SH798ASP','[63, 82, 96]'),('TIND617DEBA8-AF2A-434F-BC3D-C4B218F2FF7F','UI6300089','SH548ASP','[49, 89]'),('TIND618F8B06-FD21-4E1A-8A2D-1C651B14BF1C','UI59300014','SH280ASP','[81]'),('TIND61A1881D-946E-4D98-8B74-A65F16E12514','UI49300044','SH548ASP','[67, 62, 98, 80, 73]'),('TIND626A21EE-98B8-48DE-8FE6-7C6B073E98A8','UI52300010','SH427ASP','[80]'),('TIND628FDECD-01F0-4386-9439-9E8EA277A0F1','UI45700067','SH567ASP','[71, 68, 61, 65]'),('TIND6329D767-E061-4F0C-AABB-7F5072D06048','UI25400042','SH798ASP','[53, 35, 77, 98, 72]'),('TIND6461A3C8-E0A1-46F0-8C3F-E18EAE45120B','UI79200046','SH808ASP','[91, 90]'),('TIND6474CD27-E42B-4CB9-800A-B75D8D8BCED6','UI53900069','SH850ASP','[35, 93, 73, 37, 71, 66]'),('TIND64B17BEE-E139-4537-98E6-5542BB6ED75C','UI52100084','SH857ASP','[64, 76, 87, 64, 80, 30]'),('TIND64B546E8-5A89-4985-88AF-8968BFCCE456','UI20000099','SH879ASP','[59, 97, 90, 54, 85, 34]'),('TIND64D8C1C9-BC80-4E8C-8203-F38FFEA3D795','UI71800040','SH420ASP','[79]'),('TIND64E0FDBD-6202-45DA-8520-594B119E95BC','UI73200014','SH778ASP','[99, 74, 90, 88, 82, 53]'),('TIND65260C5E-AA68-4450-A4B0-193BF0D68D98','UI69000165','SH417ASP','[42, 91, 55, 70, 98, 60]'),('TIND65B574B8-E74A-4814-A570-2AA2669DFE79','UI89000573','SH634ASP','[47, 80, 66, 50, 97]'),('TIND66628418-30EA-41A8-935E-52D2B3090D15','UI50500035','SH921ASP','[98, 60, 90, 55]'),('TIND66842660-EDD7-49A2-81EA-6114A4BCB0C2','UI88000025','SH458ASP','[99]'),('TIND66865CBB-915B-44AB-9F10-667E9EF4B678','UI29700020','SH142ASP','[82, 44, 66, 68, 75]'),('TIND6699E2CB-2F38-4F15-85AD-F078D61F551C','UI72000427','SH470ASP','[96, 59, 73, 58, 77]'),('TIND66AA7EAC-2E23-4E3A-B286-CC6CE567E501','UI74400040','SH165ASP','[43]'),('TIND66DECEBC-0213-4F4F-B25D-39ADFC695F0B','UI46200086','SH287ASP','[98, 43]'),('TIND66FEADF4-613D-4C5A-8DC0-E0F18A01AC63','UI88600060','SH805ASP','[85]'),('TIND6705402C-2DC3-45BA-BA6C-69C6AB3C8B9F','UI48800035','SH978ASP','[39, 72, 67, 41, 55, 82]'),('TIND67788863-EEFF-4862-BF19-24592E013E3D','UI72700040','SH103ASP','[54, 36, 87, 39]'),('TIND67808B44-E1D0-4DAB-BCC9-69EAA7D89DD6','UI90900080','SH996ASP','[66]'),('TIND687EC8F7-3E74-4BA2-888F-1B655ED1E5E3','UI99400026','SH129ASP','[73, 91, 64, 53]'),('TIND68C3B7DD-BAD1-469F-A71E-5261A960347D','UI35000097','SH850ASP','[63, 95, 87, 66, 30, 46]'),('TIND68C69AEB-5DE6-49C7-A6AB-77FE5CC7AD46','UI80700011','SH110ASP','[96, 37]'),('TIND68C73ED6-81E8-4A03-8654-52853AD2E80F','UI45900011','SH941ASP','[57]'),('TIND68DE3410-D1CB-4725-A428-7CBB6A0DA113','UI33300042','SH730ASP','[73]'),('TIND6A420254-BF09-49B1-9DAA-E24445A0777D','UI23800039','SH823ASP','[38]'),('TIND6AE7557B-CFCC-43A5-919A-FEB9B5B9773D','UI49900062','SH537ASP','[95, 99, 94]'),('TIND6B80059B-CB14-4AAF-9414-70EF2723D65F','UI40000566','SH250ASP','[34, 63, 79, 70, 41]'),('TIND6B88D049-B7BD-469D-AE52-F39DEE3D586F','UI57300092','SH235ASP','[30, 52, 69, 58, 61, 85]'),('TIND6BBAC4DE-50AB-4D37-B839-78CA5E8573A7','UI20800081','SH164ASP','[60, 71, 72, 85, 31]'),('TIND6BFC7F53-22C6-4FCC-B5FD-8E770953E2DC','UI68400082','SH103ASP','[34, 38, 32]'),('TIND6C6E31D3-24F1-4849-994F-EFBC591F3CB9','UI81400075','SH351ASP','[99, 38, 60]'),('TIND6D18DDD3-B270-4093-A323-99097F0EB975','UI77000015','SH279ASP','[51, 46, 79, 40, 80]'),('TIND6D3DCBD1-1862-4A24-9C4D-F0CFA7A778B1','UI73500035','SH583ASP','[79, 62, 66]'),('TIND6DA313FF-717C-4004-8C17-3078D821537C','UI99100066','SH742ASP','[79, 56, 87]'),('TIND6E314E44-7398-48DE-A415-408A16CC314B','UI46900057','SH894ASP','[54, 53, 46, 48, 49]'),('TIND6E822D53-779F-4AE5-8D15-CBCF166E495F','UI89400084','SH260ASP','[50]'),('TIND6E9337F3-1FA4-40B4-8705-EDF097F22346','UI15000074','SH815ASP','[34, 34, 90, 85]'),('TIND6EA4DC50-5039-439B-B15C-EDB9DBBEDC65','UI57000063','SH591ASP','[69, 87, 39, 32, 96]'),('TIND6ECEF0DC-80A6-4522-AF95-69D7948D1A55','UI38500014','SH443ASP','[52, 36, 85, 38]'),('TIND6ECFB134-17C3-4C71-82C6-B4000A7275A4','UI58100074','SH830ASP','[79]'),('TIND6EDA3345-13E7-419C-B460-B8E75DCACAF6','UI92100063','SH511ASP','[100, 76, 99, 54]'),('TIND6F135AB2-60D9-4E34-B86A-E7059FD9968E','UI72600093','SH537ASP','[64, 96, 85]'),('TIND6F4F04B6-C8D3-4B38-977B-77E39E6F7895','UI19800045','SH512ASP','[80]'),('TIND6FA64506-9DFD-445B-ABBC-9CA83E9A7C23','UI59700020','SH718ASP','[56, 84, 87]'),('TIND6FC9F45B-C3F7-4E6B-A475-04E123530205','UI11500072','SH749ASP','[42, 31, 36, 61, 42, 57]'),('TIND6FF8443D-0B58-4889-9236-3EAED06D600A','UI11000447','SH165ASP','[80, 69]'),('TIND701E3D5B-477A-4471-9FF4-B1DCCAF86C7F','UI73100060','SH507ASP','[49, 96]'),('TIND7053684B-FA9E-4472-85D1-B455FA98CF34','UI26800095','SH420ASP','[100, 44, 56, 72, 55]'),('TIND70636AAA-7268-4840-9E6A-B70204789DD0','UI30800086','SH671ASP','[60, 74, 31]'),('TIND70826390-7383-4DE2-991F-C6E00435BDF1','UI70400097','SH632ASP','[34, 31, 62, 100, 34, 56]'),('TIND71784290-2D5F-4414-BCB2-AE853094AFE0','UI93800017','SH546ASP','[94, 84]'),('TIND7185DAD5-9294-42F4-BEBA-CA2237F73B31','UI53400020','SH351ASP','[81, 54, 50, 41]'),('TIND719188FC-F616-4AB4-8F35-17141264DD12','UI35400073','SH320ASP','[62, 49, 42, 95, 39, 71]'),('TIND722016F0-3A2C-4C24-BBF7-B4D7E30E4297','UI82100071','SH470ASP','[30, 62]'),('TIND723F02E2-382E-4B56-BB92-5ADA31DEC018','UI51300094','SH591ASP','[84, 80, 34, 58, 33]'),('TIND72C6F597-70A0-45C0-BEAC-4542F5CB6A38','UI53000233','SH941ASP','[30, 98]'),('TIND72E2E4C0-590F-4C3A-BF08-52BC1622324C','UI9660002','SH535ASP','[46, 31, 63, 85, 98]'),('TIND731F1704-53F2-4ADB-BAB3-6E7104A27A06','UI11800069','SH250ASP','[85, 87, 42, 59, 87]'),('TIND73E301EF-D435-4A7D-A875-E96984D50092','UI44500047','SH936ASP','[70, 82]'),('TIND741D746D-D1F9-4AFC-B933-7748FDB7E951','UI6000446','SH795ASP','[43, 81, 37, 99]'),('TIND741DDBFF-3E9E-4214-8637-8415C423D6F4','UI75200028','SH507ASP','[42, 72, 73]'),('TIND7425CDD3-FC7C-4696-9378-C8BE0A3E12F8','UI60100053','SH999ASP','[95, 48]'),('TIND743146D6-D143-4D20-9181-BA315CFDB635','UI60700084','SH538ASP','[37, 32, 39, 36, 80]'),('TIND743774DE-D698-441D-BC60-19E0579EC2A9','UI52400058','SH851ASP','[72, 99, 80, 90, 50]'),('TIND7440F72D-AA34-4D88-994C-79AD02C9AE4E','UI88100051','SH594ASP','[94, 89]'),('TIND74806CAF-8C5D-4618-B9B3-EBC2DF37148D','UI37500019','SH795ASP','[61, 76, 34, 46]'),('TIND748A5850-685E-4D75-959F-A715BBD2D2A6','UI29100026','SH470ASP','[100, 60, 74, 74, 53, 37]'),('TIND74B108E2-8D49-47E9-9D8F-9E509EE9E616','UI61200019','SH226ASP','[86, 87]'),('TIND74F62B61-2B28-4AE3-97A1-B948FFD5831B','UI66300029','SH574ASP','[34]'),('TIND751252A8-CAA2-4D9E-B0A8-B7AA855112D1','UI84900048','SH701ASP','[63, 98]'),('TIND754B1114-4EF0-4787-9E4C-126A8D79E747','UI64300037','SH165ASP','[37, 30, 62, 90, 100, 48]'),('TIND7584C3CF-1BE4-4C17-9672-C0EA6D44DB1F','UI27000018','SH680ASP','[74, 34, 87]'),('TIND758FD9B0-4E43-4066-989A-A044C4CC3C52','UI31000057','SH260ASP','[41]'),('TIND75DA6D93-B14A-4429-8301-80F3DB0DA49F','UI63700031','SH364ASP','[57, 56]'),('TIND76385EC1-3EB5-44B9-A48E-7331E8EEB8C4','UI27700023','SH902ASP','[34, 69, 47]'),('TIND765D8DB9-BA59-47C8-BC9B-09273683765D','UI74800035','SH181ASP','[45, 91]'),('TIND7698D932-4B36-43A3-B516-6F1D44DB91D1','UI75800063','SH733ASP','[32]'),('TIND76AB5F80-333F-4226-A63B-3C8803AE1D00','UI65100066','SH987ASP','[31, 56]'),('TIND772B3C2C-0914-4B82-9152-E055F2679840','UI51000013','SH576ASP','[36, 55, 35, 97]'),('TIND77316E63-DF00-40C8-8C66-5C6B3CD5DA99','UI51700081','SH294ASP','[48, 44, 58, 73, 76, 80]'),('TIND7777D0A3-D9BA-41F6-8C48-CD4BCB1D93C6','UI62100016','SH742ASP','[45, 59, 81, 43, 48]'),('TIND7797403C-51F0-4333-BEB1-258D818AA8F6','UI21600089','SH904ASP','[89]'),('TIND77E67AED-7B8B-485A-BC04-E461A3D5BA9D','UI37600048','SH805ASP','[41, 47, 62]'),('TIND77F1CAE9-664B-4AE4-9538-6A8E5C94443A','UI52100084','SH527ASP','[98, 70, 38, 45, 76]'),('TIND78237870-B69B-4160-8828-9BB4FFA946EC','UI37500019','SH158ASP','[72, 55, 81, 83]'),('TIND7865A14A-7E6F-4C3F-B9C9-B277E3AA2024','UI72400064','SH475ASP','[89, 53, 31, 75]'),('TIND786EDF16-4FA0-43B0-A3AF-FA0E43BAE29C','UI14100076','SH967ASP','[57, 32]'),('TIND7878B854-273F-4B06-B93F-EA85B0BC53FA','UI84100062','SH200ASP','[81, 32, 93, 61, 76]'),('TIND789D3426-87DC-4746-A9B1-21D3EA174FCC','UI94000393','SH146ASP','[86, 82, 66, 79, 52, 47]'),('TIND7937FE4D-5FCB-42DB-87EE-30C944BC03E0','UI77200050','SH712ASP','[57, 51, 48, 67, 37, 63]'),('TIND79BE3696-E2C6-4F16-A956-C54AC1039E6D','UI78900074','SH538ASP','[69, 79, 51]'),('TIND7A2218ED-BF18-45A4-B5BA-19F708F03AC5','UI14400050','SH904ASP','[93, 96, 66]'),('TIND7A4A6B68-0B0B-4FF0-99F8-27B1F0335368','UI83300037','SH712ASP','[84, 93, 68, 61, 65, 81]'),('TIND7A569430-5857-495C-B284-5AF085D30F7A','UI61600087','SH389ASP','[75, 53, 90, 49, 31, 47]'),('TIND7AC35EC8-1255-4809-82BF-3E22AA24FA58','UI61600087','SH716ASP','[76, 81, 91, 72]'),('TIND7AEE9011-806F-4E36-8791-3E956F95B55D','UI28600083','SH698ASP','[75, 61, 75, 90]'),('TIND7B1DDF33-6E7E-4D29-90E6-815DDE532142','UI80000191','SH733ASP','[70, 45]'),('TIND7B2DDDB6-D00F-449A-A284-B512D2ECC6F2','UI19100045','SH257ASP','[64, 64, 76]'),('TIND7B558532-8DAF-4923-8AC6-EE9E9A9CE3A3','UI11500072','SH808ASP','[51, 53, 62, 74, 71]'),('TIND7B5BDFE0-6C09-4150-9719-A14554CCAF74','UI88200012','SH475ASP','[50, 62, 30, 83, 100, 46]'),('TIND7B8AD1C4-6912-4542-9749-D18187E4C8CF','UI93500078','SH796ASP','[93, 93]'),('TIND7BCBB65C-32AE-4AE9-9B47-04297FEB82D6','UI44000416','SH198ASP','[86, 67, 53, 72, 33]'),('TIND7BDF79FE-C7D6-499C-993B-65D7D5B71A21','UI78800079','SH902ASP','[72, 94, 77, 94, 92, 66]'),('TIND7C082699-C74E-480A-8FB1-E97398D636BF','UI50800039','SH279ASP','[32]'),('TIND7C484C2A-9272-4779-85D1-4612DB66FFF9','UI93300095','SH287ASP','[90]'),('TIND7CAE8C89-D8A3-4553-9AA1-A0ECE0427B65','UI64900098','SH711ASP','[41, 57, 75]'),('TIND7CB740F6-9F37-4E57-A8CB-3C4C787F7613','UI88000025','SH625ASP','[79, 33, 42, 57, 68, 78]'),('TIND7D1066E9-FB92-4B49-8D4E-C56424965942','UI69100029','SH507ASP','[74]'),('TIND7D318346-CCE7-465F-AE78-4F0B3E2A1339','UI43800090','SH279ASP','[81, 77, 95, 97]'),('TIND7D410E1E-9415-4B10-8ADF-A29C28F63318','UI95700041','SH156ASP','[34]'),('TIND7DC96CF7-276A-45FA-8650-77E37BF53132','UI55400035','SH596ASP','[39, 80]'),('TIND7DD4C085-E1B8-453C-B992-001A928CF102','UI37000209','SH698ASP','[62]'),('TIND7DF7FA9C-5BBB-4269-90B4-290F42167A2C','UI33000086','SH574ASP','[32, 86, 94, 74, 35, 39]'),('TIND7E0A706E-543C-4E44-9A0B-A066FEB0BBFF','UI17800022','SH711ASP','[61, 47, 43, 66]'),('TIND7E6E67AA-2F10-4341-9833-C72EE9D28AED','UI2600031','SH300ASP','[48, 90, 63, 79, 56, 45]'),('TIND7ED92D40-69B0-4156-8968-A25678CDE51A','UI92200086','SH366ASP','[77]'),('TIND7F0BDFC9-7810-4790-B0E5-42BD166E8C8C','UI42700058','SH427ASP','[30, 33, 44]'),('TIND7F33EF9A-224D-44E3-AD24-342C9959124A','UI1270008','SH418ASP','[36, 94, 50, 56, 98, 65]'),('TIND7F3E1C85-B5FD-4BB4-AE6E-5A4FF25F743D','UI85600028','SH902ASP','[72, 65, 36, 39, 52, 95]'),('TIND7F813FC8-F7D8-4646-A7C7-B90E091FC1F3','UI75000398','SH711ASP','[54, 100]'),('TIND7FC31C02-5EA0-4A88-8A14-77BC7A7B683C','UI93400015','SH113ASP','[93, 76]'),('TIND7FCC9B6E-E2A1-48DC-A5B4-F82852EB0D4B','UI43900030','SH427ASP','[86, 31]'),('TIND7FE8CE2E-B02A-4932-9CEA-19C740B07522','UI62400014','SH278ASP','[45, 78, 89, 93, 47, 90]'),('TIND80477C95-F621-4886-B6E4-8408A531EC40','UI12500071','SH319ASP','[80, 57]'),('TIND809FE30D-B63A-40E3-9F60-1D6392646D62','UI88300021','SH230ASP','[63, 86, 65, 36, 52, 71]'),('TIND80B44706-DB92-4B90-8B7F-2396FA2E69D4','UI62700066','SH287ASP','[53, 46, 50, 80]'),('TIND80C1A40D-BFC6-4AEB-B461-9841145748C7','UI94800070','SH857ASP','[64, 67, 47, 97, 99]'),('TIND80DAF6CA-E6DD-4AD9-8252-9243B41355EC','UI50400058','SH885ASP','[30, 39, 84, 46, 97, 91]'),('TIND80E7C8BB-3CD8-46A3-B6D3-34B2DACD0883','UI24000738','SH987ASP','[99]'),('TIND8106BF65-F4FA-4D49-B4EE-F7FCE061C6A4','UI79500078','SH392ASP','[36]'),('TIND8119415A-E7B5-4B76-A317-BEA8195104A0','UI75000398','SH417ASP','[51, 61, 52, 69]'),('TIND81256293-6036-4808-96DB-C2DB9EAB4744','UI69000165','SH755ASP','[100, 75, 73]'),('TIND813E4C22-4C16-4B41-9765-09FA45784478','UI87400058','SH418ASP','[87]'),('TIND81B035EF-F8E0-4179-BC81-40CD547004E2','UI42100070','SH287ASP','[53, 54, 54]'),('TIND81B19D6E-4167-423A-BE18-5B2A60A805A3','UI91400079','SH805ASP','[78, 97, 30, 91]'),('TIND822AA979-93EF-4DB8-8222-02CAFC242078','UI61500012','SH261ASP','[94, 31, 32, 90, 36]'),('TIND8281B407-033A-40A5-B42A-2B3033731D8F','UI19300061','SH498ASP','[41, 67]'),('TIND8295C9E9-919C-44C4-8C04-CAAD6C71A1E5','UI49100047','SH164ASP','[30, 38]'),('TIND82BE82E3-B9D7-4C63-A829-1AC45E684418','UI8600021','SH336ASP','[68, 49, 55, 72, 77, 43]'),('TIND82DCD780-9192-4249-92B7-B17CDB4712F4','UI50500035','SH917ASP','[43, 88, 94]'),('TIND83247B73-7C85-4332-955F-14CA91648167','UI29600096','SH129ASP','[86, 63, 43, 30]'),('TIND833506CD-558D-4E9C-96EF-34088E956A67','UI64500014','SH885ASP','[64, 57, 74]'),('TIND83BA3C8C-02FF-41B1-BD57-0193301F89E9','UI92300081','SH862ASP','[71, 50, 74, 41]'),('TIND83D5B8DD-3F09-42AE-93B9-F188EEC86A5B','UI92000978','SH944ASP','[47, 34, 78]'),('TIND84AB1CA7-EF90-4EDF-BD82-DBA4FECDABF8','UI93500078','SH294ASP','[50, 60]'),('TIND852C7137-191C-4824-9BAF-A8B23D2943DA','UI79300055','SH588ASP','[57, 100, 39]'),('TIND85397088-F2B3-4263-8E24-83C60FB6435D','UI40400059','SH470ASP','[65, 68, 66, 72, 85, 68]'),('TIND853A6926-2E5C-4DAF-A851-52D45D56718E','UI93400015','SH260ASP','[100, 74]'),('TIND85585144-DB91-4DF2-AC4E-84B26CC70D35','UI34300045','SH815ASP','[47, 52]'),('TIND86991E48-355D-4DEB-8526-F8383D58BE44','UI69200072','SH221ASP','[58, 80, 57, 43, 60, 96]'),('TIND86D64DC4-8322-4793-B127-684D2FC15ED8','UI14400050','SH309ASP','[97, 60, 67, 46, 53]'),('TIND874B1EE0-CA3E-4952-BFF7-893642FE6C54','UI99400026','SH388ASP','[72, 75, 38, 41, 98]'),('TIND87878F73-8D1F-4707-B89F-3548E2EAA09A','UI87300088','SH294ASP','[56, 78, 54]'),('TIND87927CC4-81C3-49CE-ABEB-E3B6E82BAAA9','UI99600047','SH542ASP','[71, 81, 99, 77]'),('TIND87D78287-6FC2-42B4-84EA-E8DC17A9F4CF','UI41900088','SH178ASP','[74, 47, 42, 94, 93]'),('TIND8869E013-2A34-42BC-9FA1-FA82D2430736','UI78400072','SH913ASP','[86, 70, 93, 50]'),('TIND88BDFEE5-1855-475F-834F-1B8483D3FBB1','UI84600050','SH659ASP','[80, 46, 55, 82]'),('TIND88EADE2C-4D82-4ED7-94F0-2A9CEB4DB7CF','UI68400082','SH443ASP','[30, 44, 50, 88]'),('TIND88FD5227-AC3B-42CD-8A87-E373A371EBBD','UI29000099','SH180ASP','[63, 98, 75]'),('TIND8926DEB3-0496-46DC-89E0-9892D3788C93','UI900004','SH257ASP','[79, 93, 30, 58, 49]'),('TIND8936FD11-7977-4841-9E89-8B1BACA2B18F','UI24600037','SH996ASP','[77, 74, 53, 86, 65]'),('TIND894ECBFA-E344-4401-980C-9BAC9E71DA70','UI34500014','SH898ASP','[91]'),('TIND8980D6C2-9904-404B-A59C-D82ACFBB6688','UI96100046','SH270ASP','[73, 53, 78]'),('TIND8992943F-1895-4B19-85F5-C63D3416059F','UI14800089','SH974ASP','[84, 68, 33, 99, 37, 63]'),('TIND8995C3AB-DEFA-49CA-A7FA-24F48AE8458C','UI27100043','SH498ASP','[85, 89]'),('TIND89F27E8F-B8D1-4E37-9375-7A7DBE429C47','UI44700012','SH548ASP','[99, 32, 92]'),('TIND8AB0803F-2650-4812-BB1B-976E34C9958D','UI67900088','SH294ASP','[83, 49, 73, 44, 60, 82]'),('TIND8AE3E70A-B443-437C-9306-38AD687D9C2A','UI30400060','SH917ASP','[38, 71, 89, 93, 36]'),('TIND8AEB2A67-CDD3-4BD3-8246-10CB0E102C72','UI41000975','SH912ASP','[52]'),('TIND8AFF4CD3-7493-409D-8490-E6E509A46CEC','UI34000321','SH162ASP','[83, 80, 68, 76, 65]'),('TIND8B3CFECA-A98D-4C49-BBAF-30BD7ACAA25F','UI22100043','SH847ASP','[44, 89, 64]'),('TIND8B743FE4-027D-4E52-B2BA-C2E38C36F77A','UI29000099','SH226ASP','[66, 66, 100, 37]'),('TIND8B9F0A60-04A3-4F46-9EA9-F2D8B793DBD6','UI15900033','SH221ASP','[40, 99, 51, 44, 91]'),('TIND8BC3D534-6316-452D-B732-32D9A09AEA9C','UI94900049','SH671ASP','[47, 59, 61, 57, 38, 57]'),('TIND8C21C415-F7CF-4911-8EAA-0AF088B856B2','UI61200019','SH742ASP','[77, 95, 33, 85, 54, 45]'),('TIND8C2B3175-C891-4A8F-AE2C-5979243919F5','UI53100057','SH781ASP','[67, 96, 61]'),('TIND8C3578A9-1DDB-45DE-8FEA-A4FED2D85987','UI47200011','SH903ASP','[35, 77, 83, 45, 41, 91]'),('TIND8C57F978-93CA-494B-8FFA-59A758C33383','UI90000095','SH680ASP','[53]'),('TIND8CC3D4DA-6077-41A7-B66A-7D752524F7F0','UI15400042','SH747ASP','[43, 97, 59, 90]'),('TIND8CF06114-231A-43A4-9C47-84350908FEE7','UI51600027','SH501ASP','[75, 87]'),('TIND8CFD8C02-5C3E-4F30-A4B8-7B292EC4714A','UI50900095','SH639ASP','[53, 36, 62, 82]'),('TIND8D33EE31-4A06-4624-8829-6303D676DE12','UI76000082','SH944ASP','[82, 54, 41, 66, 92, 96]'),('TIND8D465702-31E9-4446-8E2F-770A49E437E4','UI69300075','SH921ASP','[50, 59, 53]'),('TIND8DA8291B-B6F5-4C14-8371-6D63AEB20B4A','UI12000592','SH716ASP','[63, 31]'),('TIND8DAC5330-CAED-4142-88B3-AF44C126122B','UI59800028','SH996ASP','[58, 92, 82, 63, 87]'),('TIND8DE53A1A-2FC1-4BCB-A6B6-95EED381E93B','UI10000035','SH114ASP','[35]'),('TIND8E202AEF-C448-4BFE-AEC6-2AB061567BCC','UI94400096','SH512ASP','[43, 58, 74]'),('TIND8E2EF3AC-57FA-4599-A3FB-A2C3D87A57C2','UI21800013','SH508ASP','[46, 41]'),('TIND8E337053-73E7-49EE-BF33-BC06900627E2','UI88000025','SH902ASP','[92, 93, 70]'),('TIND8E5B6542-B9EB-40D8-81F2-1028BEF25B36','UI47800029','SH278ASP','[78, 44, 55, 74]'),('TIND8F2878AA-96AC-4A84-A7AF-A872A9843C9F','UI55600057','SH821ASP','[41, 32, 47]'),('TIND8F293C83-C4BF-4F8F-B758-866B6CF30D1B','UI31600040','SH545ASP','[57, 85]'),('TIND8F3989ED-77A6-4860-990C-3ADE8377F8C9','UI41200096','SH267ASP','[64, 59]'),('TIND8F3C048D-1FA4-4D51-B989-BCAC8232FDFC','UI27300061','SH615ASP','[97, 88, 38, 31, 30]'),('TIND8F52F307-7764-4731-8007-E760CBCE43F0','UI30000407','SH659ASP','[75, 57, 62]'),('TIND8F5E4687-420F-4EAF-8B09-D03A1F71D660','UI12100028','SH712ASP','[58, 62, 64, 72, 34]'),('TIND8F84A0E2-949F-443D-BE8B-F7F4E0527CA9','UI38400073','SH795ASP','[59, 53]'),('TIND8F97C241-367B-4C69-A8C7-DBAEC7415533','UI33100072','SH388ASP','[70, 50, 59]'),('TIND8FA2803D-16CE-468A-9D99-4C77354DA1E2','UI57300092','SH742ASP','[99, 37]'),('TIND8FD76CED-4878-4CC6-8FB6-75F83CF32141','UI12100028','SH114ASP','[63, 30, 82, 89, 38]'),('TIND9003E9D6-1FD7-425B-9417-717A3B03BAF8','UI18600045','SH209ASP','[91, 71]'),('TIND90075EE6-08D7-4808-B47C-09117B273733','UI79400021','SH644ASP','[99, 42, 85]'),('TIND9104856D-A014-4462-886F-825815F0D343','UI25600067','SH156ASP','[30, 44, 94, 54, 100]'),('TIND9159BA01-127B-4682-8DD9-65F4E256ADC6','UI54400099','SH336ASP','[48, 98, 51, 94]'),('TIND9185B839-8F81-47ED-BBD3-4A3477F272CC','UI51700081','SH535ASP','[65, 75]'),('TIND919ECD75-EE9F-4B8D-AA7F-6B8EFEFB6279','UI74000054','SH730ASP','[71]'),('TIND91ECC483-00D2-4F3A-BE0D-44F87FA604FF','UI41900088','SH275ASP','[69, 60]'),('TIND92067A46-9B95-4C70-B560-1E0A061FCE09','UI56100039','SH588ASP','[51, 56]'),('TIND923967BC-BDF8-4BD9-A3F5-4787AF49633E','UI68800040','SH105ASP','[39, 65, 69, 77]'),('TIND9267DA2B-689F-4105-84A2-94A0FAE4C039','UI89600016','SH511ASP','[65, 80, 67, 81]'),('TIND930B4CD8-A3B3-4843-9DAF-1EEDCD11BA1E','UI77300025','SH944ASP','[81, 55, 73, 72]'),('TIND93505AAA-5B7A-4C49-80A5-C72EE5A8E7F7','UI67500051','SH747ASP','[43, 81, 67, 35]'),('TIND9362B4F3-56BB-4F35-8C2B-96C62CF27D0A','UI7700055','SH994ASP','[50, 75, 86, 69, 75, 80]'),('TIND93954D74-4C2A-43D9-AA3A-9660793E79F3','UI13800085','SH113ASP','[75, 81, 87, 88, 53]'),('TIND93F440D2-471A-4FBB-89E0-3DDA952384B6','UI68400082','SH226ASP','[77, 68, 43, 50, 74]'),('TIND9405D243-F722-4D44-A59C-9EBC9CBDBF49','UI34000321','SH781ASP','[97, 47, 73, 78, 44, 64]'),('TIND94107161-58FB-441B-B7C4-AA9D14400D1F','UI90400047','SH936ASP','[70]'),('TIND9441DDBA-7C00-4761-8A2A-17AF85E06865','UI71000061','SH778ASP','[81, 76, 54]'),('TIND944CE38E-B31B-4C0A-B3B2-2378565A07D3','UI30800086','SH387ASP','[69, 66, 74, 38]'),('TIND946E4B37-30EE-4C82-B6D7-D13FE3BDC0B7','UI60300066','SH645ASP','[83, 48, 37, 60, 47]'),('TIND9499FB7F-64DF-40B9-A4D1-0371C62A1B64','UI70500063','SH388ASP','[70, 88, 58]'),('TIND94D15F1E-D8A0-4ABE-9FD0-FCE3F9C10932','UI67600095','SH978ASP','[42, 66, 64, 59, 82, 67]'),('TIND955DC594-95C3-45A9-9005-E4C7C6897148','UI29400067','SH418ASP','[73, 88, 42, 72, 87, 82]'),('TIND957C6E29-8128-40D7-9A11-57FA1B0BB2F5','UI91600037','SH287ASP','[65, 87, 30, 91, 62, 87]'),('TIND95EF8E64-F968-49D8-B47A-8A2A12C9A96B','UI20300058','SH269ASP','[35, 51]'),('TIND95FD3350-AAED-4F29-BEDC-7A2296B00EEC','UI16700010','SH894ASP','[84, 69, 46]'),('TIND95FF5F58-E924-40D3-98A6-AD5FCB7BC412','UI99100066','SH999ASP','[94, 34, 39, 56, 40, 78]'),('TIND96070591-B0F1-4B39-93B4-7D98119A5C72','UI13000069','SH679ASP','[72, 52]'),('TIND962828E0-F76D-41B9-9162-573102B6D7F6','UI35200062','SH983ASP','[80, 70, 42, 31]'),('TIND966AC877-2269-4E79-A0A4-3C0A48CE5934','UI12500071','SH903ASP','[53, 76]'),('TIND96AF104D-AB2E-47DE-85D8-C35152B0936C','UI67100057','SH594ASP','[60, 63, 37, 43]'),('TIND96FF6E04-35E4-4AEE-824E-9C3D78F513FD','UI60200022','SH250ASP','[32, 81, 93, 47, 38]'),('TIND9706B533-C839-41D8-9D49-C380739DB91E','UI47700023','SH821ASP','[54, 91, 71]'),('TIND97118FB0-8E69-499F-A19C-7EAC26FD3DBA','UI66500082','SH475ASP','[72, 74, 76, 86, 42]'),('TIND972B6BBB-CDD3-4DF7-88FA-FD847FAA1E04','UI53600038','SH747ASP','[57, 47, 85, 64, 76, 94]'),('TIND973900E4-7EBC-4C31-A5D9-CC30A539A172','UI22800014','SH830ASP','[45, 75, 83, 30, 42, 31]'),('TIND97DC89B9-8667-4DFC-99AB-1AAAA06DEC74','UI44900038','SH498ASP','[100]'),('TIND97FEE42E-68EA-4D85-A5EB-511FA6F7871B','UI98700079','SH795ASP','[59, 79, 40]'),('TIND9889E00B-DD2B-4456-AA55-AB6FC27D4346','UI87000676','SH339ASP','[90, 75, 68]'),('TIND98C6886B-FD1C-4021-BC65-36AA98AD5EC7','UI23100036','SH903ASP','[64, 83, 45, 48]'),('TIND992F026B-9C95-42A9-A3AF-590101C16176','UI13800085','SH913ASP','[34, 54, 31, 78]'),('TIND996187E9-9F2E-49F0-88C1-6DC40271BD38','UI47700023','SH235ASP','[96, 74, 90]'),('TIND9978B709-43CA-4291-971F-9C7A67C7CFD0','UI34300045','SH808ASP','[78, 40]'),('TIND9A3CD4FC-29AB-49C6-BC21-E76FDD37B6AE','UI46000044','SH679ASP','[45, 88, 42, 93, 86, 96]'),('TIND9A93F733-9771-41BB-A618-465412F3B482','UI82600079','SH507ASP','[74, 32]'),('TIND9AA25209-2F82-43F0-BC91-AE7519B96340','UI89700047','SH851ASP','[47]'),('TIND9AD25C04-D1AE-4594-A9A7-D94AA801E00E','UI13100050','SH744ASP','[71, 56, 67, 36, 65, 85]'),('TIND9AFD27D7-9767-45D2-9758-4B655ED392B5','UI45900011','SH181ASP','[47, 51, 88, 69]'),('TIND9B17761D-F7D9-4612-BE71-A447922047DA','UI34300045','SH860ASP','[98, 84, 63, 39, 75]'),('TIND9B227DB7-2783-40F4-95D6-0EB19EC05E65','UI13700042','SH257ASP','[97, 30, 72, 56]'),('TIND9B77304B-3B20-42C4-8EC7-38BE16374B83','UI81700097','SH711ASP','[78, 80, 32, 90]'),('TIND9B8B09BF-D8F5-49EF-A26D-BFD19AD10E73','UI66400076','SH978ASP','[60]'),('TIND9BB9FDDF-D391-416C-9F64-F379ACE33C08','UI70300079','SH567ASP','[97, 90, 83, 90, 59, 61]'),('TIND9CA21A3D-C63B-46CB-96B8-20B12E2841AB','UI17100089','SH202ASP','[75, 36, 78, 34, 43]'),('TIND9CDE9C08-BD8D-42F1-8D2B-64205435FE52','UI79000020','SH634ASP','[70, 80, 69, 97]'),('TIND9CE4D921-C3D6-40F5-8300-D4657975ACAA','UI30700054','SH808ASP','[80, 59, 46, 84, 47]'),('TIND9CECB3C5-9A75-4291-AB73-A5C6CC0943AC','UI95200050','SH674ASP','[85]'),('TIND9D0DE4B9-30DA-4A38-A6E3-E0247D259B51','UI23800039','SH711ASP','[65, 32, 85, 41]'),('TIND9D3CE7FB-35A6-4725-89E4-9463D2094C1A','UI71100090','SH110ASP','[51, 57]'),('TIND9D58129E-F81D-4DF4-A246-D7627228474B','UI69600026','SH275ASP','[51, 57]'),('TIND9D87184C-A5A7-4C3A-BFF8-0FE98A99C23B','UI70700011','SH854ASP','[75, 52, 71, 69]'),('TIND9D8D2AF1-7322-4E5D-B029-9F8803836A3D','UI92600057','SH321ASP','[32, 84, 47, 96, 91, 41]'),('TIND9DB2087C-57BF-4C2F-83A1-079DACA73E3D','UI23800039','SH755ASP','[94]'),('TIND9E2F2D72-5ABB-4102-88E6-08BB98952DC5','UI4160004','SH755ASP','[54, 98, 31, 51, 91, 76]'),('TIND9EBAB5C2-9C86-40DE-89D3-5B9B9037209F','UI38300033','SH275ASP','[100, 30, 96, 85]'),('TIND9EE1DC92-BE98-42BF-AA73-C2686665DB0E','UI49000060','SH146ASP','[57, 87]'),('TIND9F3BEE8F-8484-401F-8DBF-3528DEB15E9C','UI40300029','SH781ASP','[48, 65, 38, 95, 87]'),('TIND9F812DDE-8198-4332-BED8-E29B19D783FF','UI58600092','SH493ASP','[92, 85, 48]'),('TIND9FCBFA5C-70FC-47CD-B9C9-B33CAD8F1C8D','UI27500047','SH294ASP','[44, 55]'),('TIND9FE0956F-60F4-4E1E-934F-4D7197D00254','UI1270008','SH226ASP','[42, 42, 77, 56, 62]'),('TINDA036203A-8DB7-4374-8E00-E241393FC16C','UI48200015','SH180ASP','[70, 62, 77, 69]'),('TINDA0393428-081B-44C2-8922-D83AC4A6B2F6','UI90200036','SH156ASP','[55, 55, 47, 48]'),('TINDA03F518C-618B-4A6E-9002-42EA2DDD22DE','UI70300079','SH269ASP','[79]'),('TINDA10646A1-B13C-49F5-8B66-34D608AAA88C','UI99100066','SH142ASP','[98, 52, 94, 65, 47]'),('TINDA10F701A-6701-47BE-BB1B-098B24A28877','UI23600054','SH574ASP','[43, 61, 57, 46, 36, 55]'),('TINDA12418B6-3AE4-4E2F-9D97-87C64F4B4E31','UI95000027','SH447ASP','[56, 65, 38, 40]'),('TINDA1665D86-DB57-4DAB-A572-541CB2F3E3DA','UI19100045','SH755ASP','[65, 100, 49, 60, 75]'),('TINDA1BE1524-4422-495E-AC9E-6BC95FA4AED4','UI70400097','SH165ASP','[53, 75, 59, 57, 66]'),('TINDA1E44149-F4CC-4F8A-8EB5-8AED2BEAFDED','UI48600091','SH771ASP','[93, 32, 66]'),('TINDA1E76139-79FD-43A7-8868-F11CE3AFF0A3','UI45800092','SH257ASP','[98, 59]'),('TINDA2374500-E09C-4938-920C-1BB618697128','UI68500053','SH798ASP','[91, 86, 80, 62, 84, 64]'),('TINDA289A402-59D9-4F5B-BC0B-57FA33D79B26','UI21400071','SH644ASP','[76, 45, 44, 93]'),('TINDA2C8C2EC-32B9-4AC4-8965-36706635924E','UI98000987','SH957ASP','[64, 31, 87, 86, 49]'),('TINDA2EE154F-A18F-4BE3-9F79-3AA13442E4A9','UI46000197','SH862ASP','[65]'),('TINDA30C1DD7-1A55-445C-8176-2C5F0D52F02F','UI85200032','SH978ASP','[67]'),('TINDA30E0153-9D9E-4818-BD85-D7D17F8A97E4','UI94100013','SH257ASP','[33, 75, 45, 53]'),('TINDA39EC425-CAAB-4F07-B6E1-132CBFD5BC14','UI82500039','SH680ASP','[39, 41, 55, 37, 37]'),('TINDA3C86C2C-4177-47B8-9187-3DAD7BCF3711','UI46400062','SH267ASP','[82, 86]'),('TINDA3F1B678-C570-4986-B08C-D337FFCFECEB','UI34200097','SH944ASP','[46, 76]'),('TINDA4130DBE-FCF6-4C0A-8657-97898D6597D1','UI12400030','SH977ASP','[58]'),('TINDA4143C46-86EA-414A-BDC2-569D522915AF','UI60500032','SH830ASP','[70, 42, 55, 99, 60, 33]'),('TINDA41D7FC9-B560-4F4F-A995-E98FC28F9361','UI37800070','SH903ASP','[34, 33, 57, 72]'),('TINDA4A442AB-8CF4-4168-BFA3-770D73FBB360','UI63700031','SH148ASP','[99, 62, 68]'),('TINDA4FA6B3E-B12F-4EDF-8398-2539A597A3F2','UI99000898','SH894ASP','[75, 48, 38]'),('TINDA5108DBE-6A98-47B8-94A8-E3BBE6267627','UI67300088','SH724ASP','[82, 51]'),('TINDA5191D67-E840-4708-80A6-3947A26B1A68','UI92200086','SH756ASP','[39]'),('TINDA526D4E7-8E6F-48CB-86DE-894014FCBC07','UI70800063','SH198ASP','[85, 84, 76, 79, 59, 44]'),('TINDA557CBC6-5DA1-424B-AFEB-7412CF4A6469','UI93400015','SH674ASP','[97, 90, 80, 95, 48]'),('TINDA55C7439-A6EB-4606-93F0-80F8E543FB2D','UI2700041','SH470ASP','[32, 43, 50, 89, 37, 95]'),('TINDA595F26C-6CE3-4971-94DD-E963510A5336','UI75000398','SH221ASP','[77, 42, 33]'),('TINDA5A3557C-15E3-4092-AF3B-B2780F4F1BBA','UI46900057','SH644ASP','[80, 80, 95, 81, 91]'),('TINDA5AE4337-B9E0-4A5D-8F7F-D2F4D465F9D6','UI68700077','SH319ASP','[56, 34]'),('TINDA67081D7-C587-4C08-83D5-D3D3B8F30B54','UI82100071','SH987ASP','[39, 71, 78]'),('TINDA6DB1C1F-7449-4395-A979-8E58E90E324B','UI57000456','SH974ASP','[67]'),('TINDA6DDE4BF-3F8C-41BA-928D-DA5BACE95BEE','UI45000042','SH778ASP','[98, 33, 67]'),('TINDA73EC185-B4F5-4C2F-BF3A-75900B5357EA','UI42700058','SH711ASP','[63, 60, 72, 49]'),('TINDA74B6B1B-BF0B-458E-A2FF-24C30DFFA803','UI62800023','SH545ASP','[42, 49, 55, 71]'),('TINDA7D55222-69C2-483D-8907-4C7ECB83DC4E','UI38800057','SH798ASP','[92, 56, 90]'),('TINDA829E086-FC96-45CD-A63A-9A0F6CDE7676','UI57200046','SH902ASP','[32, 95, 62, 43]'),('TINDA841C43D-24A4-4167-9166-41A9DD745895','UI33500081','SH226ASP','[47, 66, 77, 52]'),('TINDA85152DD-5895-453B-9820-773DEF614E28','UI35000290','SH645ASP','[42, 44, 83, 78, 96]'),('TINDA86E4D15-A584-4586-AC5D-F7CAD7F75766','UI17700027','SH478ASP','[88, 61, 34, 51]'),('TINDA87CCC6B-FDD1-4AFC-8EF6-4B74A88A6AD5','UI75700013','SH967ASP','[97, 45]'),('TINDA88091BC-D685-4D40-AA91-4A8877D2A820','UI8600021','SH181ASP','[32, 47]'),('TINDA8841C8B-307D-47C4-A554-C1FE74940583','UI33800086','SH235ASP','[60, 32, 77, 44]'),('TINDA8A7D712-DCF6-46F3-B633-7FC81CB06D0C','UI61700082','SH261ASP','[48, 44, 44]'),('TINDA980CE57-F0F5-45F2-A3F1-86510E9E7322','UI79600083','SH639ASP','[56, 39, 63, 59, 71, 99]'),('TINDA99F8A0E-C551-4B7E-A76D-7DD83D56C2FB','UI53100057','SH659ASP','[69, 61, 74, 83, 84]'),('TINDAA092322-6D36-4176-B4F0-188DFC3023F9','UI63800013','SH320ASP','[72, 88, 85]'),('TINDAA628D47-3118-4D59-B117-D517E0668D34','UI7590000','SH918ASP','[35, 85, 76]'),('TINDAA6A4399-24D0-4ED6-800B-C1410CE8A8F3','UI36900075','SH546ASP','[63, 82]'),('TINDAA9376A3-8BF6-4E3F-B8CE-F85A9A46D0CB','UI18500055','SH860ASP','[75, 98, 66, 92, 38, 64]'),('TINDAAB7704B-D3CE-4ABF-95F1-7DE13F336FE9','UI92800047','SH632ASP','[55, 31, 77, 60, 47, 43]'),('TINDABE064FD-9A20-4B89-94E4-084218AD8FB4','UI14400050','SH345ASP','[38, 56, 75, 31, 30, 62]'),('TINDAC05555F-4673-497B-8E3C-43D9F6266B64','UI69000084','SH680ASP','[49, 55, 72, 30]'),('TINDAC44CA8E-02E8-48F3-8F08-13E0FFBDC605','UI75800063','SH701ASP','[66, 82, 95, 35]'),('TINDAC55EC6C-0D96-4387-ADB3-0F338C05D298','UI53000233','SH484ASP','[56, 38, 45]'),('TINDACB08A72-0FED-48F3-BB33-8E4C2916C092','UI17000151','SH756ASP','[49, 80]'),('TINDACE589E5-6913-49E3-A93C-3FE0DA205752','UI90000095','SH351ASP','[65, 96, 68]'),('TINDACEEC24D-96E4-4E80-922C-86310EB86BA7','UI44200071','SH321ASP','[95, 65, 93, 77, 53]'),('TINDAD22487E-9A7D-4C13-B28B-351ABC5540FA','UI94100013','SH535ASP','[94, 81, 46, 63]'),('TINDAD453934-E0E5-4C01-82DF-9DBA76B5E4F4','UI87100042','SH982ASP','[94, 73, 34]'),('TINDAD74EEA4-AD38-4567-A12B-993257D8F582','UI42700058','SH982ASP','[71]'),('TINDADB5EFB8-58F6-44EF-810D-271FE028CC00','UI64400080','SH501ASP','[100, 97, 71, 67, 71]'),('TINDAE0D1CE7-4A87-47F4-9F06-3EF4FD657CA5','UI93000703','SH805ASP','[60, 47]'),('TINDAE0EAE35-C0DD-4D58-856F-844A2EF71F9A','UI25900023','SH278ASP','[57, 38]'),('TINDAE6316C6-3F5C-4105-BB59-714B52C30E68','UI88700051','SH974ASP','[85, 53, 85, 78]'),('TINDAEF734AA-B63D-4CD2-84E1-506B9DAE1CB3','UI54500010','SH113ASP','[55, 69, 88, 93]'),('TINDAF5E1086-D764-46E2-B299-0C5402A8BE64','UI13200043','SH146ASP','[41, 98, 54, 49]'),('TINDAFF0090E-EE81-4B71-A14F-265AA83C5E7D','UI19000292','SH158ASP','[81, 46, 48, 40]'),('TINDAFFE1BEC-73C8-4B39-988A-7B22B579B064','UI43800090','SH113ASP','[62, 49, 73, 74, 80, 73]'),('TINDB0388895-0308-4565-83B5-113CB751B27B','UI66100075','SH755ASP','[73, 34, 69, 68]'),('TINDB0654125-9344-406B-A40C-872996D1AE6D','UI52300010','SH319ASP','[76, 57, 77, 81]'),('TINDB0C1F36F-9519-48BB-BBE7-7727850B13A2','UI50700090','SH561ASP','[97, 45, 84]'),('TINDB13A0FA8-1F87-47DD-A6B8-5D4DD20399AE','UI22000053','SH588ASP','[55, 67, 72, 76, 53]'),('TINDB17B8399-826B-47C8-ABC9-0FCCA402013A','UI97200057','SH749ASP','[95, 77, 51, 47, 55]'),('TINDB1A772FC-0B37-4528-97FD-9D7150FD6477','UI35900018','SH420ASP','[93, 81]'),('TINDB1BC5C28-8F64-447F-9A88-F8E827E2753E','UI83300037','SH795ASP','[63, 85, 100]'),('TINDB1D6E48F-A574-43BC-8560-DA125947CBC4','UI45800092','SH879ASP','[80, 66, 90]'),('TINDB1E4AC50-6211-4842-B325-81392862DEE5','UI60600051','SH493ASP','[41]'),('TINDB234CE7D-B704-4218-8B13-C1D9DBAAB09D','UI30200043','SH795ASP','[74, 46, 45, 43]'),('TINDB2AF064D-70A2-4B93-BCCE-407E70E816E4','UI99400026','SH679ASP','[93, 38, 100]'),('TINDB2DF2E0B-BED6-4748-9846-C147BD122AA2','UI32500090','SH936ASP','[55]'),('TINDB2E46BF2-8374-449C-B02F-3602275BEB7B','UI92200086','SH257ASP','[45, 50]'),('TINDB2EDC819-4B7A-4B2D-8719-0908E8C7F64F','UI85900020','SH351ASP','[94, 83, 38, 33, 73]'),('TINDB2EE7BA1-FAB0-47CF-8073-DEA9C3246E8F','UI54900046','SH733ASP','[43, 82]'),('TINDB406D8A0-0340-4583-AAE2-864FD2A24909','UI48700030','SH493ASP','[49, 49]'),('TINDB421815B-7DE1-4656-94FD-770869763542','UI13500070','SH994ASP','[80, 89, 48, 95]'),('TINDB49E0816-46C5-47D2-BF02-47C1B5B4EB63','UI85600028','SH732ASP','[37, 98]'),('TINDB4B8AE58-7846-4FDC-BA8F-1D738B15FC3B','UI61800018','SH601ASP','[58, 48, 54, 52, 34, 80]'),('TINDB4E4D368-A141-4DC2-BBC8-DE5E82AFDCF1','UI32200099','SH300ASP','[39, 50, 32, 99, 80, 95]'),('TINDB4ECECA9-A297-4C9D-836E-FD3DD62FC3B8','UI27700023','SH367ASP','[43, 56, 58]'),('TINDB4FB277A-53F9-4B78-AFDC-063322D77AE3','UI96900095','SH198ASP','[85, 36]'),('TINDB517C008-C7D7-4AD3-952E-3E66173E6C05','UI94900049','SH285ASP','[64, 88]'),('TINDB5459B2D-40E0-4630-BDC9-DCF4E5289DC7','UI66700052','SH300ASP','[32, 67, 47]'),('TINDB59BAE28-103E-43B2-BB6B-927A2B1CD2BA','UI98800033','SH625ASP','[89]'),('TINDB5B79741-0D8C-4FC2-B223-EF91AD115921','UI72200028','SH755ASP','[35, 88, 40, 93, 92, 50]'),('TINDB636583A-DFFD-4D01-B39A-6C7DCD399083','UI10100086','SH458ASP','[30, 77, 38]'),('TINDB65D10D4-AA54-45C7-81AB-7568BAE892E5','UI78500020','SH397ASP','[54]'),('TINDB689DC13-0FB7-4734-8B1F-3637FFB79527','UI19000056','SH756ASP','[78, 74, 60, 37]'),('TINDB77E0143-FFEF-4C1B-838D-1CFB0B59FA97','UI90700059','SH484ASP','[95, 56, 56, 34]'),('TINDB7B74092-1914-491B-80E8-AEC29A4F6899','UI24100025','SH280ASP','[74, 36, 67, 46, 58, 90]'),('TINDB7C50BD9-E433-434C-BC97-A25F5BEBD1B0','UI60000160','SH996ASP','[37, 55, 91, 65, 60]'),('TINDB81A478D-FB35-43C5-A7AD-ABBC2A3EC7D4','UI90900080','SH588ASP','[98, 60, 94, 55]'),('TINDB84AC583-392D-4BD7-BA90-E53B9151264E','UI13200043','SH319ASP','[67]'),('TINDB866BDD1-6EB5-4D5E-A972-A792D9B1DF8E','UI84500081','SH387ASP','[80, 94, 51, 72]'),('TINDB8B09F0B-FD48-461B-8238-2C3D6D4909EC','UI91200068','SH978ASP','[87, 97]'),('TINDB8BA0FF4-1C6F-4179-87F4-866EDB2B947A','UI73000016','SH319ASP','[55, 65, 73, 39, 60]'),('TINDB8E51785-1CC9-4335-870F-515E1787C324','UI17800022','SH698ASP','[84, 98, 82, 42, 30]'),('TINDB98933C6-2835-46DA-A723-C371E7ACF3AA','UI13100050','SH982ASP','[47, 32]'),('TINDB9976680-2A54-4076-B650-8A98B2424DBE','UI44500047','SH336ASP','[80, 71, 45, 41, 96]'),('TINDB9CB309C-143D-4E9D-832D-EAFE376CA320','UI32500090','SH850ASP','[69, 77, 54, 85, 82]'),('TINDB9E9EA13-3C69-491D-9749-AD4F80366E03','UI59400093','SH226ASP','[62]'),('TINDBA20203C-2516-4E78-AB9F-6976FF2B9DFF','UI50700090','SH294ASP','[78, 35, 85, 99]'),('TINDBA4B546F-76DC-4528-BE86-960E840CA955','UI90200036','SH994ASP','[65, 81, 74, 50]'),('TINDBBAF8BC7-04AF-4ADA-A457-AFEB82E27313','UI52400058','SH235ASP','[54]'),('TINDBC3D638E-FC65-4C06-B9CD-DB6824403C7F','UI4200005','SH235ASP','[54]'),('TINDBCAC4A39-690C-4870-ABD7-0B9B6BE000D5','UI71200039','SH833ASP','[37, 63, 56, 87, 62]'),('TINDBCAD7C45-9BE0-423A-88E3-821897FB037C','UI96200011','SH508ASP','[77, 76, 71]'),('TINDBCB5C06A-D5CC-49DA-AABC-263F6008A227','UI44900038','SH545ASP','[77, 84, 80, 79, 92, 50]'),('TINDBCF75EA4-24C5-4B63-96A5-EE8EE08B2005','UI75800063','SH260ASP','[74]'),('TINDBD0E2634-E51B-4667-A5E8-6067C87D9ABE','UI26900049','SH941ASP','[74, 93, 45]'),('TINDBDA5105D-E795-4F52-9A63-326002736698','UI96300069','SH898ASP','[49, 59]'),('TINDBE0CEA5F-C16F-4053-A8F8-EE70C8292241','UI84100062','SH261ASP','[88]'),('TINDBE112CC2-6846-4002-8EF2-1942509FE26B','UI23100036','SH698ASP','[36, 93, 44]'),('TINDBE2BCC07-0BE3-4327-B02D-93A889C1B4F8','UI79000233','SH300ASP','[84, 68, 59, 86, 49, 80]'),('TINDBE4F57AC-27E3-45F9-A964-D7E369A05710','UI23200048','SH879ASP','[45, 61, 30, 52, 41]'),('TINDBE9F0AD0-1D5C-4A45-8646-135A683DF3BC','UI21100021','SH594ASP','[45, 30]'),('TINDBEF6F5F8-4097-4E0C-9BC9-CACD9D62A8EF','UI74900058','SH879ASP','[71]'),('TINDBF358D04-4A20-469A-B11E-C6B54899A45A','UI52900046','SH983ASP','[76, 74, 53]'),('TINDBFA5A015-9666-48DD-8C87-92DF5CF8BDF7','UI40600021','SH936ASP','[60]'),('TINDBFDBC512-C471-4E81-B4D6-1370FD3360F5','UI32200099','SH944ASP','[43, 55, 41, 63]'),('TINDBFE402D7-CC79-4BD2-9744-2462092C757A','UI98600081','SH821ASP','[63, 75, 92, 63]'),('TINDC06263F6-E602-4864-BEE1-294807E7F7B8','UI55000245','SH847ASP','[41, 32, 100, 81, 100]'),('TINDC07A2695-385B-40F5-97DD-246444165E5E','UI85000517','SH561ASP','[49, 64, 81]'),('TINDC1179627-BBC1-4CD6-9AA6-B0631BC59DCB','UI58300057','SH397ASP','[72, 46, 87]'),('TINDC124E8D8-DEA3-45EF-94A2-E4EAEAB930FD','UI90700059','SH701ASP','[30, 39]'),('TINDC12BD6C0-60BA-456D-9CC0-EAAA4A0471DA','UI34000063','SH937ASP','[75]'),('TINDC12E8BEA-04E6-4155-A6DB-63E5D42AAA21','UI61300010','SH260ASP','[49, 47, 73]'),('TINDC12F1D98-FAA1-4A73-BE47-5631E09262D1','UI77300025','SH625ASP','[56]'),('TINDC1599312-4009-4AD1-8832-64AF3AACE007','UI21800013','SH180ASP','[74, 100]'),('TINDC15C4E04-2C68-44FF-B343-B1699B1BD648','UI19000056','SH904ASP','[60, 50, 68, 91]'),('TINDC199EA82-34DA-47DD-B3E0-1EBD16DDCCE6','UI49500092','SH388ASP','[59, 68, 30]'),('TINDC21BEEB3-7115-4999-8CCA-79C772B8FAC1','UI94900049','SH996ASP','[55]'),('TINDC2281DC7-55E4-44DB-BF1E-A4FFFF06BBE3','UI72000427','SH336ASP','[81]'),('TINDC2CE6BD6-5B07-4433-AE51-46FDBD9B8CC8','UI84400024','SH158ASP','[74, 43, 80]'),('TINDC4658800-7657-4D4E-912A-3F8F526D26EA','UI73800079','SH493ASP','[59, 68, 41]'),('TINDC53FB9D0-F847-4AEE-AC18-86B19523353D','UI54300060','SH545ASP','[83, 72, 55, 79, 42, 94]'),('TINDC54AACAE-4628-47AD-A7B7-8C37A8A917DE','UI82200096','SH625ASP','[82, 53, 41, 75, 49]'),('TINDC57DE443-D463-4FAA-8526-9A88880A56F3','UI29500046','SH716ASP','[63]'),('TINDC5AB46C7-7CE9-41AC-9FB1-613E912FAE2E','UI88100051','SH418ASP','[85, 37]'),('TINDC5B105D6-5CB4-4D48-B1A9-A42FE487AB4B','UI22700070','SH978ASP','[84, 98, 58, 68, 52]'),('TINDC5E9E161-11DF-49F5-95BE-CBF4EA5AAA37','UI22000648','SH417ASP','[85, 94, 81]'),('TINDC60B4C3B-E428-4A4E-9BE6-D539A41CCF34','UI23100036','SH280ASP','[63, 96, 82, 95, 82]'),('TINDC646E503-3DE7-4EBB-9ECB-C8D736262773','UI89300038','SH987ASP','[32, 69]'),('TINDC6895C1F-54C4-43E3-9DCA-324CB36AD802','UI37100083','SH795ASP','[57, 61]'),('TINDC6C37A45-2880-43A0-B66F-CCD5D9A58E6C','UI63800013','SH470ASP','[60, 35, 63, 80, 95, 36]'),('TINDC7281388-757F-44D3-AB10-09B6C3EAE1F1','UI58300057','SH204ASP','[39, 78, 90, 43]'),('TINDC8222256-45B9-4EDC-B837-91767BF8247D','UI99200063','SH178ASP','[64, 93, 42, 30]'),('TINDC85B94B8-C694-4031-8FD8-913121182233','UI32500090','SH542ASP','[70, 47, 55, 68, 35, 94]'),('TINDC887C4F8-1E71-4529-91B7-74311C53E5C6','UI35700027','SH899ASP','[63, 48, 100, 56, 99]'),('TINDC89C2D37-0693-4E66-9589-A5D2CC284C90','UI25000091','SH336ASP','[92, 36, 42, 51, 37, 34]'),('TINDC8AEAA36-A74A-478F-8897-7C04143F5ABD','UI6300001','SH156ASP','[93, 99, 99, 60, 33]'),('TINDC938790E-A37D-4176-9215-6E7592F02F9C','UI98400090','SH625ASP','[98, 43, 41, 89, 37]'),('TINDC969A374-1B6D-4A91-A744-D4BBDFF3A8D3','UI48100097','SH180ASP','[59, 95]'),('TINDC9DC9598-2F6F-4731-9BC8-25EAE03F42D4','UI44900038','SH129ASP','[33]'),('TINDC9DDA032-253B-4B0B-83B8-FDD0BD42B304','UI84600050','SH226ASP','[85, 33, 78, 89]'),('TINDC9E58D13-152E-4D5D-A96F-B065D0383F7A','UI22900074','SH548ASP','[62, 51, 57]'),('TINDC9FBDA98-8CF4-4423-A980-95543C087103','UI60100053','SH278ASP','[59, 100, 91, 79]'),('TINDCA57AE95-43C9-420C-918A-6A6945FF843E','UI72800021','SH548ASP','[71, 45, 44]'),('TINDCA649637-B441-47C9-B542-38A779DBC431','UI21000646','SH507ASP','[53, 49, 48, 90, 42, 66]'),('TINDCA6E95CA-BD7D-4FF4-B4AE-D3DD5ADB24B7','UI5100091','SH755ASP','[51, 95, 62, 99]'),('TINDCA81F13A-25D6-4DCF-A671-A1F52F9D58AF','UI9430001','SH982ASP','[64, 58, 46, 62, 37, 57]'),('TINDCABF2F75-D117-40DC-954B-4656BAFA3700','UI85000065','SH300ASP','[40, 96, 72]'),('TINDCAC20139-9365-45C0-A0ED-BDDD78087D32','UI20100084','SH747ASP','[93, 95, 84, 60, 61, 51]'),('TINDCAE42DA6-EC75-4ABE-8220-BC8A56B75EF3','UI38800057','SH583ASP','[77, 36, 81, 82, 86, 47]'),('TINDCAFBC8D4-B641-4E25-9EA5-EC7344F5A2C7','UI10900013','SH364ASP','[73, 33, 56, 30]'),('TINDCB01C97D-C158-43FC-9B21-29FE23C72FA3','UI29100026','SH113ASP','[39, 89, 69, 68, 69, 70]'),('TINDCB13A94B-0B6C-412B-AE76-CD14F44D58FB','UI22200013','SH979ASP','[48, 36, 53, 57, 79]'),('TINDCC34D195-279F-43B0-9CAE-C706529E9EB6','UI31300045','SH209ASP','[49, 50, 89]'),('TINDCD0C48E3-A6DC-481B-B9BA-C70CE3FC363F','UI37200098','SH162ASP','[75, 49, 51, 37, 99]'),('TINDCDD36F17-1CA9-437C-8726-538C0785352F','UI18000093','SH588ASP','[32, 98, 33, 41, 37]'),('TINDCDE8C4B3-DD89-46A3-8A7D-4A228AE64475','UI31100021','SH567ASP','[91, 37]'),('TINDCE8D0BB2-A854-4AAF-A738-D2043E02683D','UI47200011','SH508ASP','[96, 77, 97, 38, 83, 71]'),('TINDCEA62F9F-210B-4EA0-9CEE-0B02DAB320F6','UI61900084','SH771ASP','[90, 87]'),('TINDCEAFB05A-EC65-4E33-93F0-CB03090AEA8B','UI98200022','SH448ASP','[100, 71, 83]'),('TINDCECF029D-B462-4708-A3BB-0BEBFA5379B8','UI22800014','SH576ASP','[70, 58, 78, 76]'),('TINDCFAFE8E0-F2CD-4BCC-B48C-2274C247DA2B','UI47500076','SH162ASP','[79, 66, 62, 33]'),('TINDCFEC26DB-C8C5-433B-A7A0-4BE14C06DA27','UI98400090','SH596ASP','[89, 93, 68]'),('TINDCFFA802E-611B-47B1-9C86-290C6E6E1D3D','UI38400073','SH235ASP','[57]'),('TINDD01077BA-5D9F-4D4A-8446-8096774E3D80','UI69000084','SH493ASP','[46, 51, 67]'),('TINDD03276B8-4EBA-44E6-BE06-013B0B475727','UI91400079','SH498ASP','[66, 62, 59, 48]'),('TINDD09D0BD7-29C1-4287-9112-1842632BB924','UI60500032','SH742ASP','[39, 91, 96, 61, 88]'),('TINDD0C83364-0BEE-4CB9-AD96-1BB176C1E40A','UI72000427','SH300ASP','[99]'),('TINDD10DC2DD-3765-4697-BF55-8F6AFB198E39','UI32200099','SH448ASP','[89, 46, 86, 73, 33]'),('TINDD112BAF3-0C31-4D1B-8459-26CFF56CD31A','UI13400064','SH156ASP','[74]'),('TINDD282DBF5-2EFF-4CBE-8D82-828EB7147792','UI64700075','SH535ASP','[78, 90, 45, 94]'),('TINDD2D9F515-FCFA-48EA-9F2D-AB2824CD78C9','UI24200063','SH567ASP','[92, 45, 100, 84, 67, 72]'),('TINDD352DC46-2F3E-400B-BEC4-949B51D622FB','UI33500081','SH338ASP','[88, 75]'),('TINDD3EBEF0A-A0C1-4EB7-A531-93E587B55F73','UI49700074','SH967ASP','[44]'),('TINDD45FDD5D-11B0-49B5-B765-59DC4EC90E4C','UI24400062','SH392ASP','[66, 39, 93, 94, 38]'),('TINDD4B4D4E3-C914-438E-ADF5-659B2A222B63','UI33700077','SH795ASP','[97, 81, 93]'),('TINDD564965F-1CD4-4F13-B23D-5ABCD1A11E45','UI12300073','SH336ASP','[78, 45, 80, 67, 71, 64]'),('TINDD5C3B9B6-D0F4-4AA6-8CBA-8F7584E5B698','UI99000898','SH862ASP','[82, 42, 71]'),('TINDD5D486FE-B839-44AB-8534-4E5842D6D5BF','UI85300054','SH443ASP','[39, 98, 91, 78, 70, 87]'),('TINDD6638B6F-905D-4240-8411-67DCAF0B161C','UI84500081','SH420ASP','[93, 62, 72]'),('TINDD686D7E8-1395-463E-94B7-E507D3C2BF91','UI94400096','SH921ASP','[33, 75, 49, 45, 94]'),('TINDD69BD3D7-F6A8-4EAE-8254-68E58D4D1756','UI50300069','SH267ASP','[98]'),('TINDD6C132EA-9076-4A37-8DD6-8187C2520A2F','UI62900043','SH634ASP','[99, 83, 31]'),('TINDD6CEAA60-1C7F-4847-B1A4-99ABD41F366E','UI72000036','SH576ASP','[54, 46, 92, 97]'),('TINDD725F4B7-DB1A-477B-8EDD-7DC728234CA2','UI66800063','SH594ASP','[76, 42, 83, 85, 80]'),('TINDD759FD6A-1D7B-4653-A72F-6584768B5D2A','UI28500019','SH674ASP','[65, 86, 58]'),('TINDD7BFB173-E253-482A-91AB-978321B51A10','UI64800045','SH876ASP','[35, 91, 30, 40]'),('TINDD7EA2BF2-4416-4632-BAB9-97451452DBAB','UI42200056','SH221ASP','[96, 37]'),('TINDD855D85D-C20E-46D3-BD79-8C886BCCCA81','UI75400069','SH392ASP','[47, 72]'),('TINDD8AC548C-CE92-4A40-B45C-862DFB0B838F','UI83100044','SH261ASP','[91, 53, 69, 78]'),('TINDD8AD3904-2F44-495E-B7B4-2817326D5FEB','UI44200071','SH198ASP','[61, 81, 97, 78, 78]'),('TINDD98EB9E5-2164-45F5-A3D9-3AB32B07E6EC','UI22400045','SH957ASP','[99, 39, 32]'),('TINDD9BB3777-EF42-4848-BEEE-EEEA717909C4','UI37900081','SH821ASP','[86, 96]'),('TINDDA38A02D-610F-469B-8EF7-7AF804F200D5','UI44100085','SH339ASP','[70, 99, 33, 45]'),('TINDDA47373E-6E0C-4B54-BDC8-247856F48C7E','UI29900075','SH917ASP','[98]'),('TINDDA4B1698-297A-4A73-96AE-E9A3AD4907C7','UI62200043','SH918ASP','[92, 57, 82, 31, 62]'),('TINDDA5B7F70-BA9C-4BF4-AF69-43BEC857C760','UI81700097','SH798ASP','[65, 50]'),('TINDDAA143D8-964F-45D1-926D-ECB6820AE9F7','UI41400094','SH877ASP','[40, 82, 42, 95, 97, 84]'),('TINDDB2965C4-8801-42F4-B0A4-F2B2BD6477E7','UI25000091','SH913ASP','[59, 84, 56]'),('TINDDC1AFA83-035E-4010-A943-EDB40C6EC628','UI10400053','SH588ASP','[59, 97, 53, 96, 33, 75]'),('TINDDC39D1AE-F2C2-4C05-BE89-3F5E85F80694','UI68800040','SH280ASP','[88, 46]'),('TINDDC8EBFB5-97AF-47EA-BEDA-2952F1DDDAC2','UI43100084','SH339ASP','[97, 100, 39, 96, 57, 63]'),('TINDDCD10DCA-F1D3-4404-888E-0E77E2AA337A','UI70000018','SH470ASP','[79, 55, 95, 78, 91]'),('TINDDCE49C7E-B0D5-461B-9269-2EA3E7E4545C','UI22500019','SH634ASP','[71, 37, 57, 68, 39]'),('TINDDD9A90BE-4DED-467C-B68A-10027EAA7B71','UI13600048','SH250ASP','[70, 52, 59, 53]'),('TINDDE6E7145-D941-4649-A2BC-FB20C9C15C80','UI7330005','SH198ASP','[34, 72, 72, 44]'),('TINDDE7EF812-9C49-4124-93DB-E1C52638675B','UI82500039','SH339ASP','[32, 75, 63]'),('TINDDEEA6A92-2F9C-43AF-B6E5-048241488542','UI21000646','SH279ASP','[37, 42, 67, 88, 52]'),('TINDDEF9BAC4-74EE-435C-B32B-C0B1422310D2','UI15900033','SH427ASP','[56, 96, 89]'),('TINDDFD6EC4F-BC83-46B0-8CFE-94CB514FD431','UI98600081','SH178ASP','[93]'),('TINDE07CB12A-89E9-4FD6-95F9-275CE208DB4C','UI73000399','SH857ASP','[78, 36, 46, 73, 99]'),('TINDE0958E5F-3417-4AD8-95FA-56E94BD03A8F','UI15300032','SH823ASP','[80, 67, 96]'),('TINDE12AE3F6-14C2-49C0-81F6-02F91F236FA5','UI30200043','SH698ASP','[60, 87, 63, 31, 48, 39]'),('TINDE16463BE-98CA-4129-8774-C00B94DFB117','UI53700013','SH269ASP','[75, 44, 50, 45, 50]'),('TINDE22118B0-5D4D-49B6-8C23-7F10AB965F86','UI59100060','SH698ASP','[38, 96, 45, 68, 42]'),('TINDE2629A91-BD07-4642-A260-200506DCC89A','UI71200039','SH366ASP','[90, 47, 31, 99]'),('TINDE3438D5F-7627-4083-8770-ECA5C47C1353','UI24800046','SH364ASP','[59, 64, 42, 31, 46]'),('TINDE3682E0F-2096-468D-84D2-C37436EA0AFA','UI69400092','SH847ASP','[30, 96, 42, 48]'),('TINDE3725096-845E-4726-8A6D-18DD1ABD0D79','UI62200043','SH983ASP','[44, 93, 55, 32, 100]'),('TINDE3C47365-2C5F-458F-ABFC-BB0FD94F434F','UI70900098','SH594ASP','[81, 53, 50, 81]'),('TINDE3E3AF2A-CE4F-45F6-B782-3F6F1BFCA7BA','UI92800047','SH591ASP','[33, 78, 61, 34, 37]'),('TINDE3E49271-9299-47F4-AE3C-EA5DE8478DCE','UI32000397','SH742ASP','[44, 72, 73, 60]'),('TINDE3EE06D2-B9B9-4064-BF7E-22589DB7C8AC','UI87700085','SH545ASP','[77]'),('TINDE4A2994C-445B-403C-8951-5BD6AE346CF6','UI60000061','SH319ASP','[40, 58]'),('TINDE4E4EE8D-EAF0-41C5-B78E-8E334901A1EF','UI82200096','SH798ASP','[99, 69, 89, 68, 44]'),('TINDE4EA33FF-8CD5-47F9-95AA-FB578EBE8190','UI49600093','SH366ASP','[55, 76, 77, 51]'),('TINDE52B3DDD-342B-4708-B2A8-B24146C7FF5B','UI71900029','SH912ASP','[38, 81, 69]'),('TINDE5D0EAC3-681F-4923-82E5-089766E83073','UI34000063','SH644ASP','[46, 83, 71, 64, 82, 64]'),('TINDE5F73DA5-26C2-4EE8-987F-8DD863C1BE33','UI45100071','SH645ASP','[96, 43, 48, 66, 79]'),('TINDE66F675C-114B-4CEA-B28F-8B6383CF40B4','UI13500070','SH660ASP','[43, 79, 67, 73, 40, 56]'),('TINDE6A5B353-9437-4E61-A602-F277DDED065F','UI23900073','SH257ASP','[40, 80, 56, 73, 98]'),('TINDE6AF8F3C-75CE-4D92-81F7-189D235D670F','UI80300021','SH597ASP','[85, 36]'),('TINDE6C89E3B-7D58-495F-A1EC-5E9C83DA83E6','UI38900077','SH270ASP','[94, 53]'),('TINDE6DB9D5E-8A56-444D-9EBB-BECCE6BFDE60','UI11000447','SH418ASP','[71, 52]'),('TINDE6E207AC-29FD-45F7-A903-D5F809A1BCDB','UI77600055','SH148ASP','[35, 73, 57]'),('TINDE6FA4924-7EE7-4244-BBFC-31EF72B44B7E','UI30400060','SH974ASP','[59]'),('TINDE74FF408-94E2-48DC-AF4B-60AF93779134','UI55600057','SH148ASP','[79, 30, 97]'),('TINDE78C5E55-9408-4D4D-88FC-875BBBD52DBA','UI38800057','SH447ASP','[43, 53, 88, 63]'),('TINDE7C01004-6E01-4465-AA36-BF0712E0E670','UI78200024','SH447ASP','[98, 62, 95, 68, 76, 90]'),('TINDE7EE3CE4-19B6-478C-A0F8-0755F63F57F5','UI50800039','SH771ASP','[57]'),('TINDE82D93DC-0C31-4CBC-BD65-E1136F36854D','UI48900022','SH625ASP','[76, 82, 100, 43, 70, 51]'),('TINDE858F9B5-F4A2-47D7-8714-D9C3BD425E27','UI72900038','SH671ASP','[40, 75, 90, 30]'),('TINDE899C935-092B-461A-8B2C-5170C558E8DD','UI10400053','SH110ASP','[81, 50, 31, 87]'),('TINDE8BA7301-36C6-43D0-A041-4E25C250AB7F','UI52100084','SH913ASP','[54, 89, 85, 88, 98, 67]'),('TINDE8DF1F10-2355-450B-A4E5-BB2FB7C320FE','UI84600050','SH507ASP','[40, 66, 48, 99, 88]'),('TINDEA0A4C2D-91F8-4BE9-843F-FAEB55B5ACC6','UI11200016','SH527ASP','[85, 83]'),('TINDEA381C9C-1DF5-4196-881A-4ACD743D3874','UI4000424','SH498ASP','[56, 81, 72, 84, 81]'),('TINDEA42E662-DF1F-429F-AFA7-A66D22DC9F14','UI18000093','SH634ASP','[38, 91, 93, 51, 60, 39]'),('TINDEA5AD038-827E-4CFD-BC33-36D207203B8D','UI74000054','SH749ASP','[76, 95]'),('TINDEAB0EC0A-AE8C-44EA-9080-B85A394593BD','UI77900060','SH796ASP','[77]'),('TINDEABC35FB-45C1-4176-838B-D5D4187932A3','UI50400058','SH974ASP','[31, 43, 39, 40, 79, 40]'),('TINDEAFC1FFF-728A-46F0-AC95-B3704FCF9794','UI79100018','SH701ASP','[67, 97, 70, 84]'),('TINDEB04B9AD-4792-42DA-AAB4-3A197320EBFA','UI37000209','SH251ASP','[93, 80, 94, 53, 39]'),('TINDEB3C9168-45F6-410A-95A5-827DDB88D926','UI33800086','SH747ASP','[100, 63, 47, 76, 39]'),('TINDEC14BA13-07D0-4DC5-A033-2D0872AE1D50','UI66000026','SH156ASP','[38]'),('TINDEC4DC265-DC9B-4F54-A0DF-302AB035D7A3','UI70700011','SH129ASP','[81, 82, 42]'),('TINDEC6EDBF8-0DBA-4764-996F-80FB91F570E2','UI11500072','SH876ASP','[71]'),('TINDED215B4F-3A08-4955-A668-A294096E11FA','UI23200048','SH105ASP','[53, 78]'),('TINDED4EDAB2-7569-459C-8B07-40F0027BC768','UI11700095','SH716ASP','[75]'),('TINDED60AE36-3A9C-483C-92C3-F894AE795C0C','UI28000258','SH158ASP','[79]'),('TINDED67FFB1-05FF-446A-BB09-4799080AD4EA','UI46800044','SH711ASP','[34]'),('TINDEDB06246-FE72-4F99-BFAE-00A8A32A5A0E','UI55000245','SH235ASP','[69, 46, 62]'),('TINDEDFF9A07-95F6-4250-91AD-9418AE29E60F','UI83200076','SH511ASP','[44, 68, 60, 43]'),('TINDEE1ACD7A-D86E-405B-A84B-60E274F6AD77','UI46300026','SH458ASP','[34, 89, 70, 71]'),('TINDEECCFD12-497F-4BFA-90D5-D96BA27904A2','UI53500012','SH512ASP','[96, 70, 34, 48, 38]'),('TINDEEFEB21D-C12B-4CE7-84AD-43F41B48938A','UI67900088','SH894ASP','[75]'),('TINDEF3188EB-2197-45BD-B0B9-F2F3104411A9','UI11200016','SH336ASP','[86, 54, 95, 95, 47]'),('TINDEF376133-9734-4749-9192-F2751103AF8C','UI41700072','SH181ASP','[44]'),('TINDEF3DD2CC-DF4F-4EA0-8041-90606F296481','UI63900094','SH645ASP','[74, 65, 83, 70, 32, 52]'),('TINDEF53ADE4-5DC1-4E05-81D2-0D0F9C812418','UI51600027','SH227ASP','[81, 93, 44, 52]'),('TINDEFEE97CC-F1F2-4389-B0B2-EE6B1C45A4F6','UI27400044','SH280ASP','[59]'),('TINDF01894FF-5DC9-475E-BBE7-C2B9A6CE08BA','UI34300045','SH508ASP','[81, 71, 33]'),('TINDF02EC727-C220-43FC-AE66-9BC19BF2D61F','UI91900040','SH417ASP','[55, 33, 38, 39]'),('TINDF0CFC4D0-0228-49FA-8CB7-4DE99CD73C18','UI64400080','SH351ASP','[62, 59, 83, 43]'),('TINDF0DA2039-FEB5-4077-B1FA-4A13405A93FE','UI56500034','SH941ASP','[100, 97, 35, 65, 49, 62]'),('TINDF0E148AB-7C9C-4D68-8376-42B3DCBBB9B8','UI34900092','SH879ASP','[89]'),('TINDF1106F30-7CA3-42A3-9DD7-1FF494337FC6','UI71500081','SH601ASP','[33, 94, 39]'),('TINDF11EA10B-1871-4843-9501-037526714EDE','UI31400018','SH110ASP','[59, 43, 37, 31, 47, 68]'),('TINDF143F390-EB38-40E3-9342-E6021A42A81C','UI75000398','SH279ASP','[41, 33, 72, 91]'),('TINDF1600FBF-4299-4431-8893-EE15456331FB','UI61700082','SH389ASP','[66, 63, 40, 51, 91, 95]'),('TINDF17BCD86-9AF9-4186-943D-4B7375166234','UI80900011','SH232ASP','[82, 33, 57]'),('TINDF19B1FAE-92E4-4C71-8A6B-4DEE26D1546E','UI82500039','SH542ASP','[84, 68, 50, 39, 86]'),('TINDF20642F7-6F86-48CD-AA68-ABDB78CB5361','UI68500053','SH164ASP','[74]'),('TINDF22903BF-AB7A-41AD-B659-3C2A358F3E31','UI58600092','SH493ASP','[46, 75, 75, 75, 49]'),('TINDF23D4FA1-03D2-4F69-B58C-FA9D175EB45E','UI19900047','SH180ASP','[37]'),('TINDF2E19040-2A2E-4222-83D7-7BBF5B1896D3','UI28900047','SH625ASP','[55, 92, 48, 42]'),('TINDF2F9218F-561A-49C7-ACE9-1412D7BD7412','UI18900029','SH178ASP','[85]'),('TINDF334252D-2C46-4EA9-89D3-A29BD8F3A300','UI29500046','SH475ASP','[79, 76]'),('TINDF355B432-50D6-450C-A2D7-831AE6714B27','UI96900095','SH994ASP','[93, 77, 37, 96, 47, 95]'),('TINDF3DB9952-363C-4C19-943D-0CF8E59B4E54','UI40400059','SH178ASP','[33, 95, 38, 30]'),('TINDF3EE170E-3424-4E00-9AEC-9DF554B74664','UI71900029','SH902ASP','[51, 35, 56, 38, 41]'),('TINDF3F674C0-1EEF-443E-9BD6-12C604391AFF','UI10800046','SH876ASP','[94, 96, 58, 92]'),('TINDF450C002-6CE0-4353-B4CD-06323DAFB903','UI55500048','SH142ASP','[52, 41, 86]'),('TINDF4865E6F-DCA7-4176-BA0B-F6BFE6104DB2','UI3000495','SH847ASP','[71]'),('TINDF4878C3A-883F-4D3F-9ACC-196377AD9A88','UI45000302','SH493ASP','[100, 49, 88, 85, 63, 100]'),('TINDF4DEFCEE-CD51-4407-99D8-C84E6120D5EA','UI28000258','SH994ASP','[90, 30, 32, 73, 49]'),('TINDF5194E63-3FDC-4B19-B33F-E35CAF64DD74','UI94400096','SH795ASP','[38, 82]'),('TINDF51C7261-A468-41C4-AD4D-9F4FE2A62304','UI1270008','SH899ASP','[85, 51]'),('TINDF5689848-00F2-4F09-8FBD-FE207EA668FB','UI57000456','SH178ASP','[68, 53, 94, 100, 34]'),('TINDF5C8B8C3-EB29-4F15-BB65-688843438F83','UI10200037','SH198ASP','[42]'),('TINDF5DA16A4-4540-4FE7-8CF4-4808135C2E72','UI74400040','SH987ASP','[83, 85]'),('TINDF61CB646-64A6-4A29-BFDA-3DC77984A7E4','UI56700016','SH269ASP','[91, 83]'),('TINDF62D7DED-8031-46B7-B212-AD6937216D66','UI89200084','SH300ASP','[38, 64, 76, 92]'),('TINDF6D3F665-4A33-4876-8DFF-F6D30C60E5B3','UI74500096','SH876ASP','[32, 91, 32, 84, 52, 84]'),('TINDF72067DB-3DF2-46D6-A475-3EC3398B8E9A','UI20400069','SH198ASP','[59, 65, 37, 83, 48]'),('TINDF7C8EDA2-D0A2-42C0-81D2-A29B5C60AECC','UI56100039','SH894ASP','[37, 68, 54]'),('TINDF874A867-60CA-4238-AEF3-53FB8C18A708','UI40100013','SH876ASP','[48, 71, 98]'),('TINDF89E133B-71A0-47ED-89FB-78A2C032313A','UI53000233','SH625ASP','[52]'),('TINDF8BD9467-CE63-44E4-85B4-3B1C03E897D4','UI65200091','SH103ASP','[33, 68, 36, 73, 82, 72]'),('TINDF930ADF7-6FA4-4A86-A484-A65C2011C50F','UI36800054','SH596ASP','[47, 42, 35]'),('TINDF939EEB0-9203-4985-808C-9E0811C1DC41','UI71600076','SH805ASP','[37, 86, 44]'),('TINDF9DF8E8E-6C75-47B5-87B3-F089578D7308','UI22700070','SH639ASP','[34, 50, 47, 51, 56]'),('TINDFA122C4C-A2BD-4FE9-8B8A-32C324C09E6A','UI57600035','SH162ASP','[66]'),('TINDFA682A10-CA1C-49DC-A958-A46E480AE23D','UI92800047','SH671ASP','[59, 56, 62, 95, 94, 74]'),('TINDFA7B3837-8E88-46EB-8642-247B4190BF83','UI39700071','SH443ASP','[67, 91]'),('TINDFA820511-C973-4BF6-940F-4301D7C6C99A','UI57400089','SH418ASP','[71, 49, 45, 70, 84]'),('TINDFAFD447C-0DE6-4CDD-B2B4-17AB078F92BB','UI7000582','SH798ASP','[35, 56, 63]'),('TINDFB101F2D-FE06-4CF1-A201-82AC17F86EB1','UI35100091','SH808ASP','[80, 57, 85, 51, 78, 40]'),('TINDFBF271FF-5BF0-491B-B5D5-9904882B9286','UI20300058','SH336ASP','[60, 99]'),('TINDFC914A20-C93D-440F-B2C6-0C13B4ECDF8C','UI62000480','SH857ASP','[75, 98, 38, 97, 44]'),('TINDFCDF99B9-1DC4-4597-A046-6FE2D33E80D1','UI10700015','SH879ASP','[93, 81, 95, 93]'),('TINDFCE0B6C2-34FE-4887-AD0F-FF4B88284922','UI84000492','SH278ASP','[75, 65, 63, 49, 72, 50]'),('TINDFD250A4B-7929-4889-9419-83E8EC67BDE5','UI92000019','SH300ASP','[42, 38]'),('TINDFD3EAD3E-1487-46B8-85E4-744ED1B04C98','UI76700061','SH594ASP','[59, 84, 82]'),('TINDFD600A24-F966-4F75-BFBB-193D2E889690','UI94400096','SH574ASP','[80, 95, 89, 87]'),('TINDFD658020-92CF-42EB-BB06-B54A08825358','UI68400082','SH567ASP','[66]'),('TINDFD85AA80-FA65-4C28-9DFD-5B7AE29F9E79','UI76900017','SH742ASP','[34, 50, 77]'),('TINDFDBBBEDE-AC7C-4D8B-B2CA-9D17C2AC42AA','UI97500081','SH712ASP','[57]'),('TINDFDF2CBBB-FA61-417D-8C6A-7096FAB55C25','UI25600067','SH823ASP','[52, 59, 39, 44]'),('TINDFE7EA08A-25CB-4F35-961C-5A13263BED6F','UI66000649','SH250ASP','[69, 98]'),('TINDFEA4C002-DE17-4C91-B009-94A54F138C79','UI44000045','SH470ASP','[93]'),('TINDFEA7FDC7-C106-42DF-8B38-8C783C04274F','UI68900053','SH877ASP','[100, 59, 98]'),('TINDFEC520FF-21E3-49F9-ADBA-2F12547A92EA','UI33500081','SH833ASP','[92, 59, 78, 60, 96, 46]'),('TINDFF09AA18-5051-4363-BAC8-768A83597A3E','UI60700084','SH854ASP','[41, 89, 67, 68]'),('TINDFFEB0EF6-0E1E-4423-92DA-6A04DC1C20C8','UI91000574','SH778ASP','[83, 34, 93]');


-- Dump completed on 2021-10-25 17:08:35


show tables;

# Inner join

select * from theatre limit 2;
select * from shows limit 5;

select * from theatre inner join shows on theatre.theatre_id=shows.theatre_id limit 5; 

# i want to find avg price_per_ticket city wise

select city,avg(shows.price_per_ticket) from theatre inner join shows on 
theatre.theatre_id=shows.theatre_id group by city limit 5;

select * from movie;

# theatre and movies has many to many relationship which are connected through shows 

# lets say we want to find avg price per ticket group by city and the movie lang

select city,languages_available,avg(shows.price_per_ticket) as avg_price
from movie inner join shows on movie.movie_id=shows.movie_id inner join theatre on 
theatre.theatre_id=shows.theatre_id group by city,languages_available order by avg_price;

# left join
# there might be some theatres that are not currently displaying any shows.
# for those particular theatres we will have null values from the shows table

select * from theatre left join shows on theatre.theatre_id=shows.theatre_id;

select * from theatre inner join shows on theatre.theatre_id=shows.theatre_id;

# no. of shows per thater _id

select theatre.theatre_id,count(show_id) as num_shows from theatre left join shows
on theatre.theatre_id=shows.theatre_id group by theatre_id;

#movies currently running in each theatre--

select theatre.theatre_id,shows.show_id,movie.movie_id from theatre left join shows on
theatre.theatre_id=shows.theatre_id left join movie on movie.movie_id=shows.movie_id;

# right join--

select * from shows right join theatre on shows.theatre_id=theatre.theatre_id limit 5;

# full outer join--
# customer profile table, ticket table

select customer_profile.customer_id,ticket.ticket_id from customer_profile left join ticket
on customer_profile.customer_id=ticket.customer_id limit 5;
# now there are some customers who have brought ticket offline and they donot have any id.
select customer_profile.customer_id,ticket.ticket_id from customer_profile right join ticket
on customer_profile.customer_id=ticket.customer_id limit 5;
# i.e. for some customer id, we donot have any ticket id, and for some ticket id we donot have any customer id,

# so we can just o/p all the customer ids and ticket ids 

select customer_profile.customer_id,ticket.ticket_id from customer_profile left join ticket
on customer_profile.customer_id=ticket.customer_id 
union
select customer_profile.customer_id,ticket.ticket_id from customer_profile right join ticket
on customer_profile.customer_id=ticket.customer_id limit 5;

# cross join---
select count(*) from ticket;
select count(*) from customer_profile;
select count(*) from ticket cross join customer_profile;
select count(*) from ticket natural join customer_profile;

#self join--

# in a particular theatre there could be multiple shows id.and we want to find maxi price per ticket at
# agiven theater for a given show--

select s1.theatre_id,s1.show_id,s1.price_per_ticket from shows s1,shows s2
where s1.theatre_id=s2.theatre_id group by s1.theatre_id,s1.show_id,s1.price_per_ticket
having s1.price_per_ticket=max(s2.price_per_ticket)
order by s1.theatre_id;

# multiple tables with subqueries
# shows and theatre table--
# i want to find out info for those records where theater id is either in city delhi chennai or mumbai

select * from shows inner join theatre on theatre.theatre_id=shows.theatre_id where theatre.city in
('Delhi','Chennai','Mumbai');

select * from shows where theatre_id in (select theatre_id from theatre where city in ('Delhi','Chennai','Mumbai') );

#-------------------------------------------------

-- MySQL dump 10.13  Distrib 8.0.20, for Linux (x86_64)
--
-- Host: localhost    Database: website
-- ------------------------------------------------------
-- Server version	8.0.20-0ubuntu0.19.10.1
use etl;
show tables;
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `refund_detail`
--

DROP TABLE IF EXISTS `refund_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refund_detail` (
  `ticket_id` varchar(50) DEFAULT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `transaction_amount` int DEFAULT NULL,
  `ticket_raise_time` datetime DEFAULT NULL
); #ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refund_detail`
--

LOCK TABLES `refund_detail` WRITE;
/*!40000 ALTER TABLE `refund_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `refund_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `signup_summary`
--

DROP TABLE IF EXISTS `signup_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `signup_summary` (
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `Email` int DEFAULT NULL,
  `Facebook` int DEFAULT NULL,
  `Instagram` int DEFAULT NULL,
  `LinkedIn` int DEFAULT NULL,
  `Organic` int DEFAULT NULL,
  `prime_from_Email` int DEFAULT NULL,
  `prime_from_Facebook` int DEFAULT NULL,
  `prime_from_Instagram` int DEFAULT NULL,
  `prime_from_LinkedIn` int DEFAULT NULL,
  `prime_from_Organic` int DEFAULT NULL
);# ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `signup_summary`
--

LOCK TABLES `signup_summary` WRITE;
/*!40000 ALTER TABLE `signup_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `signup_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `transaction_id` varchar(50) DEFAULT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `product_id` varchar(50) DEFAULT NULL,
  `transaction_time` datetime DEFAULT NULL,
  `price` int DEFAULT NULL
);# ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_summary`
--

DROP TABLE IF EXISTS `transaction_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction_summary` (
  `Air Conditioner` int DEFAULT NULL,
  `Microwave` int DEFAULT NULL,
  `Refrigrator` int DEFAULT NULL,
  `LG` int DEFAULT NULL,
  `Haier` int DEFAULT NULL,
  `Samsung` int DEFAULT NULL,
  `Whirlpool` int DEFAULT NULL,
  `sales_from_Air Conditioner` int DEFAULT NULL,
  `sales_from_Microwave` int DEFAULT NULL,
  `sales_from_Refrigrator` int DEFAULT NULL,
  `sales_from_LG` int DEFAULT NULL,
  `sales_from_Haier` int DEFAULT NULL,
  `sales_from_Samsung` int DEFAULT NULL,
  `sales_from_Whirlpool` int DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL
);# ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_summary`
--

LOCK TABLES `transaction_summary` WRITE;
/*!40000 ALTER TABLE `transaction_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` varchar(50) NOT NULL,
  `user_email` varchar(40) DEFAULT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `source` varchar(20) DEFAULT NULL,
  `is_prime` tinyint(1) DEFAULT NULL,
  `signup_time` datetime DEFAULT NULL
);# ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valid_refund`
--

DROP TABLE IF EXISTS `valid_refund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `valid_refund` (
  `ticket_id` varchar(50) DEFAULT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `ticket_raise_time` datetime DEFAULT NULL
);# ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valid_refund`
--

LOCK TABLES `valid_refund` WRITE;
/*!40000 ALTER TABLE `valid_refund` DISABLE KEYS */;
/*!40000 ALTER TABLE `valid_refund` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-01 14:35:46
show tables;
# random data is created for users table,trxs table and refund_detail table

desc users;
desc transaction;
desc refund_detail;

select count(*) from users;
select count(*) from transaction;
select count(*) from refund_detail;



    






 














 
 
 #eg.





