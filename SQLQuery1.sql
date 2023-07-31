create database ExerciseDb
use ExerciseDb

create table Student(
Sid int primary key,
SName nvarchar(50),SEmail nvarchar(50),
SContact nvarchar(10) 
)
insert into Student(Sid,SName,SEmail,SContact) values
(1,'John','john@gamil.com','8399349854'),
(2,'Srajan','sr@gmail.com','4657983000'),
(3,'Sr','rs@gmail.com','3293848458')

create table Fee(
Sid int,SFee decimal(8,2),SMonth int,SYear int,
primary key (Sid,SMonth,SYear),
foreign key (Sid) references Student(Sid)
)
insert into Fee(Sid,SFee,SMonth,SYear) values
(1,1000.00,7,2023),(2,1100.00,7,2023),
(3,1050.00,7,2023)

create table PayConfirmation(
Sid int, Name nvarchar(50), Email nvarchar(50),Fee decimal(8,2),PaidOnDate date)

create trigger insertInfo
on Fee
after insert
as
declare @id int
declare @fee decimal(8,2)
declare @name nvarchar(50)
declare @email nvarchar(50)
select @id = Sid from inserted
select @fee = SFee from inserted
begin
select @name = S.SName,@email = S.SEmail
from Student s
Where S.Sid=@id

insert into PayConfirmation(Sid,Name,Email,Fee,PaidOnDate)
values(@id , @name , @email , @fee,GETDATE())
print'Fees Submitted'
end
select * from PayConfirmation
select * from Fee
insert into Fee values(1,700.00,8,2022)

drop table Student
drop table Fee
drop table PayConfirmation
drop trigger insertInfo





