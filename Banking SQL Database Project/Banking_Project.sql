CREATE DATABASE BANKING;

create table products
(
	prod_id		varchar(10) primary key,
	prod_name	varchar(100) not null
);

create table Employees
(
	Emp_ID		varchar(10),
	Emp_Name	varchar(100),
	Salary		float,
	gender		varchar(10) check (gender in ('M', 'F')),
	constraint pk_emp primary key (emp_id)
);

create table Customers
(
	Customer_ID		varchar(10),
	First_Name		varchar(40),
	Last_Name		varchar(40),
	Phone			bigint,
	Address			varchar(200),
	dob				date,
	constraint pk_cust primary key(customer_id)
);

create table Accounts
(
	Account_No			bigint primary key,
	Balance				int,
	Account_Status		varchar(10) check (Account_Status in ('Active', 'Inactive', 'Suspended', 'On hold')),
	Date_of_Opening		date
);

create table Transactions
(
	Transaction_ID		int generated always as identity,
	Transaction_Date	date,
	Transaction_amount	float,
	Credit_Debit_flag	varchar(1),
	Account_No			bigint,
	constraint fk_acc foreign key (Account_No) references Accounts(Account_No)
);

create table Customer_Accounts
(
	Customer_ID		varchar(10),
	Account_No		bigint,
	prod_id			varchar(10),
	constraint fk_acc1 foreign key (Customer_ID) references Customers(Customer_ID),
	constraint fk_acc2 foreign key (Account_No) references Accounts(Account_No),
	constraint fk_acc3 foreign key (prod_id) references Products(prod_id)
);


insert into products values ('PRD0001', 'Savings Account');
insert into products (prod_id, prod_name) values ('PRD0002', 'Current Account');
insert into products values ('PRD0003', 'Home Loan');
insert into products values ('PRD0004', 'Personal Loan');

insert into Employees values
	('E1', 'Mohan Kumar', 5000, 'M'),
	('E2', 'James Bond', 6000, 'M'),
	('E3', 'David Smith', 7000, 'M'),
	('E4', 'Alice Mathew', 5000, 'F');

insert into Customers values ('C1', 'Satya', 'Sharma', 9900889911, 'Bangalore', to_date('01-03-1990', 'dd-mm-yyyy'));
insert into Customers values ('C2', 'Jaswinder', 'Singh', 9900889922, 'Mumbai', to_date('024-03-1980', 'dd-mm-yyyy'));
insert into Customers values ('C3', 'Satya', 'Sharma', 9900889933, 'Pune', to_date('11-08-1992', 'dd-mm-yyyy'));
insert into Customers values ('C4', 'Maryam', 'Parveen', 9900889944, 'Delhi', to_date('01-12-1993', 'dd-mm-yyyy'));
insert into Customers values ('C5', 'Steven', 'Smith', null, 'Chennai', to_date('20-12-1994', 'dd-mm-yyyy'));
insert into Customers values ('C6', 'Jason', 'Holder', null, 'Chennai', to_date('01-02-1995', 'dd-mm-yyyy'));

insert into Accounts values (1100444101, 100, 'Active', to_date('01-01-2020','dd-mm-yyyy'));
insert into Accounts values (1100444102, 900, 'Active', to_date('10-01-2020','dd-mm-yyyy'));
insert into Accounts values (1100444103, 500, 'Active', to_date('21-11-2021','dd-mm-yyyy'));
insert into Accounts values (1100444104, 1100, 'Active', to_date('15-10-2022','dd-mm-yyyy'));
insert into Accounts values (1100444105, 2200, 'Active', to_date('10-12-2022','dd-mm-yyyy'));
insert into Accounts values (1100444106, 3300, 'Active', to_date('05-11-2022','dd-mm-yyyy'));

insert into Transactions values (default,current_date, 200, 'C', 1100444101);
insert into Transactions (Transaction_Date, Transaction_Amount, Credit_Debit_flag, Account_No) values (current_date-1, 100, 'C', 1100444101);
insert into Transactions (Transaction_Date, Transaction_Amount, Credit_Debit_flag, Account_No) values (current_date-1, 50, 'D', 1100444101);
insert into Transactions (Transaction_Date, Transaction_Amount, Credit_Debit_flag, Account_No) values (current_date-1, 100, 'C', 1100444102);
insert into Transactions (Transaction_Date, Transaction_Amount, Credit_Debit_flag, Account_No) values (current_date-2, 200, 'C', 1100444102);
insert into Transactions (Transaction_Date, Transaction_Amount, Credit_Debit_flag, Account_No) values (current_date-2, 100, 'D', 1100444102);
insert into Transactions (Transaction_Date, Transaction_Amount, Credit_Debit_flag, Account_No) values (current_date-3, 100, 'C', 1100444103);
insert into Transactions (Transaction_Date, Transaction_Amount, Credit_Debit_flag, Account_No) values (current_date-4, 200, 'C', 1100444104);
insert into Transactions (Transaction_Date, Transaction_Amount, Credit_Debit_flag, Account_No) values (current_date-5, 100, 'C', 1100444105);
insert into Transactions (Transaction_Date, Transaction_Amount, Credit_Debit_flag, Account_No) values (current_date-5, 200, 'D', 1100444105);

insert into Customer_Accounts values ('C1', 1100444101, 'PRD0001');
insert into Customer_Accounts values ('C1', 1100444102, 'PRD0003');
insert into Customer_Accounts values ('C1', 1100444103, 'PRD0004');
insert into Customer_Accounts values ('C2', 1100444105, 'PRD0002');
insert into Customer_Accounts values ('C3', 1100444106, 'PRD0002');
insert into Customer_Accounts values ('C1', 1100444104, 'PRD0004');


select * from products;
select * from Employees;
select * from Customers;
select * from Accounts;
select * from Transactions;
select * from Customer_Accounts;

---(1) fetch the transaction id, date, and amount of all debit transaction
select 
transaction_id,
transaction_date,
transaction_amount,
credit_debit_flag
from transactions
where credit_debit_flag = 'D'

---(2) fetch male employees who earn more than 5000 salary

select 
emp_name
from employees
where salary > 5000 and gender = 'M';


---(3) fetch employess starts with j or whose salary >= 70k
select 
emp_name
from employees
where (salary >=70000) or (lower(emp_name)  like 'j%')

----(4) fetch accounts with  balance in btw 1k and 3k

select 
account_no
from accounts
where balance between 1000 and 3000


----(5) find customers who did not provide a phone number 
select 
customer_id
from customers
where phone  is null;

----(6) find all the different products available
select 
distinct prod_name
from products;




---(7) sort all active accounts based on highest balance and on earliest opening date 

select
*
from accounts
where account_status = 'Active'
order by balance desc , date_of_opening 


---(8) five oldest transactions
select
*
from Transactions 
order by transaction_date 
limit 5 


---(9) find customers who are either from Bangalore or Chennai and their phone number is available or those who 
---were born before 1990

select
*
from customers
where (address in ('Bangalore' , 'Chennai')
and phone is not null) 
or ( dob <'1990-01-01')

---(10) total no of transactions in feb 2023

select 
count(transaction_id)
from transactions
where transaction_date between '2023-02-01' and '2023-02-28'



select * from products;
select * from Employees;
select * from Customers;
select * from Accounts;
select * from Transactions;
select * from Customer_Accounts;

---(11) find total number of products purchased by customer Satya Shamra 

select 
count(1)
from customer_accounts ca 
join customers c 
on ca.customer_id=c.customer_id
where c.first_name = 'Satya' and c.last_name = 'Sharma'


---(12) display full names of customers and employees 

select 
'employee' as type ,
emp_name from Employees
 union all 
 select
 'customer' as type ,
 first_name ||' '|| last_name from customers ;


---(13) catogorise accounts based on there balance 
---(bleow 1k is low balance, between 1k and 2k is average balance, above 2k is high balance)

select 
* ,
(case when balance < 1000 then 'low balance' 
	when balance between   1000 and 2000 then 'average balance'
	else 'high balance' end) as balance_type
from accounts;

----(14) find total balance of all savings account 

select 
sum(ac.balance)
from accounts ac
join Customer_Accounts ca
on ca.account_no = ac.account_no
join products pr
on ca.prod_id = pr.prod_id
where pr.prod_name = 'Savings Account'


----(14)find total balance of all savings account and current account 

select 
'Savings Account' as type ,
sum(ac.balance) as  sum_of_savings
from accounts ac
join Customer_Accounts ca
on ca.account_no = ac.account_no
join products pr
on ca.prod_id = pr.prod_id
where pr.prod_name = 'Savings Account'
union all 
select 
'Current Account' as type, 
sum(ac.balance) as  sum_of_curret
from accounts ac
join Customer_Accounts ca
on ca.account_no = ac.account_no
join products pr
on ca.prod_id = pr.prod_id
where pr.prod_name = 'Current Account';





























































