create database CourseDatabase
use CourseDatabase
create table Students(
  [Id] int primary key identity(1,2),
  [Name]nvarchar(50),
  [Surname]nvarchar(50),
  [Age] int,
)
insert into Students([Name],[Surname],[Age])
values('Ilqar','Shiriyev',26),
      ('Reshad','Aghayev',21),
      ('Kamran','Muradov',24),
      ('Hacixan','Hacixanov',19),
      ('Zeyqem','Ashurov',39)

select * from Students
truncate table Students

alter table Students
add SoftDeleted bit default 0

select * from Students where [SoftDeleted]='true'

update Students
set [SoftDeleted]=1
where [Id]>2

create table  Countries(
[Id]int primary key identity(1,1),
[Name]nvarchar(50)
)
create table  Cities(
[Id]int primary key identity(1,1),
[Name]nvarchar(50),
[CountryId] int,
 foreign key ([CountryId]) references Countries(Id) 
)
 select * from Cities

 insert into Countries([Name])
 values('Azerbaycan'),
       ('Turkiye'),
	   ('Ingiltere'),
	   ('Almaniya'),
	   ('Suriya'),
	   ('Ukranya'),
	   ('Rusiya')

 insert into Cities([Name],[CountryId])
 values('Baki',1),
       ('Gence',2),
	   ('Zaqatala',1),
	   ('Istanbul',2),
	   ('Bursa',2),
	   ('London',3)

select * from Cities

select * from Cities where[CountryId]=1

create table Books(
[Id]int primary key identity(1,1),
[Name]nvarchar(50)
)
create table Authors(
[Id]int primary key identity(1,1),
[Name]nvarchar(50),
[Email]nvarchar(100)
)
create table BookAuthors(
[Id]int primary key identity(1,1),
[BookId]int,
[AuthorId]int
foreign key([BookId]) references Books(Id),
foreign key([AuthorId]) references Authors(Id)
)

select * from Books
select * from Authors
select * from BookAuthors

insert into Books([Name])
Values('Ali ve Nino'),
      ('Leyli ve Mecnun'),
      ('Isgendername')


insert into Authors([Name],[Email])
Values('Author1','author1@gmail.com'),
      ('Author2','author2@gmail.com'),
      ('Author3','author3@gmail.com')

insert into BookAuthors([BookId],[AuthorId])
Values(1,1),
      (2,1),
      (3,2),
	  (1,2)

 insert into Cities([Name],[CountryId])
 values('Amsterdam',null),
       ('Tokio',null)
	  

select ct.Name as 'City',ctr.Name as 'Country' from Cities ct
inner join Countries ctr
on ct.CountryId=ctr.Id

select ct.Name as 'City',ctr.Name as 'Country' from Cities ct
left join Countries ctr
on ct.CountryId=ctr.Id


select ct.Name as 'City',ctr.Name as 'Country' from Cities ct
right join Countries ctr
on ct.CountryId=ctr.Id


select ct.Name as 'City',ctr.Name as 'Country' from Cities ct
full outer join Countries ctr
on ct.CountryId=ctr.Id

select a.Name as 'Author name',a.Email as'Author Email',b.Name as'Book name' from Authors a
join BookAuthors ba
on a.Id=ba.AuthorId
join Books b
on b.Id=ba.BookId




