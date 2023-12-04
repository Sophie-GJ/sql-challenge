--create and define new tables

CREATE TABLE Departments (
    dept_no INT PK NOT NULL,
    dept_name VARCHAR(30) NOT NULL,
);

CREATE TABLE Titles (
    title_id INT PK NOT NULL,
	title VARCHAR(30) NOT NULL,
);

CREATE TABLE Managers_Dept (
    id PK SERIAL NOT NULL,
	dept_no INT NOT NULL,
	emp_no INT NOT NULL,
	FOREIGN KEY(dept_no) REFERENCES Departments (dept_no),
	FOREIGN KEY(emp_no) REFERENCES All_Employees
);

CREATE TABLE Dept_Employees (
    Member_ID INTEGER   NOT NULL,
    Gym_ID INTEGER   NOT NULL,
    Trainer_ID INTEGER   NOT NULL,
    First_Name VARCHAR   NOT NULL,
    Last_Name VARCHAR   NOT NULL,
    Address VARCHAR   NOT NULL,
    CITY VARCHAR   NOT NULL,
    PRIMARY KEY (Member_ID)
    FOREIGN KEY(Gym_ID) REFERENCES Gym (Gym_ID);
    FOREIGN KEY(Trainer_ID) REFERENCES Trainers (Trainer_ID);
);

CREATE TABLE All_Employees (
    Payment_ID INTEGER   NOT NULL,
    Member_ID INTEGER   NOT NULL,
    CreditCard_Info INTEGER   NOT NULL,
    Billing_Zip INTEGER   NOT NULL,
    PRIMARY KEY (Payment_ID)
    FOREIGN KEY(Member_ID) REFERENCES Members (Member_ID);
);

CREATE TABLE Salaries (
    Payment_ID INTEGER   NOT NULL,
    Member_ID INTEGER   NOT NULL,
    CreditCard_Info INTEGER   NOT NULL,
    Billing_Zip INTEGER   NOT NULL,
    PRIMARY KEY (Payment_ID)
    FOREIGN KEY(Member_ID) REFERENCES Members (Member_ID);
);

--list ALL EMPLOYEES: emp_no, last_name, first_name, sex, salary 

--list EMPLOYEES HIRED IN 1986: first_name, last_name, hire_date

--list MANAGERS ONLY: dept_no, dept_name, emp_no, last_name, first_name

--list ALL EMPLOYESS: dept_no, emp_no, last_name, first_name, dept_name

--list FOR HERCULES B___: first_name, last_name, sex

--list SALES DEPARTMENT: dept_name, emp_no, last_name, first_name

--list SALES AND DEVELOPMENT DEPARTMENTS: dept_name, emp_no, last_name, first_name

--list FREQUENCY COUNTS (descending order) of ALL LAST NAMES