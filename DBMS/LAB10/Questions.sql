-- create view branch_cust as
-- select branch_name, customername
-- from depositor_relation, account_relation
-- where depositor_relation.account_number = account_relation.accountnumber

-- delimiter //
-- create trigger depins
-- after insert on depositor_relation
-- for each row
-- begin
-- insert into branch_cust (branch_name, customername)
-- select a.branch_name, new.customername
-- from account_relation a
-- where a.accountnumber = new.account_number;
-- end//
-- delimiter ;

-- delimiter //
-- create trigger depdel
-- after delete on depositor_relation
-- for each row
-- begin
--     delete from branch_cust
--     where branch_name = (select branch_name from account_relation where accountnumber = old.account_number)
--       and customername = old.customername;
-- end //
-- delimiter ;

delimiter //
create trigger accins
after insert on account_relation
for each row
begin
    insert into branch_cust (branch_name, customername)
    select new.branch_name, d.customername
    from depositor_relation d
    where d.account_number = new.accountnumber;
end;
delimiter ;