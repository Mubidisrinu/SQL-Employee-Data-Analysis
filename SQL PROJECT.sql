CREATE DATABASE EmployeeDB;

USE EmployeeDB;
--- Create Department Table
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);
INSERT INTO Departments (department_id, department_name) VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance'),
(4, 'Sales'),
(5, 'Marketing'),
(6, 'Operations'),
(7, 'Support'),
(8, 'Research');

---  Create Employee Table
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10,2),
    FOREIGN KEY (department_id)
        REFERENCES Departments(department_id)
);
INSERT INTO Employees
(employee_id, employee_name, department_id, salary) VALUES
(101, 'Rahul', 1, 60000),
(102, 'Priya', 2, 45000),
(103, 'Arun', 1, 75000),
(104, 'Sneha', 3, 55000),
(105, 'Kiran', 4, 40000),
(106, 'Anjali', 1, 65000),
(107, 'Vijay', 3, 70000),
(108, 'Ravi', 4, 50000),
(109, 'Meena', 5, 48000),
(110, 'Suresh', 6, 52000),
(111, 'Divya', 1, 72000),
(112, 'Ramesh', 2, 47000),
(113, 'Pooja', 3, 68000),
(114, 'Naveen', 4, 43000),
(115, 'Swathi', 5, 51000),
(116, 'Mahesh', 6, 58000),
(117, 'Kavya', 7, 42000),
(118, 'Ajay', 8, 80000),
(119, 'Lakshmi', 1, 62000),
(120, 'Venkat', 4, 46000),

(121, 'Harish', 2, 49000),
(122, 'Neha', 5, 56000),
(123, 'Manoj', 6, 61000),
(124, 'Deepa', 7, 44000),
(125, 'Rohit', 8, 85000),
(126, 'Asha', 1, 67000),
(127, 'Karthik', 3, 59000),
(128, 'Swathi', 4, 53000),
(129, 'Gopal', 5, 47000),
(130, 'Bhanu', 6, 63000),

(131, 'Varun', 7, 45000),
(132, 'Isha', 8, 78000),
(133, 'Tarun', 1, 71000),
(134, 'Sanjay', 2, 52000),
(135, 'Keerthi', 3, 64000),
(136, 'Mohan', 4, 55000),
(137, 'Sowmya', 5, 60000),
(138, 'Prakash', 6, 57000),
(139, 'Nisha', 7, 41000),
(140, 'Aditya', 8, 90000),
(141, 'Rakesh', 1, 69000),
(142, 'Bhavana', 2, 46000),
(143, 'Chaitanya', 3, 73000),
(144, 'Lavanya', 4, 49000),
(145, 'Sandeep', 5, 54000),
(146, 'Madhavi', 6, 66000),
(147, 'Abhishek', 7, 48000),
(148, 'Teja', 8, 82000),
(149, 'Pavan', 1, 76000),
(150, 'Ramya', 5, 58000);
SELECT * FROM Employees;
SELECT * FROM Departments;
--- Find the highest salary.
SELECT MAX(salary) 
FROM Employees;
--- Find the lowest salary.
SELECT MIN(salary)
FROM Employees;
 --- Find the average salary.
 SELECT AVG(salary) 
 FROM Employees;
 --- Find total salary.
 SELECT SUM(salary)
 FROM Employees;
 --- Count employees.
 SELECT COUNT(*) 
 FROM Employees;
--- Find the number of employees in each department. 
SELECT department_id,COUNT(*) 
FROM Employees
GROUP BY department_id;
--- Find the average salary of each department.
SELECT department_id,AVG(salary)
FROM Employees
GROUP BY department_id;
---  Find departments having more than 5 employees.
SELECT department_id,COUNT(*) as employee_count
FROM Employees
GROUP BY department_id
HAVING COUNT(*)>5;
--- Display employee name and department name.
SELECT Employee_name e,department_name d
FROM departments d
JOIN Employees e ON e.department_id = d.department_id; 
--- Find employees earning more than the average salary.
SELECT Employee_name,salary
FROM Employees
WHERE salary>(SELECT AVG(salary) FROM Employees);
--- Find the employee with the highest salary.
SELECT Employee_name,salary
FROM Employees
WHERE salary=(SELECT MAX(salary) FROM Employees);
--- Find employees earning more than Rahul.
SELECT employee_name, salary
FROM Employees
WHERE salary > (
    SELECT salary
    FROM Employees
    WHERE employee_name = 'Rahul'
);
--- Find the second-highest salary.
SELECT MAX(salary) as second_highest 
FROM Employees
WHERE salary<(SELECT MAX(salary) FROM Employees);
--- Find the top 5 salaries.
SELECT salary FROM Employees
ORDER BY salary DESC
LIMIT 5;
--- Find employees whose salary is between ₹50,000 and ₹70,000.
SELECT Employee_name,salary FROM Employees
WHERE salary BETWEEN 50000 and 70000;
--- Find employees from the IT department.
SELECT Employee_name e FROM Employees e 
JOIN departments d ON e.department_id = d.department_id
WHERE department_name='IT';