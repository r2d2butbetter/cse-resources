-- create table small_customers(id smallint,name varchar(10),age smallint,address varchar(15),salary int);
-- create table small_customers2(id smallint,name varchar(10),age smallint,address varchar(15),salary int);
-- create table orders (oid int,date datetime,customer_id smallint,amount int);
-- create table datdemo(val datetime);

-- insert into datdemo values(current_date());

-- insert into datdemo values(current_time());

-- insert into datdemo values(current_timestamp());

-- select DATEDIFF("2017-06-25 09:34:21", "2017-06-15 15:25:35");

-- select ADDDATE("2017-06-15 09:34:21", INTERVAL 3 HOUR);

-- select ADDDATE("2017-06-15", INTERVAL -2 MONTH);

-- SELECT ADDTIME("2017-06-15 09:34:21.000001", "5 2:10:5.000003");


-- select * from small_customers where id in (select id from small_customers where salary>4500);

-- insert into small_customers2 select * from small_customers where id in (select id from small_customers);

-- update small_customers set SALARY = SALARY * 0.25 where age in (select age from small_customers2 WHERE age >= 27);

-- delete from small_customers where age in (SELECT AGE FROM small_customers2 WHERE AGE >= 27);

-- alter table orders change column oid id smallint;
-- Select small_customers.id, name, orders.id
-- from small_customers, orders;

-- select s.id, name, o.id from small_customers as s, orders as o;

-- SELECT id from small_customers WHERE id = ANY(Select customer_id from orders);

-- select name from small_customers where not exists(select * from orders where small_customers.id=orders.customer_id)

-- select orders.id,name from small_customers natural join orders

-- select orders.id,name from small_customers inner join orders on small_customers.id=orders.id;

-- select orders.id,name from small_customers right join orders on
-- small_customers.id=orders.id;

-- select orders.id,name from small_customers left join orders on
-- small_customers.id=orders.customer_id;

-- select customer_name from borrower union select customer_name from depositor

-- select customer_name from borrower where customer_name in (select customer_name from depositor)


-- select distinct b.branch_name from branch as b join branch as s on b.assets>s.assets where b.branch_city="Brooklyn"

-- select distinct borrower.customer_name from borrower join loan on borrower.loan_number=loan.loan_number 
-- left join depositor on borrower.customer_name=depositor.customer_name where depositor.customer_name is null

-- select branch_name from branch where assets >
-- any(select assets from branch where branch_city="Brooklyn")

-- select branch_name, avg(balance) from account group by branch_name order by avg(balance) desc limit 1;

-- select distinct customer_name from borrower where exists(select * from depositor where depositor.customer_name=borrower.customer_name)


-- select * from loan natural join borrower

-- select * from loan inner join borrower on loan.loan_number=borrower.loan_number

-- select * from loan right join borrower on loan.loan_number=borrower.loan_number

-- select * from loan right outer join borrower on loan.loan_number=borrower.loan_number

-- select * from loan left outer join borrower on loan.loan_number=borrower.loan_number

-- select * from loan left outer join borrower on loan.loan_number=borrower.loan_number

-- select * from loan left outer join borrower on loan.loan_number=borrower.loan_number
-- union
-- select * from loan right outer join borrower on loan.loan_number=borrower.loan_number