--create and define new tables
--DROP TABLE Salaries;
--DROP TABLE Managers_Dept;
--DROP TABLE Dept_Employees;
--DROP TABLE All_Employees;
--DROP TABLE Titles;
--DROP TABLE Departments;

--Create tables
CREATE TABLE Departments (
    dept_no VARCHAR(15) NOT NULL,
    dept_name VARCHAR(30) NOT NULL,
	PRIMARY KEY (dept_no)
);

CREATE TABLE Titles (
    title_id VARCHAR(15) NOT NULL,
	title VARCHAR(30) NOT NULL,
	PRIMARY KEY (title_id)
);

CREATE TABLE All_Employees (
    emp_no VARCHAR(15) NOT NULL,
	emp_title_id VARCHAR(15) NOT NULL,
	birth_date date NOT NULL,
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	sex VARCHAR(30),
	hire_date date NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY(emp_title_id) REFERENCES Titles (title_id)
);

CREATE TABLE Managers_Dept (
    dept_no VARCHAR(15) NOT NULL,
	emp_no VARCHAR(15) NOT NULL,
	--find a way to add ID row?
	--id SERIAL NOT NULL,
	--PRIMARY KEY (id),
	FOREIGN KEY(dept_no) REFERENCES Departments (dept_no),
	FOREIGN KEY(emp_no) REFERENCES All_Employees (emp_no)
);

CREATE TABLE Dept_Employees (
    --id SERIAL NOT NULL,
	emp_no VARCHAR(15) NOT NULL,
	dept_no VARCHAR(15) NOT NULL,
	--PRIMARY KEY (id),
	FOREIGN KEY(dept_no) REFERENCES Departments (dept_no),
	FOREIGN KEY(emp_no) REFERENCES All_Employees (emp_no)
);

CREATE TABLE Salaries (
    --id SERIAL NOT NULL,
	emp_no VARCHAR(15) NOT NULL,
	salary INTEGER NOT NULL,
	--PRIMARY KEY (id),
	FOREIGN KEY(emp_no) REFERENCES All_Employees (emp_no)
);


--list ALL EMPLOYEES: emp_no, last_name, first_name, sex, salary 
SELECT ae.emp_no, 
	ae.last_name, 
	ae.first_name,
	ae.sex,
	salaries.salary
FROM All_Employees as ae
INNER JOIN salaries ON
ae.emp_no = salaries.emp_no;

--list EMPLOYEES HIRED IN 1986: first_name, last_name, hire_date
SELECT first_name,
last_name,
hire_date
FROM All_Employees
WHERE DATE_PART('Year', hire_date) = 1986;

--list MANAGERS ONLY: dept_no, dept_name, emp_no, last_name, first_name
SELECT 	managers_dept.dept_no, 
	departments.dept_name,
	managers_dept.emp_no, 
	all_employees.last_name, 
	all_employees.first_name
FROM ((Managers_Dept
	  INNER JOIN Departments ON
	  	Managers_Dept.dept_no = Departments.dept_no)
	  INNER JOIN All_Employees ON
	  	Managers_Dept.emp_no = All_Employees.emp_no);
	  	
--list ALL EMPLOYESS: dept_no, emp_no, last_name, first_name, dept_name
SELECT dept_employees.dept_no, 
	dept_employees.emp_no, 
	all_employees.last_name, 
	all_employees.first_name,
	departments.dept_name
FROM ((Dept_employees
	  INNER JOIN Departments ON
	  	dept_employees.dept_no = Departments.dept_no)
	  INNER JOIN All_Employees ON
	  	dept_employees.emp_no = All_Employees.emp_no);

--list FOR HERCULES B___: first_name, last_name, sex
SELECT first_name,
last_name,
sex
FROM All_Employees as ae
WHERE ae.last_name LIKE 'B%'
AND ae.first_name = 'Hercules';

--list SALES DEPARTMENT: dept_name, emp_no, last_name, first_name

SELECT departments.dept_name,
	dept_employees.emp_no, 
	all_employees.last_name, 
	all_employees.first_name
FROM ((Dept_employees
	  INNER JOIN Departments ON
	  	dept_employees.dept_no = Departments.dept_no)
	  INNER JOIN All_Employees ON
	  	dept_employees.emp_no = All_Employees.emp_no)
WHERE departments.dept_name = 'Sales';

--list SALES AND DEVELOPMENT DEPARTMENTS: dept_name, emp_no, last_name, first_name

SELECT departments.dept_name,
	dept_employees.emp_no, 
	all_employees.last_name, 
	all_employees.first_name
FROM ((Dept_employees
	  INNER JOIN Departments ON
	  	dept_employees.dept_no = Departments.dept_no)
	  INNER JOIN All_Employees ON
	  	dept_employees.emp_no = All_Employees.emp_no)
WHERE departments.dept_name = 'Sales'
OR departments.dept_name = 'Development';

--list FREQUENCY COUNTS (descending order) of ALL LAST NAMES

SELECT last_name, COUNT(last_name) AS "name frequency"
FROM All_employees
GROUP BY last_name
ORDER BY "name frequency" DESC;