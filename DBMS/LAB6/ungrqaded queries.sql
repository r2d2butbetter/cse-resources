-- select customername, balance from account natural join customer_new where balance>=700;

-- select sum(amount) from borrower natural join loan where customer_name="Smith";

-- select branch_city, count(branch_city) as c from branch group by branch_city having c>1;

-- select customername, branchname, branch_name, customer_city from customer_new
-- natural join account natural join branch where account.branch_name=branch.branchname;

-- select customer_city, sum(amount) as total_loan from 
-- customer_new left join borrower on customer_name=customername
-- left join loan on borrower.loan_number=loan.loan_number
-- group by customer_city;

-- select customer.customername, sum(balance) as total from account natural join depositor right join customer 
-- on customer.customername=depositor.customername
-- group by customername

-- select c.customername, sum(amount) as total from loan
-- inner join borrower on loan.loan_number=borrower.loan_number 
-- right join customer as c on customername=borrower.customer_name
-- group by c.customername;

-- create view v1 as 
-- select c.customername, acc.accountnumber, loan.loan_number from customer as c
-- left join depositor as dep on dep.customername=c.customername 
-- left join account as acc on acc.accountnumber=dep.account_number
-- left join borrower as b on b.customer_name=c.customername
-- left join loan on loan.loan_number=b.loan_number;

-- select * from v1;