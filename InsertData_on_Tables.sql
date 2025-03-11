use Demo_Assignment

-- Insert sample data into Departments table

INSERT INTO Departs (DepartName, [Location], Province)VALUES ('Finance', 'Vancouver', 'BC');
INSERT INTO Departs (DepartName, [Location], Province)VALUES ('IT', 'Montreal', 'QC');
INSERT INTO Departs (DepartName, [Location], Province)VALUES ('Sales', 'Calgary', 'AB');
INSERT INTO Departs (DepartName, [Location], Province)VALUES ('Marketing', 'Winnipeg', 'MB');
INSERT INTO Departs (DepartName, [Location], Province)VALUES ('Operations', 'Fredericton', 'NB');
INSERT INTO Departs (DepartName, [Location], Province)VALUES ('Support', 'Ottawa', 'ON');
INSERT INTO Departs (DepartName, [Location], Province)VALUES ('Legal', 'Victoria', 'BC');
INSERT INTO Departs (DepartName, [Location], Province)VALUES ('Engineering', 'Edmonton', 'AB');
INSERT INTO Departs (DepartName, [Location], Province)VALUES ('Admin', 'Halifax', 'ON');


-- Insert sample data into Employees table
INSERT INTO Employees (FirstName, LastName, Email,PhoneNumber, HireDate, DepartID) 
VALUES ('John', 'Doe','john.doe@example.com', '1234567890',  '2020-06-15', 1);
INSERT INTO Employees (FirstName, LastName, Email,PhoneNumber, HireDate, DepartID)
VALUES ('Jane', 'Smith','jane.smith@example.com', '2345678901',  '2019-08-23', 2);
INSERT INTO Employees (FirstName, LastName, Email,PhoneNumber, HireDate, DepartID) 
VALUES ('Alice', 'Brown','alice.brown@example.com', '3456789012',  '2018-07-10', 3);
INSERT INTO Employees (FirstName, LastName, Email,PhoneNumber, HireDate, DepartID) 
VALUES ('Bob', 'Johnson','bob.johnson@example.com', '4567890123',  '2021-09-12', 4);
INSERT INTO Employees (FirstName, LastName, Email,PhoneNumber, HireDate, DepartID) 
VALUES ('Charlie', 'White','charlie.white@example.com', '5678901234',  '2017-05-30', 5);
INSERT INTO Employees (FirstName, LastName, Email,PhoneNumber, HireDate, DepartID) 
VALUES ('David', 'Lee','david.lee@example.com', '6789012345',  '2016-11-20', 6);
INSERT INTO Employees (FirstName, LastName, Email,PhoneNumber, HireDate, DepartID) 
VALUES ('Eve', 'Miller','eve.miller@example.com', '7890123456',  '2022-01-15', 7);
INSERT INTO Employees (FirstName, LastName, Email,PhoneNumber, HireDate, DepartID) 
VALUES ('Frank', 'Davis','frank.davis@example.com', '8901234567',  '2015-03-25', 8);
INSERT INTO Employees (FirstName, LastName, Email,PhoneNumber, HireDate, DepartID) 
VALUES ('Grace', 'Wilson','grace.wilson@example.com', '9012345678',  '2023-04-18', 9);
INSERT INTO Employees (FirstName, LastName, Email,PhoneNumber, HireDate, DepartID) 
VALUES ('Hank', 'Thomas','hank.thomas@example.com', '0123456789',  '2014-12-05', 3);

-- Insert sample data into Compensation History table
INSERT INTO CompensationHistory (EmployeeID,CompensationDate, Salary, bonus) VALUES (1,  '2022-12-15', 90000, 5000);
INSERT INTO CompensationHistory (EmployeeID,CompensationDate, Salary, bonus) VALUES (2,  '2023-01-20', 75000, 6000);
INSERT INTO CompensationHistory (EmployeeID,CompensationDate, Salary, bonus) VALUES (3,  '2022-12-15', 2000, 1000);
INSERT INTO CompensationHistory (EmployeeID,CompensationDate, Salary, bonus) VALUES (4,  '2023-01-20', 95000, 9800);
INSERT INTO CompensationHistory (EmployeeID,CompensationDate, Salary, bonus) VALUES (6,  '2021-11-20', 60000, 4500);


-- Insert sample data into Cash Rewards table

INSERT INTO CashRewards (EmployeeID,RewardDate, RewardAmount ) VALUES (1,  '2022-03-15',2000);
INSERT INTO CashRewards (EmployeeID,RewardDate, RewardAmount ) VALUES (2,  '2022-04-20',4000);
INSERT INTO CashRewards (EmployeeID,RewardDate, RewardAmount ) VALUES (3,  '2021-12-15',500);
INSERT INTO CashRewards (EmployeeID,RewardDate, RewardAmount ) VALUES (2,  '2023-01-20', 600);