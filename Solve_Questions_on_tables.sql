--3. Rename the Hire Date column from HireDate to Hire_Date on the Employees table.

EXEC sp_rename 'dbo.Employees.HireDate', 'Hire_Date', 'COLUMN';

 --ERROR
 --Object 'dbo.Employees.HireDate' cannot be renamed because the object participates in enforced dependencies.

select o.name as ObjName, r.name as ReferencedObj
from sys.sql_dependencies d
join sys.objects o on o.object_id=d.object_id
join sys.objects r on r.object_id=d.referenced_major_id
where d.class=1
AND r.name = 'Employees'  --CK__Employees__HireD__1A14E395 dependencies

ALTER TABLE dbo.Employees
    DROP CONSTRAINT CK__Employees__HireD__1A14E395
EXEC sp_rename 'dbo.Employees.HireDate', 'Hire_Date', 'COLUMN';

ALTER TABLE dbo.Employees
ADD CONSTRAINT CK__Employees__HireD__1A14E395 CHECK( Hire_Date > '2000-01-01')

--4. Write a SQL statement to add a new attribute (home_phone_number) to the Employees
--table where NULL value is not allowed and has a fixed size of 10 digits. 

ALTER TABLE Employees
ADD homePhoneNumber INT 

ALTER TABLE Employees
ADD CONSTRAINT CK__Employees_homePhoneNumberNT0 DEFAULT (0) FOR homePhoneNumber; 

ALTER TABLE Employees
ADD CONSTRAINT CK__Employees_homePhoneNumber Check (len(homePhoneNumber) = 10);

Update Employees
SET homePhoneNumber = '12345678900'
where EmployeeID = 1
--ERROR:--The conversion of the varchar value '12345678900' overflowed an int column.

--5. Write a SQL statement to update at least one employee's department to IT(feel free to
--decide which employee or all employees). Don't forget to update the updated timestamp.

--I am going to change the department of EMployee ID =6  from SUPPORT to IT

		Update d set d.DepartName='IT',UpdatedDate = GETDATE()
		--select e.EmployeeID,e.DepartID,d.DepartName 
		from dbo.Employees e 
		join dbo.Departs d ON d.DepartID = e.DepartID
		where e.EmployeeID=6



--6. Write a SQL statement to double the salary of all employees in the 'IT' department and
--add extra 8000 to the bonus. Don't forget to update the updated timestamp. 

					
		update ch SET Salary= Salary *2, Bonus= Bonus+ 8000
		--select e.FirstName,e.LastName,e.DepartID,d.DepartName ,ch.Salary,ch.Bonus
		from dbo.Employees e 
		join dbo.Departs d ON d.DepartID = e.DepartID
		join dbo.CompensationHistory ch ON e.EmployeeID = ch.EmployeeID
		where d.DepartName='IT'



		
--7. Write a SQL statement to find all employee id(without duplicated employee ids) who
--have received one time cash rewards greater than 1000. 

--Result only 3 rows will come because employeeID 2 has 2 reward row so i will take it latest one 
--So the resulatant will receive only 3 rows of all different employee

select a.EmployeeID,a.RewardAmount,a.FirstName,a.LastName from 
(select  ROW_NUMBER() over (PARTITION BY cr.EmployeeID ORDER BY cr.RewardDate DESC ) as rownum 
,cr.EmployeeID,cr.RewardAmount,e.FirstName,e.LastName,cr.RewardDate from Employees e 
join CashRewards cr on e.EmployeeID=cr.EmployeeID
where cr.RewardAmount >1000 )a
where a.rownum = 1


--8. Write a SQL statement to find all employees who have a phone number and belong to
--the 'IT' department. 

select e.EmployeeID,e.FirstName,e.LastName,d.DepartName,e.PhoneNumber from Employees e 
join Departs d on d.DepartID=e.DepartID
where d.DepartName = 'IT'


--9. Write an SQL query to delete the compensation records with a bonus less than 8000. 

		Delete  ch
		--select * 
		from dbo.CompensationHistory ch where ch.Bonus< 8000

--10.  Write a SQL query to find the highest compensation
--(salary + bonus) for each department and order the results by the total compensation in
--descending order.


	select a.FirstName,a.LastName,a.EmployeeID,a.DepartName,a.rn --(findout the highest compensation department wise)
	from   
	(
		select Rank() over (PARTITION BY a.DepartName order by total_compensation desc) rn ,a.*	
		from (
				select e.FirstName,e.LastName,e.EmployeeID,d.DepartName,
				(ch.Salary+ch.Bonus) as total_compensation from Employees e 
				join CompensationHistory ch on e.EmployeeID = ch.EmployeeID
				join Departs d on d.DepartID= e.DepartID 
			)a
	)a
	where rn=1
