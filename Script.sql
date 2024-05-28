show databases;
create database mysql_8_10;
use mysql_8_10;

create table student_info
(roll_no tinyint,attendance bit,
pocket_money smallint);

show tables;

desc student_info;

insert into student_info values(134,4,25000);

select * from student_info;
insert into student_info values('a',0,250);

select * from student_info;

create table product_d
(id int,copies bigint,price decimal(5,2));

show tables;

desc product_d;
insert into product_d values
(9876543210,9999999999,999.99);
select * from product_d;
insert into product_d values 
(12345,83763867639,88888888.888888);
select * from product_d;
insert into product_d values 
(12345,83763867639,88867);
select * from product_d;
insert into product_d values 
(12345,83763867639,888.67);
select * from product_d;

create table f_datatype(id float,re real);
insert into f_datatype values
(5678634867857.6578468,7668946498.74897689);
select * from f_datatype;
insert into f_datatype values
(7.6578468,8.74897689);
select * from f_datatype;
desc f_datatype;

create table dt
(dt date,ti time,dt_ti datetime);
insert into dt values
('2023-02-22','09:44:00',
'2023-02-22 09:44:00');
select * from dt;

create table student_c
(sname char(10),
svname varchar(20));
desc student_c;
insert into student_c values
("ABC","DEF");
select * from student_c;

#-------------------------------------------23-2--------------------------------------------------------

create table student_demo(
roll int, suject varchar(20),addr varchar(20),marks int);

desc student_demo;

insert into student_demo values (1,"Python","Pune",56);
select * from student_demo;

insert into student_demo values (2,"Java","Mumbai",95),
(3,"HTML","Nasik",85),(4,"C","Pune",56),
(5,"Python","Nasik",50);
select * from student_demo;
insert into student_demo values(6,"Django","Andheri",99),
(7,"JavaScript","Banglore",85);

insert into student_demo values(8,null,"Pune",null);
select * from student_demo;

insert into student_demo(roll,addr) values(9,"Delhi"),
(10,"Mumbai");
select * from student_demo;
insert into student_demo values(11,"Django","Andheri",78),
(12,"JavaScript","Banglore",45),(13,"Python","Andheri",86),
(14,"Python","Pune",96);

select * from student_demo;
select roll,marks from student_demo;

select * from student_demo where roll=5; 

select suject,marks from student_demo where roll=6;

select * from student_demo where marks<90;

select * from student_demo where marks<90 and marks>50;
select * from student_demo where marks>50 and marks<90;
select * from student_demo where marks between 50 and 90;

select roll,
case 
    when marks<100 and marks>75 then "Very Good"
    when marks<75 and marks>60 then " Good"
    when marks<60 and marks>35 then " Nice"
    else "Fail"
end as "Result"
from student_demo;
#select * from student_demo where marks between 90 and 50;
select * from student_demo where roll=1 or roll=2;

select * from student_demo where roll in(1,2);

select addr from student_demo;
select distinct addr from student_demo;

select distinct addr from student_demo where addr like "%i";


select distinct addr from student_demo where addr like "A%i";
select distinct addr from student_demo where addr like "M%";
select distinct addr from student_demo where addr like "m%";

select distinct addr from student_demo where addr like "_____i";

select distinct addr from student_demo where addr like"_u%";

select roll,marks from student_demo;

select roll,marks from student_demo order by marks;


select roll,marks from student_demo order by marks desc;
select * from student_demo order by marks desc limit 1;
select addr from student_demo order by marks desc limit 3;
select addr from student_demo order by marks desc limit 1,3;

select * from student_demo where marks is null;
select * from student_demo order by marks;
select * from student_demo where marks is not null;
select * from student_demo where marks is not null order by marks 
limit 1;

#------------------------------------------27-2-------------------------------------

#constraints------
create table unique_c
( id int unique,
  name varchar(20),
  marks decimal(6,2));
  
  insert into unique_c values(1,"Harry",89.99);
  select * from unique_c;
  insert into unique_c values(2,"Tom",79.99);
  select * from unique_c;
 insert into unique_c values(null,"Tom",79.99); 
 select * from unique_c;
 insert into unique_c values(null,"Jerry",90.99);
 select * from unique_c;
 insert into unique_c values(0,"Tom",79.99); 
 select * from unique_c;
 insert into unique_c values(0,"Jerry",90.99);
  select * from unique_c;
  
  create table null_c
  (id int not null,
  name varchar(20),
  marks decimal(6,2));
  
  insert into null_c values(null,"Tom",79.99); 
  insert into null_c values(0,"Tom",79.99); 
  select * from null_c;
  insert into null_c values(0,"Tom",79.99);
   select * from null_c;
  
  #drop table unique_null_c;
  create table unique_null_c
  (id int not null unique,
  name varchar(20),
  marks decimal(6,2));
   insert into unique_null_c values(null,"Tom",79.99); 
   insert into unique_null_c values(0,"Tom",79.99);
   select * from unique_null_c;
  insert into unique_null_c values(0,"Tom",79.99);
   select * from unique_null_c;
   
   create table primary_c
  (id int primary key ,
  name varchar(20),
  marks decimal(6,2));
insert into primary_c values(null,"Tom",79.99);
insert into primary_c values(0,"Tom",79.99);
select * from primary_c;
insert into primary_c values(0,"Tom",79.99);

create table p_u_nn_c
  (id int primary key ,
  name varchar(20) not null unique,
  marks decimal(6,2) not null unique,
  addr varchar(20) not null unique);
  
 create table pr_u_nn_c
  (id int primary key ,
  name varchar(20) primary key,
  marks decimal(6,2) not null unique,
  addr varchar(20) not null unique); 
  
  create table a_c
  ( id int primary key auto_increment,
  name varchar(20));
insert into a_c values(1,"Harry");
insert into a_c(name) values("Tom"),("Jerry"),("Bob");
select * from a_c;

create table enum_c
( id int primary key auto_increment,
 course enum("java","python","ML")
);
insert into enum_c values(1,"java");
select * from enum_c;
insert into enum_c values(2,"excel");
select * from enum_c;
insert into enum_c values(3,"java,python"); #
select * from enum_c;

#-----------set--------------------

create table set_c
( id int primary key auto_increment,
 course set("java","python","ML")
);
insert into set_c values(1,"java");
select * from set_c;
insert into set_c values(2,"excel");
select * from set_c;
insert into set_c values(3,"java,python"); #
select * from set_c;

#----------------------check------------

create table c_c(
id int not null,
name varchar(20),
age int,
constraint chk_c check(age>=18)
);

desc c_c;
insert into c_c values(1,"Harry",20);
select * from c_c;
insert into c_c values(2,"Harry",18);
select * from c_c;
insert into c_c values(3,"Harry",17);
select * from c_c;

#------------------------default-------------
create table d_c(
id int not null,
name varchar(20),
age int,
city varchar(20) default "Mumbai"
);
insert into d_c values(1,"Harry",20,"Banglore");
select * from d_c;
insert into d_c values(2,"Harry",20,null);
select * from d_c;
insert into d_c(id,name,age) values(3,"Harry",20);
select * from d_c;


#------------------------28-2-------------------------------
# foreign key constraints----
A foreign key constraint is a key concept in relational databases.
    It establishes a relationship between two tables by ensuring 
    that the value in a column (or a group of columns) in one table 
    matches the value in a column in another table. 
    The table with the foreign key is referred to as the child table, 
    and the table containing the candidate key is referred to as the parent table.

Purpose of Foreign Key Constraints
Data Integrity: Ensures that the value in the child table corresponds to an existing value in the parent table.
Cascading Actions: Supports operations such as cascading deletes 
    or updates, which maintain consistency across related tables.
    
Foreign key constraints are essential for maintaining data integrity and defining relationships 
    between tables in a relational database. They ensure that the values in the child table 
    correspond to existing values in the parent table and 
    can support cascading actions to keep data consistent. 
    By understanding and using foreign key constraints, 
    you can design robust and reliable database schemas.


    
create table customer_fk
(id int not null,
name varchar(20),
primary key(id));

create table orders_fk
(id int not null,
c_id int);

desc customer_fk;
desc orders_fk;

alter table orders_fk add constraint cust_f foreign key(c_id) references customer_fk(id);
desc orders_fk;

insert into customer_fk values(1,"A"),(2,"A"),(3,"A"),(4,"A");

select * from customer_fk;

insert into orders_fk values(10,1),(10,2),(10,3),(10,3);

select * from orders_fk;
insert into orders_fk values(10,5); #-------------error
insert into customer_fk values(5,"A");
select * from customer_fk;
insert into orders_fk values(10,5);
select * from orders_fk;
delete from customer_fk where id=5;#-----------error
delete from customer_fk where id=4;
select * from customer_fk;
delete from customer_fk where id=5;

delete from orders_fk where c_id=5;
select * from orders_fk;
delete from customer_fk where id=5;
select * from customer_fk;


#-------------------------------------indexes-----------------------------

select * from d_c;
select name from d_c where id=1;
create index n_i on d_c(name);
select name from d_c where id=1;

show index from default_c;
drop index i_def on default_C;

#-------------------------------------------------------------3-8---------------------------------
create table product_demo
( id int,
name varchar(20),
price int
);

desc product_demo;

alter table product_demo rename to product1;
desc product_demo;
desc product1;

alter table product1 modify name varchar(30);
desc product1;

insert into product1 values(1,"A",100),(2,"B",200);

alter table product1 add column email varchar(100);
desc product1;
alter table product1 drop column email;
desc product1;

ALTER TABLE product1 change column id pid int;

desc product1;
select * from product1;
truncate table product1;
select * from product1;
desc product1;

drop table product1;
select * from product1;
desc product1;

create table product1
( id int,
name varchar(20),
price int
);

desc product1;
alter table product1 add constraint primary key(id);
desc product1;

alter table product1 drop primary key;
desc product1;

create table course_p
( id int primary key,
 name varchar(20),
 fees decimal(6,2)
);
create table stud_p
( id int primary key,
sname varchar(20),
cid int not null
);

alter table stud_p add constraint stud_f
foreign key(cid) references course_p(id);
desc stud_p;
insert into course_p values(100,"Tom",120.56);
insert into stud_p values(1,"A",100); 
delete from course_p where id=100;
delete from stud_p where cid=100;
select * from stud_p;
delete from course_p where id=100;
select * from course_p;

alter table stud_p drop foreign key stud_f;
desc stud_p;
insert into stud_p values(1,"A",100); 

#------------------------functions---------------

create table str_demo(f_name varchar(20),l_name varchar(20));
insert into str_demo values("Tom","Jerry"),("jAmes","bonD"),
("boB","Merry");
select * from str_demo;
select concat(f_name,' ',l_name) as Name from str_demo;
select upper(f_name),lower(l_name) from str_demo;
select f_name,length(f_name) as Name_Length
from str_demo;

select replace("Let us earn SQL","earn","learn") as Target;

select substr("Let us 1earn SQL",14,3) as Target;

# math functions-----
select round(12344.675,2);
select round(12344.676,-2);

select truncate(12344.676,2);
select ceil(125.1);
select floor(125.1);

select sqrt(81);
select pow(2,3);
select mod(29,2);

select coalesce(null,null,null,1,null,2);
select coalesce(null,null,null,null);

select isnull(1*1);
select isnull(0/1);
select isnull(1/0);

#------------------------------3-9-------------------------------------------

create table num(n int);
insert into num values(1),(2),(3),(4);
select * from num;
select sum(n) from num;
select avg(n) from num;
select min(n) from num;
select max(n) from num;

select sum(n) as Sum,avg(n) Avg,min(n) Min,max(n) Max 
from num;
select count(*) from num;
select greatest(1,3,5,2,6,7);
select least(1,3,5,2,6,7);

#----------------Date-----
select curdate();
select now();
select sysdate();
select month(sysdate());
select adddate(sysdate(),2);
select adddate(sysdate(),-2);
select date_add(sysdate(),interval 2 month);
select datediff(sysdate(),'2020-12-09');
select timestampdiff(day,'2020-12-09',sysdate());

select date_format(sysdate(),'%m');
select date_format(sysdate(),'%y');
select date_format(sysdate(),'%Y');
select date_format(sysdate(),'%b');
select date_format(sysdate(),'%M');
select date_format(sysdate(),'%Y');
select date_format(sysdate(),'%d');
select date_format(sysdate(),'%W');
select date_format(sysdate(),'%a');
select date_format(sysdate(),'%D');
select date_format(sysdate(),'%D of the %M %Y,%W') as Date;
#17th of the May 2023,Wednesday

select date_format(sysdate(),'%h:%i:%s %p');

#------------------group by having------------

create table cust_gh(
id int,fname varchar(20),lname varchar(20),age int,
country varchar(20)
);

insert into cust_gh values
(1,"John","Doe",31,"USA"),
(2,"Robert","Luna",22,"USA"),
(3,"David","Robin",22,"UK"),
(4,"John","Rain",25,"UK"),
(5,"Betty","Doe",28,"UAE"),
(6,"Alice","Wonderland",18,"USA"),
(7,"John","Wick",60,"UK"),
(8,"Andrew","Tate",45,"Romania"),
(9,"Elena","Calyas",28,"Romania"),
(10,"Ronaldo","Christiano",35,"UAE"),
(11,"Linoel","Messi",35,"Argentina"),
(12,"Kylian","Mbappe",23,"France");

select * from cust_gh;
select distinct(country) from cust_gh;

select * from cust_gh group by country;
select country,count(*) from cust_gh group by country;
select country from cust_gh 
group by country having avg(age)>25;
select *  from cust_gh 
group by country having age>avg(age);
select avg(age) from cust_gh;
select country,count(id) from cust_gh group by country
having avg(age)>31 and count(id)>2;
select country,count(id) from cust_gh
where country="UAE" group by country
having avg(age)>31 and count(id)=2;

select country,avg(age) from cust_gh 
where country like 'U%'
group by country
having avg(age)>23 order by avg(age);

#--------------------------------------------------------3-13------------

#---------------------------------------------------


# subqueries with select ,update ,delete and insert
#drop table employee_sq;
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
select * from employee_copy;

select max(emp_salary) from employee_sq;
select emp_dept from employee_sq where emp_salary=113000;
#select emp_dept from employee_sq where emp_salary=max(emp_salary);

select emp_dept from employee_sq where emp_salary=(select max(emp_salary) from employee_sq);

select * from employee_sq where emp_age>(select min(emp_age) from employee_sq);

select emp_id,emp_salary from employee_sq where emp_age >28;

update employee_sq set emp_salary=emp_salary+3000 where emp_id in(106,107,108,110);

select emp_id,emp_salary from employee_sq where emp_age >28;

update employee_sq set emp_salary=emp_salary+3000 where emp_id in
(select emp_id from employee_sq where emp_age >28);
select emp_id,emp_salary from employee_sq where emp_age >28;


update employee_sq set emp_salary=emp_salary+3000 where emp_id in
(select emp_id from employee_sq where emp_age >28);

update employee_sq set emp_salary=emp_salary+3000 where emp_id in
(select emp_id from employee_copy where emp_age >28);

select emp_salary from employee_sq where emp_age >28;
select emp_id from employee_copy where emp_age >28;
select * from employee_sq;
select * from employee_copy;
delete from employee_sq where emp_id in( select emp_id from employee_copy where emp_age>28);

select * from employee_sq;

create table products(prod_id int,prod_name varchar(20),prod_price int,prod_type varchar(20));
insert into products values(201,"Jewellery",1100,"Luxury"),(202,"Tshirt",300,"Non-Luxury"),
(203,"Laptop",1300,"Luxury"),(204,"Table",400,"Non-Luxury");
select * from products;

create table orders(id int,prod_sold varchar(20),selling_price int);

select prod_id from products where prod_price>1000;

insert into orders select prod_id,prod_name,prod_price from products 
where prod_id in (select prod_id from products where prod_price>1000);
select * from orders;

create table teacher(id int,age int);
insert into teacher values(1,43),(2,35),(3,33),(4,30);
select * from teacher;

create table student(sid int,sage int);
insert into student values(1,28),(2,30),(3,31),(4,27);

select age from teacher where age>all(select sage  from student);
select age from teacher where age>any(select sage  from student);

#------------------3-14-------------------------------------------------------

#--------joins--------------------------
create table employee_j(emp_no int primary key,emp_name varchar(20),emp_add varchar(20));
insert into employee_j values(1,"ram","delhi"),(2,"varun","chandigarh"),(3,"ravi","chandigarh"),(4,"amrit","delhi");

create table department_j(dept varchar(20),dept_name varchar(20),emp_no int,
foreign key(emp_no) references employee_j(emp_no));

insert into department_j values('d1',"HR",1),("d2","IT",2),("d3","Marketing",4);

#write a query to find dept_name of the department whose department is d3.
select dept_name from department_j where dept="d3";

select emp_add from employee_j where emp_name="varun";


#Write a query to find emp_name of a employee who is working in “HR” department?



select employee_j.emp_no,employee_j.emp_name,employee_j.emp_add,
department_j.dept,department_j.dept_name,department_j.emp_no 
from employee_j,department_j;


select employee_j.emp_no,employee_j.emp_name,employee_j.emp_add,
department_j.dept,department_j.dept_name,department_j.emp_no 
from employee_j cross join department_j;

select employee_j.emp_no,employee_j.emp_name,employee_j.emp_add,
department_j.dept,department_j.dept_name,department_j.emp_no 
from employee_j,department_j where employee_j.emp_no=department_j.emp_no ;

select employee_j.emp_no,employee_j.emp_name,employee_j.emp_add,
department_j.dept,department_j.dept_name,department_j.emp_no 
from employee_j natural join department_j;

select employee_j.emp_name
from employee_j,department_j where employee_j.emp_no=department_j.emp_no and department_j.dept_name="HR";


select employee_j.emp_no,employee_j.emp_name,employee_j.emp_add,
department_j.dept,department_j.dept_name,department_j.emp_no 
from employee_j left outer join department_j on employee_j.emp_no=department_j.emp_no ;

select employee_j.emp_no,employee_j.emp_name,employee_j.emp_add,
department_j.dept,department_j.dept_name,department_j.emp_no 
from employee_j right outer join department_j on employee_j.emp_no=department_j.emp_no ;
#full outer join
select * from employee_j
union all
select * from department_j;

select * from department_j
union all
select * from employee_j;

#self join
create table student_j
(s_id varchar(20),c_id varchar(20),from_year varchar(10));

insert into student_j values ("s1","c1","2016"),
("s2","c2","2017"),("s1","c2","2017");

select t1.s_id from student_j as t1,student_j as t2
where t1.s_id=t2.s_id and t1.c_id != t2.c_id;

#---------------------views-----

select * from employee_j;

create view emp_v as select emp_name,emp_add
from employee_j;
select * from emp_v;
