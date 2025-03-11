USe Demo_Assignment

 Create Table dbo.Departs
(
	DepartID	INT IDENTITY(1, 1) PRIMARY KEY,
	DepartName	VARCHAR(50) NOT NULL,
	[Location]	VARCHAR(50),
	Province	VARCHAR(50) DEFAULT 'ON'  CHECK (Province in ('ON', 'BC', 'QC', 'AB', 'MB', 'NB')),
	CreatedDate	DATE default getdate(),
	UpdatedDate  DATE
	
	);
Create Table dbo.Employees 
(
	EmployeeID	INT IDENTITY(1,1) PRIMARY KEY,
	FirstName	VARCHAR(50) NOT NULL,
	LastName	VARCHAR(50) NOT NULL,
	Email		VARCHAR(100) NOT NULL UNIQUE,
	PhoneNumber VARCHAR(15),
	HireDate	DATE CHECK( HireDate > '2000-01-01'),
	DepartID	INT NOT NULL, 
	CreatedDate	DATE default getdate(),
	UpdatedDate DATE
	 
	CONSTRAINT FK_DepartID_Department FOREIGN KEY (DepartID)
    REFERENCES Dbo.Departs(DepartID)
	);

	Drop INdex FK_EmployeeID_Employees on CompensationHistory
Create Table dbo.CompensationHistory
(
	CompID INT IDENTITY(1, 1) PRIMARY KeY,
	EmployeeID INT,
	CompensationDate DATE NOT NULL,
	Salary DECIMAL(10,2) CHECK (Salary>0), 
	Bonus DECIMAL(10,2),
	CreatedDate DATE DEFAULT getdate(),
	UpdatedDate  DATE

		CONSTRAINT FK_EmployeeID_Employees FOREIGN KEY (EmployeeID)
        REFERENCES Dbo.Employees(EmployeeID),
		
		CONSTRAINT FK_Bonus CHECK (Bonus<Salary)
	
);

Create Table dbo.CashRewards
(
	RewardID INT IDENTITY(1, 1) PRIMARY KEY,
	EmployeeID INT,
	RewardDate DATE NOT NULL,
	RewardAmount DECIMAL(10,2) NOT NULL, 
	CreatedDate DATE DEFAULT getdate(),
	UpdatedDate  DATE

	 CONSTRAINT FK_EmployeeID_EmployeesCashRewards FOREIGN KEY (EmployeeID)
        REFERENCES Dbo.Employees(EmployeeID)
	
);







