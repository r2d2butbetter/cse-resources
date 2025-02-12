-- CREATE TABLE WorkCenters (
-- id INT AUTO_INCREMENT PRIMARY KEY,
-- name VARCHAR(100) NOT NULL,
-- capacity INT NOT NULL
-- );
-- DROP TABLE IF EXISTS WorkCenterStats;
-- CREATE TABLE WorkCenterStats(
-- totalCapacity INT NOT NULL
-- );
-- DROP TABLE IF EXISTS members;
-- CREATE TABLE members (
-- id INT AUTO_INCREMENT,
-- name VARCHAR(100) NOT NULL,
-- email VARCHAR(255),
-- birthDate DATE,
-- PRIMARY KEY (id)
-- );
-- DROP TABLE IF EXISTS reminders;
-- CREATE TABLE reminders (
-- id INT AUTO_INCREMENT,

-- memberId INT,
-- message VARCHAR(255) NOT NULL,
-- PRIMARY KEY (id , memberId)
-- );
-- DROP TABLE IF EXISTS Salaries;
-- CREATE TABLE Salaries (
-- employeeNumber INT PRIMARY KEY,
-- validFrom DATE NOT NULL,
-- amount DEC(12 , 2 ) NOT NULL DEFAULT 0
-- );
-- INSERT INTO
-- salaries(employeeNumber,validFrom,amount) VALUES
-- (1002,'2000-01-01',50000),
-- (1056,'2000-01-01',60000),
-- (1076,'2000-01-01',70000);

-- DROP TABLE IF EXISTS SalaryArchives;
-- CREATE TABLE SalaryArchives (
--     id INT AUTO_INCREMENT,
--     employeeNumber INT,
--     validFrom DATE NOT NULL,
--     amount DEC(12 , 2 ) NOT NULL DEFAULT 0,
--     deletedAt TIMESTAMP DEFAULT NOW(),
--     PRIMARY KEY (id, employeeNumber)
-- );

-- DROP TABLE IF EXISTS Salaries;
-- CREATE TABLE Salaries (
-- employeeNumber INT PRIMARY KEY,
-- salary DECIMAL(10,2) NOT NULL DEFAULT 0
-- );

-- INSERT INTO
-- Salaries(employeeNumber,salary) VALUES
-- (1002,5000),
-- (1056,7000),
-- (1076,8000);
-- DROP TABLE IF EXISTS SalaryBudgets;
-- CREATE TABLE SalaryBudgets(
-- total DECIMAL(15,2) NOT NULL
-- );
-- INSERT INTO SalaryBudgets(total)
-- SELECT SUM(salary)
-- FROM Salaries;
-- SELECT * FROM SalaryBudgets;

-- delimiter //

-- create trigger before_insert_update
-- before insert on WorkCenters
-- for each row
-- begin
--     update WorkCenterStats
--     set totalCapacity = totalCapacity + new.capacity;
-- end //
-- delimiter ;


-- DELIMITER //

-- create trigger insert_reminder
-- after insert on members
-- for each row
-- begin
--     if new.birthDate is null then
--         insert into reminders (memberId, message)
--         values (new.id, 'Update birthday info');
--     END IF;
-- END //
-- DELIMITER ;

-- delimiter //
-- create trigger insert_into_salarchieve
-- before delete on Salaries
-- for each row
-- begin
--     insert into SalaryArchives (employeeNumber, validFrom, amount, deletedAt)
--     values (old.employeeNumber, old.employeeNumber());
-- end //
-- delimiter ;



-- DELIMITER //

-- create trigger update_salbudget
-- after delete on Salaries
-- for each row
-- begin
--     update SalaryBudgets
--     set total = total - old.salary;
-- end //

-- delimiter ;



