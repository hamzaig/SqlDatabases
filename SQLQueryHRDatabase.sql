CREATE DATABASE HR

CREATE TABLE regions
(
	region_id INT PRIMARY KEY,
	Region_name VARCHAR(25)
)

CREATE TABLE countries
(
	country_id VARCHAR(10) PRIMARY KEY,
	country_name VARCHAR(25),
	region_id INT,
	FOREIGN KEY (region_id) REFERENCES regions(region_id)
)

CREATE TABLE locations
(
	location_id int primary key,
	street_address VARCHAR(125),
	postel_code VARCHAR(10),
	city varchar(25),
	state_province VARCHAR(25),
	country_id VARCHAR(10),
	FOREIGN KEY(country_id) REFERENCES countries(country_id)
)

CREATE TABLE departments
(
	department_id INT PRIMARY KEY,
	department_name VARCHAR(25),
	manager_id int,
	location_id int,
	FOREIGN KEY(location_id) REFERENCES locations(location_id)
)



CREATE TABLE JOB
(
	job_id VARCHAR(10) PRIMARY KEY,
	job_title VARCHAR(25),
	Min_salary INT,
	Max_salary INT
)

CREATE TABLE Managers
(
	Manager_id VARCHAR(10) PRIMARY KEY,
	first_name VARCHAR(25),
	last_name VARCHAR(25),
	email VARCHAR(25),
	phone_number VARCHAR(25),
	hire_date INT,
	job_id VARCHAR(10) ,
	salary INT,
	FOREIGN KEY(job_id) REFERENCES JOB(job_id)
)





CREATE TABLE Employees
(
	employee_id VARCHAR(10) PRIMARY KEY,
	first_name VARCHAR(25),
	last_name VARCHAR(25),
	email VARCHAR(25),
	phone_number VARCHAR(25),
	hire_date DATE,
	job_id VARCHAR(10),
	salary INT,
	commission INT,
	manager_id VARCHAR(10),
	department_id INT,
	FOREIGN KEY(job_id) REFERENCES JOB(job_id),
	FOREIGN KEY(manager_id) REFERENCES Managers(manager_id),
	FOREIGN KEY(department_id) REFERENCES departments(department_id)
)

CREATE TABLE job_history
(
	employee_id VARCHAR(10) ,
	Start_date DATE,
	End_date DATE,
	job_id VARCHAR(10),
	department_id INT,
	PRIMARY KEY(employee_id,Start_date),
	FOREIGN KEY(employee_id) REFERENCES employees(employee_id),
	FOREIGN KEY(job_id) REFERENCES job(job_id),
	FOREIGN KEY(department_id) REFERENCES departments(department_id),
)

CREATE TABLE job_grades
(
	Grade_level INT PRIMARY KEY,
	lowest_sale INT,
	Highest_sale INT,
)