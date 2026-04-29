-- Create Database Company2;
-- Use Company2;

CREATE TABLE employees (
EMPNO INTEGER PRIMARY KEY,
ENAME varchar(255) NOT NULL,
JOB varchar(255) NOT NULL,
MGR INTEGER,
HIREDATE date NOT NULL,
Salary INTEGER NOT NULL,
COMM varchar(255),
DEPTNO INTEGER NOT NULL);

INSERT INTO employees
VALUES (7369, 'SMITH', 'CLERK', 7902, '1980/12/17', 800, NULL, 20),
(7499, 'ALLEN', 'SALESMAN', 7698, '1981/02/20', 1600, 300, 30),
(7521, 'WARD', 'SALESMAN', 7698, '1981/02/22', 1250, 500, 30),
(7566, 'JONES', 'MANAGER', 7839, '1980/08/02', 2975, NULL, 20),
(7654, 'MARTIN', 'SALESMAN', 7698, '1981/09/28', 1250, 1400, 30),
(7698, 'BLAKE', 'MANAGER', 7839, '1981/05/01', 2850, NULL, 30),
(7782, 'CLARK', 'MANAGER', 7839, '1981/06/09', 2450, NULL, 20),
(7788, 'SCOTT', 'ANALYST', 7566, '1982/12/09', 3100, NULL, 30),
(7839, 'KING', 'PRESIDENT',NULL , '1981/11/17', 5000, NULL, 10),
(7844, 'TURNER', 'SALESMAN', 7698, '1981/09/08', 1500, 0, 30),
(7876, 'ADAMS', 'CLERK', 7788, '1983/01/12', 1100, NULL, 20),
(7900, 'JAMES', 'CLERK', 7698, '1981/12/03', 950, NULL, 30),
(7902, 'FORD', 'ANALYST', 7566, '1981/12/03', 3000, NULL, 20),
(7934, 'MILLER', 'CLERK', 7782, '1983/01/23', 1300, NULL, 20);

CREATE TABLE depts (
DEPTNO INTEGER PRIMARY KEY,
DNAME varchar(255) NOT NULL,
Location varchar(255) NOT NULL);

INSERT INTO depts
VALUES (10, 'accounting', 'New York'),
(20, 'research', 'Dallas'),
(30, 'sales', 'Chicago'),
(40, 'operations', 'Boston');

-- Display all the information of the EMP table
Select * From Employees;

-- Display unique Jobs from EMP table
Select Distinct Job From Employees;

-- List the emps in the asc order of their Salaries
Select Ename, Salary From Employees Order BY Salary ASC;

-- List the details of the emps in asc order of the Dptnos and desc of Jobs
Select Ename,Deptno,Job From Employees Order By Deptno ASC,Job DESC;

-- Display all the unique job groups in the descending order
Select Distinct Job From Employees Order By Job DESC;

-- Display all the details of all ‘Mgrs’
Select * From Employees Where Job = "Manager";

-- List the emps who joined before 1981.
Select Ename, Hiredate From Employees Where Year(Hiredate) < 1981;

-- List the Empno, Ename, Sal, Daily sal of all emps in the asc order of Annualsal
Select Empno,Ename,Salary, Salary/30 AS Daily_Salary, Salary*12 As Annual_Salary From Employees Order By Annual_Salary ASC;

-- Display the Empno, Ename, job, Hiredate, Exp of all Mgrs
Select Empno, Ename, job, Hiredate, 2025 - year(Hiredate) AS Year_OF_Experience From Employees Where Job ="Manager";

-- List the Empno, Ename, Sal, Exp of all emps working for Mgr 7698.
Select Empno, Ename, Salary, 2025 - Year(Hiredate) AS Year_of_Experience From Employees Where Mgr = 7698;

-- Display all the details of the emps whose Comm. Is more than their Sal.
Select * From Employees Where Comm IS NOT NULL And Comm > Salary;

-- List the emps who are either ‘CLERK’ or ‘ANALYST’ in the Desc order
Select * From Employees Where Job In ("Clerk","Analyst") Order BY Job Desc; 

-- List the emps in the asc order of Designations of those joined after the second half of 1981
Select * From Employees Where Hiredate > '1981-06-30' Order BY job ASC;

-- List the emps who joined on 1-MAY-81,3-DEC-81,17-DEC-81,19-JAN80 in asc order of seniority.
Select * From Employees Where hiredate IN ('1981-05-01', '1981-12-03', '1980-12-17', '1980-01-19') ORDER BY hiredate ASC;

-- List the emp who are working for the Deptno 10 or20
Select * From Employees Where Deptno In (10,20);

-- List the emps who are joined in the year 81
Select * From Employees Where Year(Hiredate) = 1981;

-- List the emps who are joined in the month of Aug 1980.
Select * From Employees Where Year(Hiredate) = 1980 And Month(Hiredate) = 8;

-- List the emps Who Annual sal ranging from 22000 and 45000.
Select *, (Salary*12) As Annual_Salary From Employees Where (Salary*12) Between 22000 And 45000;

-- List the Enames those are having five characters in their Names.
Select Ename From employees Where Ename Like '_____';

-- List the Enames those are starting with ‘S’ and with five characters.
Select Ename From Employees Where Ename Like 'S____';

-- List the emps those are having four chars and third character must be ‘r’.
Select Ename From Employees Where Ename Like '__r_';

-- List the Five character names starting with ‘S’ and ending with ‘H’.
Select Ename From Employees Where Ename Like 'S___H';

-- List the emps who joined in January
Select Ename From Employees Where Month(Hiredate) = 1;

-- List the emps who joined in the month of which second character is ‘a’.
Select Ename From Employees Where Monthname(Hiredate) Like '_a%';

-- List the emps whose Sal is four digit number ending with Zero.
Select Ename,Salary From Employees Where Salary Between 1000 And 9999 And Salary Like '%0';

-- List the emps whose names having a character set ‘ll’ together
Select Ename From Employees Where Ename Like '%ll%';

-- List the emps those who joined in 80’s.
Select Ename From Employees Where Year(Hiredate) = 1980;

-- List the emps who does not belong to Deptno 20
Select Ename , Deptno From Employees Where Deptno <> 20;

-- List all the emps except ‘PRESIDENT’ & ‘MGR” in asc order of Salaries.
Select * From Employees Where Job NOT IN ('President','Mgr') Order By Salary ASC;

-- List all the emps who joined before or after 1981.
Select Ename From Employees Where Year(Hiredate) <> 1981;

-- List the emps whose Empno not starting with digit78.
Select Ename, Empno From Employees Where Empno NOT LIKE '%78';

-- List the emps who are working under ‘MGR’.
Select Ename From Employees Where Mgr IS NOT NULL;

-- List the emps who joined in any year but not belongs to the month of March
Select Ename From Employees Where Month(Hiredate) <> 3;

-- List all the Clerks of Deptno 20
Select Ename From Employees Where Job ='Clerk' And Deptno = 20;

-- List the emps of Deptno 30 or 10 joined in the year 1981
Select * From Employees Where Deptno IN (10,30) And Year(Hiredate) = 1981;

-- Display the details of SMITH
Select * From Employees Where Ename = "Smith";

-- Display the location of SMITH.
Select D.Location  From Depts D Inner Join Employees E ON D.Deptno = E.Deptno Where E.Ename = "Smith";

-- List the total information of EMP table along with DNAME and Loc
Select E.*,D.Dname, D.Location From Employees E Inner Join Depts D ON E.Deptno = D.Deptno;

-- List the Empno, Ename, Sal, Dname of all the ‘MGRS’ and ‘RESEARCH’ working in New York, Dallas with an exp more than 7 years without receiving the Comm asc order of Loc
Select E.Empno, E.Ename, E.Salary, D.Dname FROM Employees E Inner Join Depts D ON E.Deptno = D.Deptno 
Where E.Job = 'MANAGER' And D.Dname = 'research' And D.Location IN ('New York', 'Dallas') And (YEAR(CURDATE()) - YEAR(E.Hiredate)) > 7
AND E.Comm IS NULL ORDER BY D.Location ASC;

-- Display the Empno, Ename, Sal, Dname, Loc, Deptno, Job of all emps working at CJICAGO or working for ACCOUNTING dept with Ann Sal>28000, but the Sal should not
-- be=3000 or 2800 who doesn’t belongs to the Mgr and whose no is having a digit ‘7’ or ‘8’ in 3rd position in the asc order of Deptno and desc order of job.
SELECT E.Empno, E.Ename, E.Salary, D.Dname, D.Location, E.Deptno, E.job FROM Employees E
JOIN Depts D ON E.Deptno = D.Deptno WHERE (d.location = 'Chicago' OR d.dname = 'accounting')
AND (e.salary*12) > 28000 AND e.salary NOT IN (3000, 2800) AND e.job <> 'MANAGER' AND (e.empno LIKE '__7%' OR e.empno LIKE '__8%')
ORDER BY e.deptno ASC, e.job DESC;



