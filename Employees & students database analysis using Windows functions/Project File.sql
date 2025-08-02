create table employee
( emp_ID int
, emp_NAME varchar(50)
, DEPT_NAME varchar(50)
, SALARY int);

insert into employee values(101, 'Mohan', 'Admin', 4000);
insert into employee values(102, 'Rajkumar', 'HR', 3000);
insert into employee values(103, 'Akbar', 'IT', 4000);
insert into employee values(104, 'Dorvin', 'Finance', 6500);
insert into employee values(105, 'Rohit', 'HR', 3000);
insert into employee values(106, 'Rajesh',  'Finance', 5000);
insert into employee values(107, 'Preet', 'HR', 7000);
insert into employee values(108, 'Maryam', 'Admin', 4000);
insert into employee values(109, 'Sanjay', 'IT', 6500);
insert into employee values(110, 'Vasudha', 'IT', 7000);
insert into employee values(111, 'Melinda', 'IT', 8000);
insert into employee values(112, 'Komal', 'IT', 10000);
insert into employee values(113, 'Gautham', 'Admin', 2000);
insert into employee values(114, 'Manisha', 'HR', 3000);
insert into employee values(115, 'Chandni', 'IT', 4500);
insert into employee values(116, 'Satya', 'Finance', 6500);
insert into employee values(117, 'Adarsh', 'HR', 3500);
insert into employee values(118, 'Tejaswi', 'Finance', 5500);
insert into employee values(119, 'Cory', 'HR', 8000);
insert into employee values(120, 'Monica', 'Admin', 5000);
insert into employee values(121, 'Rosalin', 'IT', 6000);
insert into employee values(122, 'Ibrahim', 'IT', 8000);
insert into employee values(123, 'Vikram', 'IT', 8000);
insert into employee values(124, 'Dheeraj', 'IT', 11000);
COMMIT;

SELECT * FROM employee;

-----------------------------------------------------------------------------------------------------------

--Question 1: Fetch the first 2 employees from each department to join the company.

WITH CTE AS
(
SELECT *, row_number() over(partition by dept_name order by emp_id) as row_no  FROM employee
)
SELECT * FROM CTE 
WHERE row_no <=2;

------------------------------------------------------------------------------------------------------------

--Question 2: Fetch the top 3 employees in each department earning max salary.

WITH CTE AS
(
SELECT *, row_number() over(partition by dept_name order by salary desc) as row_num,
rank() over(partition by dept_name order by salary desc) as rnk
FROM employee
)
SELECT * FROM CTE 
WHERE rnk <=3


------------------------------------------------------------------------------------------------------------

-- UNDERSTANDING OF DENSE_RANK:

select * 
, row_number() over(partition by dept_name order by salary desc)  as rn
, rank() over(partition by dept_name order by salary desc)  as rnk
, dense_rank() over(partition by dept_name order by salary desc)  as dn_rnk
from employee

------------------------------------------------------------------------------------------------------------

--Question 3:
-- From the students table, write a SQL query to interchange the adjacent student names.
-- Note: If there are no adjacent students then the student name should stay the same.

create table students
    (
        id              int primary key,
        student_name    varchar(50) not null
    );
insert into students values
    (1, 'James'),
    (2, 'Michael'),
    (3, 'George'),
    (4, 'Stewart'),
    (5, 'Robin');

SELECT * FROM STUDENTS;

--Solution:
select *
, case when id%2 <> 0 
           then lead(student_name) over(order by id)
       else lag(student_name) over(order by id)
  end as new_student
from students;

------------------------------------------------------------------------------------------------------------






















