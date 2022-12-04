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
select emp_id from emp_gp where emp_salary=40000;

#Having clause is like aggregate function with group by clause..
#Group by clause groups rows thhat have same valuesinto summary rows.
#Having Clause with where clause in order to find rows with certain conditions


create table emp_gp(emp_id int,emp_name varchar(20),emp_city varchar(20),emp_salary int);
insert into emp_gp(emp_id,emp_name,emp_city,emp_salary) values 
(1001,"Karthik","Thane",40000),
(1002,"Selvi","Pune",50000),
(1003,"Raj","Thane",55000),
(1004,"Sarvana","Mumbai",56000),
(1005,"Subha","Pune",20000),
(1006,"Krishna","Mumbai",35000);
select avg(emp_salary) from emp_gp;
select count(*) from emp_gp;

select emp_city,count(emp_city) from emp_gp group by emp_city;
select emp_city,emp_n0ame,emp_salary from emp_gp  group by emp_city having emp_salary>=avg(emp_salary);
select emp_city,emp_name,emp_salary from emp_gp where emp_city="Mumbai" group by emp_city having emp_salary>=avg(emp_salary);
# do remember to include having colin select clause.

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
















 
 
 #eg.





