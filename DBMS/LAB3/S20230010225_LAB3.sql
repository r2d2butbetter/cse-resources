-- create table customers(
-- customerID	int,
-- dateofbirth date,
-- gender varchar(1),
-- customername varchar(30),
-- city varchar(20),
-- country varchar(20));


-- create table products(
-- CustomerID Int,
-- ProductID int,
-- ProductName varchar(20),
-- Availability varchar(20),
-- Price int);


-- INSERT INTO Customers (CustomerID, DateOfBirth, Gender, CustomerName, City, Country) VALUES 
-- (12, '1996-11-10', 'm', 'monk', 'Hyderabad', 'India'),
-- (15, '1972-08-10', 'f', 'mars', 'goa', 'India'),
-- (20, '1966-03-29', 'f', 'Johny', 'paris', 'france'),
-- (25, '1944-03-10', 'f', 'mans', 'Hamburg', 'Germany'),
-- (125, '1999-12-10', 'm', 'Maggie', 'delhi', 'India'),
-- (150, '1991-12-10', 'f', 'don', 'Oslo', 'norway'),
-- (200, '1968-11-29', 'f', 'lambi', 'paris', 'france'),
-- (1000, '1989-10-10', 'm', 'john', 'delhi', 'india'),
-- (1100, '1979-01-10', 'f', 'kens', 'berlin', 'germany'),
-- (1105, '1989-10-10', 'm', 'manish', 'delhi', 'india'),
-- (1106, '1979-01-10', 'f', 'kensive', 'berlin', 'germany'),
-- (1205, '1998-11-10', 'm', 'monk', 'delhi', 'india'),
-- (1259, '1999-12-10', 'm', 'maggie', 'delhi', 'india'),
-- (1507, '1992-08-10', 'f', 'mars', 'oslo', 'norway'),
-- (2004, '1966-03-29', 'f', 'johny', 'paris', 'france'),
-- (2505, '1960-03-10', 'f', 'kelvin', 'hamburg', 'germany');


-- insert into products(customerid, productid, productname, availability, price) values
-- (1, 1000, 'pen', 'yes', 100),
-- (2, 1100, 'toy', 'no', 10),
-- (3, 2505, 'pencil', 'yes', 30),
-- (4, 1205, 'duck', 'yes', 50),
-- (6, 200, 'hat', 'yes', 10),
-- (7, 2505, 'pot', 'no', 90),
-- (9, 1100, 'chalk', 'no', 10);


-- alter table customers add primary key (customerid);

-- alter table products add constraint foreign key (productid) references customers (customerid);

-- alter table products rename column ProductID to temp;
-- alter table products rename column CustomerID to ProductID;
-- alter table products rename column temp to CustomerID;
-- select * from products;

-- select * from customers where customername like '%or%';

-- alter table products alter column availability set default 'yes';



-- insert into products (Productid, customerid, productname, availability, price) values
-- (10, 2505, 'newtoy', 'yes', 2505);

-- select * from customers where city="berlin" and country="germany";

-- select * from customers where country!="germany";

-- select * from customers where city like 'a%';

-- select * from customers where city like 'a%b';

-- select * from customers where city not like 'a%';

-- select * from customers where city like 'a%' or city like 'c%' or city like 's%';

-- select * from customers where substring(city, 1, 1) between 'a' and 'f'

-- select * from customers where country!='norway' and country!='france';

-- select * from products where productname between 'hat' and 'pen';

-- select * from products where price between 50 and 100;

-- select CONSTRAINT_NAME from INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_NAME='products';


-- alter table products drop foreign key products_ibfk_1 ;
-- alter table customers drop primary key;

-- delete from customers where city='victoria' and country='brazil';

-- select productname from products where price<=50;

-- select customername from customers where city!='hamburg' and city!='delhi';
-- select * from customers;
-- select customername from customers where timestampdiff(YEAR, dateofbirth, '1975-01-01');