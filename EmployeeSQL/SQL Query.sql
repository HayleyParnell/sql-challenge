--1. List the employee number, last name, first name, sex, and salary of each employee.
Select e.emp_no,
	   e.last_name, 
	   e.first_name,
	   e.sex, 
	   s.salary 
from public."Salaries" as s
JOIN public."Employees" as e
ON s.emp_no = e.emp_no;

--2. List the first name, last name, and hire date for the employees who were hired in 1986.
Select first_name, 
	   last_name, 
	   hire_date
from public."Employees" as e
WHERE hire_date = to_date('1986', 'yyyy');

--3. List the manager of each department along with their department number, 
--department name, employee number, 
--last name, and first name.
SELECT d.dept_no AS Department_Number,
       d.dept_name AS Department_Name,
       e.emp_no AS Employee_Number,
       e.last_name AS Last_Name,
       e.first_name AS First_Name
FROM public."Departments" d
JOIN public."Dept_Mang" dm ON d.dept_no = dm.dept_no
JOIN public."Employees" e ON dm.emp_no = e.emp_no;

--4.List the department number for each employee along with that employee’s employee number, last name, 
--first name, and department name.
SELECT e.emp_no AS Employee_Number,
       e.last_name AS Last_Name,
       e.first_name AS First_Name,
       d.dept_no AS Department_Number,
       d.dept_name AS Department_Name
FROM public."Employees" e
JOIN public."Dept_Emp" de ON e.emp_no = de.emp_no
JOIN public."Departments" d ON de.dept_no = d.dept_no;

--5.List first name, last name, and sex of each employee whose first name is Hercules and whose last name 
--begins with the letter B.
SELECT first_name AS First_Name,
	   last_name AS Last_Name,
	   sex AS Sex
FROM public."Employees"
WHERE first_name = 'Hercules' 
AND last_name LIKE 'B%';

--6.List each employee in the Sales department, including their employee number, last name, and first name
SELECT e.emp_no AS Employee_Number,
	   e.Last_name as Last_Name,
	   e.first_name AS First_Name
FROM public."Employees" e
JOIN public."Dept_Emp" de ON e.emp_no = de.emp_no
JOIN public."Departments" d ON de.dept_no = d.dept_no
WHERE de.dept_no = 'd007';


--7.List each employee in the Sales and Development departments, including their employee number, 
--last name, first name, and department name.
SELECT e.emp_no AS Employee_Number,
	   e.Last_name as Last_Name,
	   e.first_name AS First_Name
FROM public."Employees" e
JOIN public."Dept_Emp" de ON e.emp_no = de.emp_no
JOIN public."Departments" d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');

--8.List the frequency counts, in descending order, of all the employee last names 
--(that is, how many employees share each last name).
SELECT last_name, COUNT(*) AS Employee_Count
From public."Employees"
GROUP BY last_name
ORDER BY Employee_Count DESC;




