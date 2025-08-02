CREATE TABLE emp_details
    (
        id           int PRIMARY KEY,
        name         varchar(100),
        manager_id   int,
        salary       int,
        designation  varchar(100)
    );
INSERT INTO emp_details VALUES (1,  'Shripadh', NULL, 10000, 'CEO');
INSERT INTO emp_details VALUES (2,  'Satya', 5, 1400, 'Software Engineer');
INSERT INTO emp_details VALUES (3,  'Jia', 5, 500, 'Data Analyst');
INSERT INTO emp_details VALUES (4,  'David', 5, 1800, 'Data Scientist');
INSERT INTO emp_details VALUES (5,  'Michael', 7, 3000, 'Manager');
INSERT INTO emp_details VALUES (6,  'Arvind', 7, 2400, 'Architect');
INSERT INTO emp_details VALUES (7,  'Asha', 1, 4200, 'CTO');
INSERT INTO emp_details VALUES (8,  'Maryam', 1, 3500, 'Manager');
INSERT INTO emp_details VALUES (9,  'Reshma', 8, 2000, 'Business Analyst');
INSERT INTO emp_details VALUES (10, 'Akshay', 8, 2500, 'Java Developer');
commit;

SELECT * FROM emp_details;

----------------------------------------------------------------------------------------

--Question 1: Find the hierarchy of employees under a given manager "Asha".
--Solution:

with recursive cte as
	( 
	select * from emp_details 
	where name = 'Asha'
	union
	select e.*
	from cte 
	join emp_details e on e.manager_id = cte.id
	)
select *
from cte;

----------------------------------------------------------------------------------------

-- Question 2: Re-write above query to display only emp_id, emp_name and manager_name
--Solution:

with recursive cte as
	( 
	select emp.id as emp_id, emp.name as emp_name, mng.name as manager_name , 1 as iteration
	from emp_details emp
	join emp_details mng on emp.manager_id = mng.id
	where emp.name = 'Asha'
	union
	select e.id, e.name, cte.emp_name , (iteration+1) as iteration
	from cte 
	join emp_details e on e.manager_id = cte.emp_id
	)
select *
from cte;

----------------------------------------------------------------------------------------








