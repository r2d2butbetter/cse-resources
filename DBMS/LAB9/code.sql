-- delimiter //
-- create function q1(balance decimal) returns varchar(10)
-- deterministic
-- begin
-- declare level varchar(10);
-- if balance>= 900 then set level = "platinum";
-- elseif balance >=700 and balance <900 then set level = "gold";
-- else set level= "silver";
-- end if;
-- return level;
-- end//
-- delimiter ;
-- select accountnumber, q1(balance) AS `Level`
-- from account_relation;

-- delimiter //

-- create function q2(doj date) returns int
-- deterministic
-- begin
-- declare e int;
-- set e = timestampdiff(year, doj, curdate());
-- return e;
-- end//
-- delimiter ;

-- select *, q2(doj) as experience from employee;


-- delimiter //
-- create function q3() returns int
-- deterministic
-- begin
--     declare c int;
--     select count(*) INTO c
--     from borrower_relation b
--     join loan_relation l on b.loan_number = l.loan_number
--     WHERE l.amount > 1000;
--     RETURN c;
-- end //
-- delimiter ;

-- select q3() as countofpeople;


-- delimiter //
-- create function q4() returns varchar(50)
-- deterministic
-- begin
--     declare richguy varchar(50);

--     select d.customername into richguy
--     from account_relation a
--     join depositor_relation d on a.accountnumber = d.account_number
--    order by a.balance desc
--     limit 1;
--     return richguy;
-- end //
-- delimiter ;

-- select q4() as topcustomer;


-- create table test_employee (
--     emp_id int not null,
--     emp_name varchar(100) not null,
--     primary key (emp_id)
-- );



-- delimiter //

-- create procedure q5(
--     pid int,
--     pname varchar(100)
-- )
-- begin
-- declare exit handler for sqlexception
-- begin
-- select 'Trying to populate a non-null column with null value';
-- end;
-- insert into test_employee(emp_id, emp_name)
-- values (pid, pname);
-- end //

-- delimiter ;

-- call q5(null, 'Shriansh');



