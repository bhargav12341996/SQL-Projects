
create table paintings
(
    id              int,
    name            varchar(40),
    artist_id       int,
    listed_price    float
);

create table artists
(
    id              int,
    first_name      varchar(40),
    last_name       varchar(40)
);

create table collectors
(
    id              int,
    first_name      varchar(40),
    last_name       varchar(40)
);

create table sales
(
    id                  int,
    sale_date           date,
    painting_id         int,
    artist_id           int,
    collector_id        int,
    sales_price         float
);


insert into paintings values (11,'Miracle',1,300);
insert into paintings values (12,'Sunshine',1,700);
insert into paintings values (13,'Pretty woman',2,2800);
insert into paintings values (14,'Handsome man',2,2300);
insert into paintings values (15,'Barbie',3,250);
insert into paintings values (16,'Cool painting',3,5000);
insert into paintings values (17,'Black square #1000',3,50);
insert into paintings values (18,'Mountains',4,1300);

insert into artists values (1,'Thomas','Black');
insert into artists values (2,'Kate','Smith');
insert into artists values (3,'Natali','Wein');
insert into artists values (4,'Francesco','Benelli');

insert into collectors values (101,'Brandon','Cooper');
insert into collectors values (102,'Laura','Fisher');
insert into collectors values (103,'Christina','Buffet');
insert into collectors values (104,'Steve','Stevenson');

insert into sales values (1001,'2021-11-01',13,2,104,2500);
insert into sales values (1002,'2021-11-10',14,2,102,2300);
insert into sales values (1003,'2021-11-10',11,1,102,300);
insert into sales values (1004,'2021-11-15',16,3,103,4000);
insert into sales values (1005,'2021-11-22',15,3,103,200);
insert into sales values (1006,'2021-11-22',17,3,103,50);

select * from paintings;
select * from artists;
select * from collectors;
select * from sales;

1) Fetch paintings that are priced higher than the average painting price.

select * -- Outer Query / Main query
from paintings
where listed_price > (select avg(listed_price) from paintings);

--------------------------------------------------------------------------------------------

2) Fetch all collectors who purchased paintings.
-- solution using subqeury
select * 
from collectors c
where c.id in (select distinct collector_id from sales);

-- solution using JOINS
select distinct c.*
from collectors c
join sales s on s.collector_id = c.id;

--------------------------------------------------------------------------------------------

3) Fetch the total amount of sales for each artist who has sold at least one painting.
Display artist name and total sales amount


--Using JOINS
select (a.first_name||' '||a.last_name) as artist_name
, sum(sales_price) as total_sales_amt
from sales s
join artists a on a.id = s.artist_id
group by artist_name;

--------------------------------------------------------------------------------------------

4) Find the names of the artists who had zero sales.

--Using Sub-Query
select (a.first_name||' '||a.last_name) as artist_name, a.id
from artists a
where a.id not in (select s.artist_id
				  from sales s);

--------------------------------------------------------------------------------------------

5) Write a query to identify the duplicate artists.
--- Let's first insert duplicate records with different id
    insert into artists values (5,'Kate','Smith');
    insert into artists values (6,'Natali','Wein');
	
	-- Most common interview question:
	-- How do you remove duplicate data from a table?
	
	1) Identify the duplicate data
	2) Once identified, then redelete move the duplicate data.
	
	select * from artists;
	
	select first_name, last_name, count(1)
	from artists 
	group by first_name, last_name
	having count(1)>1;
	
-- Wrong way of deleting duplicate data. (delete all duplicate without even having the original record)
delete from artists 
where (first_name, last_name) in (select first_name, last_name
									from artists 
									group by first_name, last_name
									having count(1)>1);
	
insert into artists values (2,'Kate','Smith');
insert into artists values (3,'Natali','Wein');
insert into artists values (5,'Kate','Smith');
insert into artists values (6,'Natali','Wein');
	
select * from artists;
	
select max(id)
from artists 
group by first_name, last_name
having count(1)>1;

-- Method 1: Works when there is single duplicate record but not when there are multiple duplicates
	delete from artists 
	where id in (select max(id) -- This subquery returns duplicate records
				from artists 
				group by first_name, last_name
				having count(1)>1);
	

-- Method 2: This works even when there are multiple duplicate records
insert into artists values (5,'Kate','Smith');
insert into artists values (6,'Natali','Wein');
insert into artists values (7,'Kate','Smith');
insert into artists values (8,'Natali','Wein');
	
	select * from artists;
	
	delete from artists 
	where id not in (select min(id) -- This subquery returns all unique records
					from artists 
					group by first_name, last_name);

-- Method 3: When there is huge dataset
	select * from artists;

	create table artists_bkp 
	as
	select min(id) as id, first_name, last_name
	from artists 
	group by first_name, last_name;
	
	select * from artists_bkp;

---------------------------------------------------------------------------------------------










