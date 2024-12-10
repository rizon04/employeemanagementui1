--create database test5
--use test5

create table EmployeeDetail(
EmployeeID int primary key identity(1,1) not null,
Lastname varchar(30) not null,
Firstname varchar(30) not null,
Middlename varchar(30) not null,
DoB date not null,
PhoneNumber varchar(30) not null,
Gender varchar(30) not null,
Email varchar(30) not null,
Position varchar(30) not null,
[Status] varchar(30) null default 'Active'
)

create table Account(
AccountID int primary key identity(1,1),
Username varchar(30) not null,
[Password] varchar(30) not null,
EmployeeID int, foreign key(employeeID) references EmployeeDetail(employeeID)
)

create table Attendance(
AttendanceID int primary key identity(1,1)not null,
EmployeeID int, foreign key(EmployeeID) references EmployeeDetail(employeeID),
TimeIn TIME null,
[TimeOut] TIME null,
TotalHours Decimal(5,2),
[Date] Date not null 
)

create table Salary(
SalaryID int primary key identity(1,1),
EmployeeID int,
HourlyRate decimal(5,2),
HoursWorked decimal(5,2),
TotalSalary decimal(5,2),
foreign key(EmployeeID) references EmployeeDetail(EmployeeID)
)

drop table EmployeeDetail
drop table account
drop table Attendance
drop table Salary






update EmployeeDetail
set Status = '-'
where EmployeeID in (1,2,3,4)






insert into EmployeeDetail (Lastname, Firstname, Middlename, DoB, PhoneNumber, Gender, Email, Position) values ('Rizon','Lorenz', 'Taborada', '1996-09-28','09123456789' ,'Male','lorenzrizon@gmail.com', 'Manager')
select * from EmployeeDetail

declare @newemployeeID int;
set @newemployeeID = SCOPE_IDENTITY();

insert into Account (username, [password],employeeID) values ('lorenz','bayotko',@newemployeeID)
select * from Account

insert into Salary (employeeID, HourlyRate) values (1,15.00)
select * from Salary

insert into Attendance ( EmployeeID,TimeIn, [Date]) values (1,'09:24:00','')
select * from Attendance

update Attendance
set TimeIn = '1:22:00'
where EmployeeID = 4

insert into Attendance (EmployeeID,TimeIn,[Date]) values (4,'1:00:00','2024-12-11') 
insert into Attendance (EmployeeID,TimeIn,[Date]) values (4,'1:00:00','2024-12-12') 
insert into Attendance (EmployeeID,TimeIn,[Date]) values (4,'1:00:00','2024-12-13') 
select * from Attendance


dbcc checkident ('EmployeeDetail',RESEED)
dbcc checkident ('Account',RESEED)
delete from account
where employeeID in (1)

delete from EmployeeDetail
where employeeID in (2)

	


	DECLARE @maxEmployeeID INT;
    DECLARE @maxAccountID INT;

	-- Get the maximum employeeID from EmployeeDetail
    SELECT @maxEmployeeID = ISNULL(MAX(employeeID), 0) FROM EmployeeDetail;

    -- Get the maximum accountID from Account
    SELECT @maxAccountID = ISNULL(MAX(accountID), 0) FROM Account;

	dbcc checkident ('Account',RESEED,@maxAccountID)
	dbcc checkident ('EmployeeDetail',RESEED, @maxEmployeeID)

	dbcc checkident ('Account',RESEED,@maxAccountID)
	dbcc checkident ('EmployeeDetail',RESEED, @maxEmployeeID)

	

insert into Attendance(TimeIn, [Date])
values (GETDATE(), GETDATE())

SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Salary';

update Account
set Password = 'lorenz'
where EmployeeID = 1

select * from Salary

select * from EmployeeDetail

select * from Account

select * from Attendance

create table sisi(
getTime Time
)

Delete from Attendance
where AttendanceID = 1


--rename later
--exec sp_renamedb test5, EmployeeManagement



select * from EmployeeDetail

delete from Salary
where SalaryID in (0)

delete from Attendance
where AttendanceID = 4

delete from EmployeeDetail
where EmployeeID = 2

delete from Account
where AccountID = 3

Update Attendance
set TimeIn = GETDATE()
where EmployeeID = 5


	dbcc checkident ('Attendance',RESEED, 1)

	dbcc checkident ('Account',RESEED,0)
	dbcc checkident ('EmployeeDetail',RESEED, 0)
	dbcc checkident ('Attendance',RESEED, 0)
	dbcc checkident ('Salary',RESEED,0)


	dbcc checkident ('Attendance',RESEED,@maxAccountID)
	dbcc checkident ('EmployeeDetail',RESEED, @maxEmployeeID)

	

