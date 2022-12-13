use Exceliq;

--create Customer
create table customer(cust_id int,cust_name varchar(30) not null,city varchar(30),grade int,salesman_id int)
insert into customer values(3002,'Nick Rimando','New York',100,5001),
						   (3007,'Brad Davis','New York',200,5001),
						   (3005,'Graham Zusi','California',200,5002),
						   (3008,'Julian Green','London',300,5002),
						   (3004,'Fabian Johnson','Paris',300,5006),
						   (3009,'Geoff Cameron','Berlin',100,5003),
						   (3003,'Jozy Altidor','Moscow',200,5007),
						   (3001,'Brad Guzan','London',null,5005)

alter table customer add constraint pp primary key (cust_name);

--create Orders
create table orders(ord_no int not null,purch_amt money,ord_date date,cust_id int,salesman_id int)
insert into orders values(70001,150.5,'2012-10-5',3005,5002),
						 (70009,270.65,'2012-09-10',3001,5005),
						 (70002,65.26,'2012-10-5',3002,5001),
						 (70004,110.5,'2012-08-17',3009,5003),
						 (70007,948.5,'2012-09-10',3005,5002),
						 (70005,2400.6,'2012-07-27',3007,5001),
						 (70008,5760,'2012-09-10',3002,5001),
						 (70010,1983.43,'2012-10-10',3004,5006),
						 (70003,2480.4,'2012-10-10',3009,5003),
						 (70012,250.45,'2012-06-27',3008,5002),
						 (70011,75.29,'2012-08-17',3003,5007),
						 (70013,3045.6,'2012-04-25',3002,5001)

alter table orders add constraint wp primary key (ord_no);


--create Salesman 
create table salesman(names varchar(30) not null,city varchar(30),commission money,salesman_id int)
insert into salesman values('James Hoo','New York',0.15,5001),
							('Nail Knite','Paris',0.13,5002),
							('Lauson Hen','San Jose',0.12,5003),
							('Pit Alex','London',0.11,5005),
							('Mc Lyon','Paris',0.14,5006),
							('Paul Adam','Rome',0.13,5007)

alter table salesman add constraint pr primary key (names);

select * from salesman;
select * from customer;
select * from orders;

--Write a SQL statement to make a list for the salesmen who either work for one or more customers or yet to join any of the customer. 
--The customer, may have placed, either one or more orders on or above order amount 2000 and must have a grade, 
--or he may not have placed any order to the associated supplier.

-- create procedure

alter proc saless
@names varchar(20),@city varchar(20),@cust_name varchar(20),@ord_no int,@ord_date date,@purch_amt money ,@grade int
as 
begin
begin transaction 
if exists (select * from new_tb where ord_no=@ord_no)
update sales set salesman=@names where ord_no=@ord_no
else 
insert into sales(Salesman,city,cust_name,ord_no,ord_date,purch_amt,grade)
values (@names,@city,@cust_name,@ord_no,@ord_date,@purch_amt,@grade)
commit 
end 

-- create table to add data
create table Sales (Salesman varchar(30)foreign key references salesman(Names),city varchar(20),cust_name varchar(30)foreign key references customer(cust_Name),
ord_no int foreign key references orders(ord_no),ord_date date,purch_amt money,grade int,time datetime default(current_timestamp));


select *from sales;

--run procedure
exec saless 'james hoog','new york','nick rimando',70008,'2012-09-10',5760,100 

drop  table sales