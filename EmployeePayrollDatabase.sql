CREATE DATABASE PayrollDB;
USE PayrollDB;

CREATE TABLE Employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

CREATE TABLE Payroll (
    id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    bonus DECIMAL(10,2),
    deduction DECIMAL(10,2),
    FOREIGN KEY (employee_id) REFERENCES Employees(id)
);

INSERT INTO Employees (name, department, salary)
VALUES ('Anjali', 'IT', 30000),
       ('Rahul', 'HR', 25000),
       ('Priya', 'Finance', 35000);

INSERT INTO Payroll (employee_id, bonus, deduction)
VALUES (1, 3000, 1000),
       (2, 2000, 500),
       (3, 4000, 1000);

SELECT * FROM Employees;
SELECT * FROM Payroll;

SELECT e.name, e.department, e.salary,
       p.bonus, p.deduction
FROM Employees e
JOIN Payroll p ON e.id = p.employee_id;

SELECT e.name,
       (e.salary + p.bonus - p.deduction)
       AS net_salary
FROM Employees e
JOIN Payroll p ON e.id = p.employee_id;

SELECT department, AVG(salary) AS average_salary
FROM Employees
GROUP BY department;

SELECT * FROM Employees
ORDER BY salary DESC;