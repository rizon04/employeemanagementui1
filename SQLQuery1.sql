--create database test1
--use test1

create table EmployeeDetail(
employeeID int primary key identity(1,1) not null,
lastname varchar(30) not null,
firstname varchar(30) not null,
middlename varchar(30) not null,
DoB date not null,
gender varchar(30) not null,
position varchar(30) not null,
[status] varchar(30) not null
)



create table EmployeeEmail(
emailID int primary key identity(1,1),
email varchar(100) not null,
employeeID int, 
foreign key (employeeID) references EmployeeDetail(employeeID)
)

create table EmployeePhone(
phoneID int primary key identity(1,1) not null,
employeeID int,
phoneNum varchar(30),
foreign key (employeeID) references EmployeeDetail(employeeID)
)

create table Account(
accountID int primary key identity(1,1),
username varchar(30) not null,
[password] varchar(30) not null,
employeeID int, foreign key(employeeID) references EmployeeDetail(employeeID)
)



insert into EmployeeDetail values ('Rizon','Lorenz', 'Taborada', '1996-09-28', 'Lesbian', 'Manager', 'Active')
declare @newemployeeID int;
set @newemployeeID = SCOPE_IDENTITY();
select @newemployeeID as scope

select * from EmployeeDetail


insert into Account (username, [password],employeeID) values ('lorenz','bayotko',@newemployeeID)

drop table account
drop table EmployeePhone
drop table EmployeeEmail
drop table EmployeeDetail
