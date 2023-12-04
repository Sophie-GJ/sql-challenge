--create and define new tables

CREATE TABLE Departments (
    dept_no INT NOT NULL,
    dept_name VARCHAR(30) NOT NULL,
	PRIMARY KEY (dept_no)
);

CREATE TABLE Titles (
    title_id INTEGER NOT NULL,
	title VARCHAR(30) NOT NULL,
	PRIMARY KEY (title_id)
);

CREATE TABLE All_Employees (
    emp_no INT NOT NULL,
	emp_title_id INTEGER NOT NULL,
	birth_date date NOT NULL,
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	sex VARCHAR(30),
	hire_date date NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY(emp_title_id) REFERENCES Titles (title_id)
);

CREATE TABLE Managers_Dept (
    id SERIAL NOT NULL,
	dept_no INT NOT NULL,
	emp_no INT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY(dept_no) REFERENCES Departments (dept_no),
	FOREIGN KEY(emp_no) REFERENCES All_Employees (emp_no)
);

CREATE TABLE Dept_Employees (
    id SERIAL NOT NULL,
	emp_no INT NOT NULL,
	dept_no INT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY(dept_no) REFERENCES Departments (dept_no),
	FOREIGN KEY(emp_no) REFERENCES All_Employees (emp_no)
);

CREATE TABLE Salaries (
    id SERIAL NOT NULL,
	emp_no INTEGER NOT NULL,
	salary INTEGER NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY(emp_no) REFERENCES All_Employees (emp_no)
);

--list ALL EMPLOYEES: emp_no, last_name, first_name, sex, salary 

--list EMPLOYEES HIRED IN 1986: first_name, last_name, hire_date

--list MANAGERS ONLY: dept_no, dept_name, emp_no, last_name, first_name

--list ALL EMPLOYESS: dept_no, emp_no, last_name, first_name, dept_name

--list FOR HERCULES B___: first_name, last_name, sex

--list SALES DEPARTMENT: dept_name, emp_no, last_name, first_name

--list SALES AND DEVELOPMENT DEPARTMENTS: dept_name, emp_no, last_name, first_name

--list FREQUENCY COUNTS (descending order) of ALL LAST NAMES