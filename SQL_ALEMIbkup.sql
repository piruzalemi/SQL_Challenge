Piruz Alemi - Stop.

--------------------------------------------------------------------------------
--		           Table #1 Dept-Employees
-------------------------------------------------------------------------------
DROP TABLE DepartEmployee;
CREATE TABLE DepartEmployees (
	emp_no int not null,
    dept_no char(6) NOT NULL,
	from_date DATE,
	to_date DATE,
    PRIMARY KEY (emp_no, dept_no)
);
SELECT * from DepartEmployees

---------------------------------------------------------------------------
--                   Table #2 Dept-Name
--------------------------------------------------------------------------
DROP TABLE Departments;
CREATE TABLE Departments (
    dept_no char(6) NOT NULL,
    dept_name varchar(255) NOT NULL,
    PRIMARY KEY (dept_no)
);
SELECT * from Departments



--------------------------------------------------------------------------
--                    Table #3 Dept-Managers: empl No. & Dates
--------------------------------------------------------------------------
DROP TABLE Dept_manager cascade;
CREATE TABLE Dept_manager (
	dept_no CHAR(6) NOT NULL,
    empl_no INT NOT NULL,
	from_date DATE,
	to_date DATE,
    CONSTRAINT dept_empl_dates PRIMARY KEY(dept_no,empl_no)
);
SELECT * from Dept_manager
select count(*) from Dept_Manager

-------------------------------------------------------------------------
--                     Table #4 Employees, No. & Names
------------------------------------------------------------------------
DROP TABLE employee;
CREATE TABLE employee (
    emp_no INT NOT Null,
    birth_date DATE,
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	gender CHAR(1),
	hire_date Date,
	PRIMARY KEY (emp_no)
--    CONSTRAINT empldept PRIMARY KEY  (empl_no, dept_no)
);
SELECT * FROM employee
----------------------------------------------------------------------------------------
--                        Table #5 . Employees Salaries
----------------------------------------------------------------------------------------
DROP TABLE EmplSalary;
CREATE TABLE EmplSalary (
    emp_no INT,
	salary INT,
	from_date DATE,
	to_date DATE,
 	PRIMARY KEY (emp_no)
);
SELECT * from EmplSalary
------------------------------------------------------------------------------------------
--                           Table #6 Emplyees Titles
------------------------------------------------------------------------------------------
DROP TABLE Titles;
CREATE TABLE Titles (
    emp_no int NOT NULL,
	title VARCHAR(30) NOT NULL,
	from_date DATE,
	to_date DATE
--  PRIMARY KEY (emp_no) could not be unique as an emp_no has different titles in a diff period
);
SELECT * from Titles
---------------------------------------------------------------------------------------
--                   Report #1: Create a Report of Employee Salaries 
-----------------------------------------------------------------------------------------
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.emp_no, s.salary
FROM employee AS e
  JOIN EmplSalary AS s
  ON (e.emp_no = s.emp_no);
--      GROUP BY s.emp_NO, e.first_name;
------------------------------------------------------------------------------------------
select * from EmplSalary
-----------------------------------------------------------------------------------------
--                   Report #2: List of Employees who started in 1986 
-----------------------------------------------------------------------------------------
SELECT s.from_date, e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employee AS e
  JOIN EmplSalary AS s
  ON (e.emp_no = s.emp_no)
  where s.from_date >= DATE '1986-01-01' and
  		s.from_date < DATE '1987-01-01';

-----------------------------------------------------------------------------------------
--                   Report #3: List of Managers by Dept with Start and End Dates. 
-----------------------------------------------------------------------------------------
SELECT  e.last_name, e.first_name,
  		d.dept_no, d.dept_name,
	    m.empl_no, m.from_date, m.to_date	 	   
FROM dept_manager AS m
 	JOIN departments AS d ON (d.dept_no = m.dept_no)
	JOIN employee AS e ON (e.emp_no = m.empl_no);
---------------------------------------------------------------------------------------------
--                  Report #4: department of each employee 
--       1.	employee number, last name, first name, and department name.
---------------------------------------------------------------------------------------------
SELECT  d1.emp_no, 
		e.last_name, e.first_name,
  		d2.dept_name
FROM departemployees AS d1
		JOIN employee AS e ON (e.emp_no = d1.emp_no)
		JOIN departments AS d2 ON (d1.dept_no = d2.dept_no);
----------------------------------------------------------------------------------------------	
select count(*) from departments --> 9
select count(*) from dept_manager --> 24
select count(*) from emplSalary  --> 300,024
select count(*) from employee  --> 300,024
select count(*) from titles  --> 443,308: empl_no + Title + from/to Dates
select count(*) from departemployees --> 331,603
------------------------------------------------------------------------------------------------
--                  Report #5: List all employees whose first name is "Hercules" 
--                                 and last names begin with "B."
--
------------------------------------------------------------------------------------------------
SELECT  first_name, last_name, substring(last_name,1,1) as xstring
		from employee
		WHERE first_name = 'Hercules' and
		substring(last_name,1,1) = 'B';  -- does not work with xstring! It works with substring
-------------------------------------------------------------------------------------------------
--                   Report #6.	List all employees in the Sales department
-------------------------------------------------------------------------------------------------
SELECT  d1.emp_no, 
		e.last_name, e.first_name,
  		d2.dept_name
FROM departemployees AS d1
		JOIN employee AS e ON (e.emp_no = d1.emp_no)
		JOIN departments AS d2 ON (d1.dept_no = d2.dept_no)
		where substring(dept_name,1,5) = 'Sales';
-------------------------------------------------------------------------------------------------
--    7.	List all employees in the Sales and Development departments, including:
-------------------------------------------------------------------------------------------------
SELECT  d1.emp_no, 
		e.last_name, e.first_name,
  		d2.dept_name
FROM departemployees AS d1
		JOIN employee AS e ON (e.emp_no = d1.emp_no)
		JOIN departments AS d2 ON (d1.dept_no = d2.dept_no)
		where substring(dept_name,1,5) = 'Sales' or
		substring(dept_name,1,11) = 'Development';
--------------------------------------------------------------------------------------------------
--    8.	In descending order, list the frequency count of
--          employee last names, i.e., how many employees share each last name.
-------------------------------------------------------------------------------------------------
SELECT last_name, count(*)
FROM employee
GROUP by last_name
ORDER by count(*) Desc; 
-------------------------------------------------------------------------------------------------
--      1.	Import the SQL database into Pandas. 
--   	2.	from sqlalchemy import create_engine
--		3.	engine = create_engine('postgresql://localhost:5432/<your_db_name>')
-- 			connection = engine.connect()
--		•	Consult SQLAlchemy documentation:
-- 			https://docs.sqlalchemy.org/en/13/core/engines.html#postgresql
-------------------------------------------------------------------------------------------------
-- Import SQL Alchemy
-- from sqlalchemy import create_engine
-------------------------------------------------------------------------------------------------
-- 2.	Create a histogram to visualize the most common salary ranges for employees.
-- 3.	Create a bar chart of average salary by title.
-------------------------------------------------------------------------------------------------
--  
-------------------------------------------------------------------------------------------------
select * from emplsalary






