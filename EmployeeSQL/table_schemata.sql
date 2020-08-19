--Use the information you have to create a table schema for each of the six CSV files. Remember to specify data types, primary keys, foreign keys, and other constraints.
--Import each CSV file into the corresponding SQL table.
drop table Employees;
drop table Departments;
drop table Department_Employee;
drop table Department_Manager;
drop table Salaries;
drop table Titles;

CREATE TABLE Titles (
	title_id VARCHAR NOT NULL,
	title VARCHAR NOT NULL,
		PRIMARY KEY (title_id)
);
SELECT * FROM Titles;

CREATE TABLE Employees (
	emp_no INT NOT NULL,
	title_id VARCHAR NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	gender VARCHAR NOT NULL,
	hire_date DATE NOT NULL,
		PRIMARY KEY (emp_no),
		FOREIGN KEY (title_id) REFERENCES Titles(title_id)
);
SELECT * FROM Employees;

CREATE TABLE Departments (
	dept_no VARCHAR NOT NULL,
	dept_name VARCHAR NOT NULL,
		PRIMARY KEY (dept_no)
);
SELECT * FROM Departments

CREATE TABLE Department_employee (
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL,
		FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
		FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);
SELECT * FROM Department_employee;

CREATE TABLE Department_manager (
	dept_no VARCHAR NOT NULL,
	emp_no INT NOT NULL,
		FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
		FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);
SELECT * FROM Department_manager;

CREATE TABLE Salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
		FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);
SELECT * FROM Salaries;