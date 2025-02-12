-- create table sailors(
-- sid int,
-- sname varchar(50),
-- rating int,
-- age float
-- );

-- create table boats(
-- bid int,
-- bname varchar(50),
-- color varchar(20));

-- create table reserves(
-- sid int,
-- bid int,
-- day date);

-- insert into sailors (sid, sname, rating, age) values
-- (22, 'Dustin', 7, 45),
-- (29, 'Brutus', 1, 33),
-- (31, 'Lubber', 8, 55.5),
-- (32, 'Andy', 8, 25.5),
-- (58, 'Rusty', 10, 35),
-- (64, 'Horatio', 7, 35),
-- (71, 'Zorba', 10, 16),
-- (74, 'Horatio', 9, 40),
-- (85, 'Art', 3, 25.5),
-- (95, 'Bob', 3, 63.5);

-- insert into boats (bid, bname, color)values
-- (101, 'Interlake', 'blue'),
-- (102, 'Interlake', 'red'),
-- (103, 'Clipper', 'green'),
-- (104, 'Marine', 'red');

-- insert into reserves (sid, bid, day) values
-- (22, 101, '1998-10-10'),
-- (22, 102, '1998-10-10'),
-- (22, 103, '1998-10-08'),
-- (22, 104, '1998-10-07'),
-- (31, 102, '1998-11-10'),
-- (31, 103, '1998-11-06'),
-- (31, 104, '1998-11-12'),
-- (64, 101, '1998-09-05'),
-- (64, 102, '1998-09-08'),
-- (74, 103, '1998-09-08');

-- select sid, sname, rating, age from sailors natural join reserves where bid=101;

-- select * from boats natural join sailors natural join reserves where sname='bob';

-- select sname from sailors natural join reserves natural join boats
-- where color='red' order by age;

-- select sname from sailors where sid in (select sid from reserves);

-- select distinct s.sid, s.sname from sailors s, reserves r1, reserves r2
-- where s.sid = r1.sid and s.sid = r2.sid and r1.day = r2.day and r1.bid <> r2.bid;

-- select distinct r.sid from reserves r join boats b on r.bid = b.bid
-- where b.color = 'red' or b.color = 'green';

-- select sname, age from sailors where age = (select min(age) from sailors);

-- select count(distinct(sname)) from sailors;

-- select rating, avg(age) from sailors group by rating;

-- select rating, avg(age) from sailors group by rating having count(rating) >= 2;

-- select emp_name, doj from employee where emp_dept=(select distinct emp_dept from employee where emp_name='mark')
-- and emp_name<>'mark'

-- select emp_id, emp_name from employee where income > (select avg(income) from employee) order by income desc;

-- select emp_id, emp_name from employee where emp_dept in (select emp_dept from employee where emp_name like '%n%');

-- select emp_name, emp_dept, emp_id from employee where place = 'india';

-- select max(income) from employee where income < (select max(income) from employee);




