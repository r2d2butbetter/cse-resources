-- create database S20230010225_LAB10;

-- create table author (author_id integer primary key, authorName varchar(30), email varchar (25), gender
-- varchar (6));
-- create table book (BookId integer not null unique, ISBN integer primary key, book_name varchar (30)
-- not null, author integer, ed_num integer, price integer, pages integer, foreign key (author) references
-- author (author_id) on delete cascade);
-- insert into author values (1, "Kraig Muller", "Wordnewton@gmail.com",
-- "Male"); insert into author values(2, "Karrie Nicolette", "karrie23@gmail.com",
-- "Female"); insert into book values(1, 001, "Glimpses of the past", 1, 1, 650, 396);
-- insert into book values (2, 002, "Beyond The Horizons of Venus", 1, 1, 650,
-- 396); insert into book values(3, 003, "Ultrasonic Aquaculture", 2, 1, 799, 500);
-- insert into book values(4, 004, "Cyrogenic Engines", 2, 1, 499, 330);
-- CREATE TABLE items (id INT NOT NULL AUTO_INCREMENT, name VARCHAR(20) NOT NULL, cost FLOAT
-- NOT NULL DEFAULT 0.0, price FLOAT NOT NULL DEFAULT 0.0, PRIMARY KEY(id)); INSERT INTO items
-- (name, cost, price) VALUES ('Basic Widget',5.95,8.35),('Micro Widget',0.95,1.35),('Mega
-- Widget',99.95,140.00);
-- CREATE TABLE employees(ID INT, name VARCHAR(20),department VARCHAR(20) , primary key(ID));
-- CREATE TABLE product(id INT AUTO_INCREMENT, type VARCHAR(50), name VARCHAR(255), primary
-- key(id) );
-- CREATE TABLE product_type (name VARCHAR(50));
-- CREATE TABLE product_type_count ( type VARCHAR(50), count INT DEFAULT 0 );
-- INSERT INTO product_type (name) VALUES ('dress'), ('food');
-- INSERT INTO product (type, name) VALUES
-- ('dress', 'T-shirt'),
-- ('dress', 'Trousers'),
-- ('food', 'Apple'),
-- ('food', 'Tomatoes'),
-- ('food', 'Meat');

-- delimiter //
-- create procedure display_book()
-- begin
-- select *from book;
-- end //
-- delimiter ;
-- call display_book();

-- select * from book;

-- delimiter //
-- create procedure update_price (IN temp_ISBN varchar(10), IN new_price
-- integer) begin
-- update book set price=new_price where ISBN=temp_ISBN;
-- end //
-- delimiter ;
-- call update_price(3, 5000);
-- select * from book;


-- delimiter //
-- create procedure disp_max(OUT highestprice integer)
-- begin
-- select max(price) into highestprice from book;
-- end //
-- delimiter ;

-- call disp_max(@v);
-- select @v;

-- delimiter //
-- create procedure disp_gender(INOUT mfgender integer, IN emp_gender varchar(6))
-- begin
-- select count(gender) into mfgender from author where gender= emp_gender;
-- end //
-- delimiter ;

-- set @g = 0;
-- call disp_gender(@g, 'female');
-- select @g;

-- delimiter //
-- create function my_fun(emp_gender varchar(6))
-- returns int
-- deterministic
-- begin
-- declare r int;
-- select count(gender) into r from author where gender =
-- emp_gender; return (r);
-- end//
-- delimiter ;

-- select my_fun('female');


-- DELIMITER $$
-- CREATE TRIGGER `updateItemPrice`
-- BEFORE UPDATE ON `items`
-- FOR EACH ROW

-- BEGIN
-- IF NEW.cost <> OLD.cost
-- THEN
-- SET NEW.price = NEW.cost * 1.40;
-- END IF ;
-- END$$
-- DELIMITER ;

-- UPDATE items SET cost = 7.00 WHERE id = 1;
-- SELECT * FROM items;


-- DELIMITER //
-- CREATE PROCEDURE emp_details
-- (InputID INTEGER
-- ,InputName VARCHAR(50)
-- ,InputDept VARCHAR(50))
-- BEGIN
-- DECLARE EXIT HANDLER FOR SQLEXCEPTION
-- SELECT 'Error occured';
-- INSERT INTO employees VALUES(InputID, InputName, InputDept);
-- SELECT * FROM employees;
-- END//
-- delimiter ;

-- DROP procedure if exists emp_curs;
-- DELIMITER $$
-- CREATE PROCEDURE emp_curs()
-- BEGIN
-- DECLARE finished INTEGER DEFAULT 0;
-- DECLARE ename varchar(100);
-- DECLARE eplace varchar(100);
-- -- declare cursor for employee name and place

-- DEClARE curname CURSOR FOR SELECT emp_name, place FROM
-- employee; -- declare NOT FOUND handler
-- DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
-- OPEN curname;
-- getname: LOOP
-- FETCH curname INTO ename, eplace;
-- IF finished = 1 THEN
-- LEAVE getname;
-- END IF;
-- -- build employee names
-- SELECT ename,eplace;
-- END LOOP getname;
-- CLOSE curname;
-- END$$
-- DELIMITER ;


-- DELIMITER //
-- DROP PROCEDURE IF EXISTS product_count;
-- CREATE PROCEDURE product_count()
-- BEGIN
-- DECLARE p_type VARCHAR(255);
-- DECLARE p_count INT;
-- DECLARE done INT DEFAULT 0;
-- DECLARE product_curs CURSOR FOR
-- SELECT type,COUNT(*)FROM product GROUP BY type;
-- DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;
-- TRUNCATE product_type;
-- OPEN product_curs;
-- REPEAT
-- FETCH product_curs
-- INTO p_type, p_count;
-- IF NOT done
-- THEN
-- INSERT INTO product_type_count
-- SET
-- type = p_type,
-- count = p_count;
-- END IF;

-- UNTIL done
-- END REPEAT;
-- CLOSE product_curs;
-- END //
-- DELIMITER ;

-- CALL product_count();
-- select * from product_type_count;

