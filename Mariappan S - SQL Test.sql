USE sqltest;
SHOW tables;
 
 # 1)
 SELECT customer.cust_name AS "Customer",
customer.grade AS "Grade",orders.ord_no AS "Order No."
FROM orders, salesman, customer
WHERE orders.customer_id = customer.ï»¿custemor_id
AND orders.salesman_id = salesman.salesman_id
AND salesman.city IS NOT NULL
AND customer.grade IS NOT NULL ORDER BY customer.grade DESC;

#2)
SELECT ord_no, purch_amt, ord_date, salesman_id 
FROM orders 
WHERE salesman_id IN(
SELECT salesman_id 
FROM salesman
WHERE commision = (
SELECT MAX(commision) 
FROM salesman));

# 3)
SELECT ord_no, purch_amt, ord_date, salesman_id
FROM orders
WHERE salesman_id IN (
SELECT salesman_id
FROM salesman WHERE city='nagpur');

#4)
SELECT ord_date, SUM(purch_amt), 
SUM(purch_amt)*.15 
FROM orders 
GROUP BY ord_date 
ORDER BY ord_date;
 
 #5)
 SELECT ord_no, purch_amt, ord_date, salesman_id FROM orders
WHERE purch_amt >(SELECT  AVG(purch_amt) FROM orders);

#6)
#SELECT purch_amt FROM orders ORDER BY purch_amt DESC LIMIT N-1, 1; if N = 5:
SELECT purch_amt FROM orders ORDER BY purch_amt DESC LIMIT 4, 1;

#7) Entities and Relationships
 #Entity-Relationship model or E R model is used to create a relationship between different attributes or entities. It describes the structure of the database with the help of the ER Diagram or Entity Relationship Diagram. ER model creates a simple design view of the data

# 8)
Select Customer_id , ba.Account_Number,
Case when ifnull(Balance_amount,0) = 0 then   Transaction_amount else Balance_amount end  as Balance_amount
from bank_account_details ba  
inner join
bank_account_transaction bat
on ba.Account_Number = bat.Account_Number
and Account_type = "Credit Card";

#9)
Select bank_account_details.account_number, balance_amount, transaction_amount
from bank_account_details inner join bank_account_transaction on bank_account_details.account_number = bank_account_transaction.account_number
And (date_format(Transaction_Date , '%Y-%m')  between "2020-03" and "2020-04"); 

# 10)
SELECT bank_account_details.customer_id, bank_account_details.account_number, balance_amount, transaction_amount
FROM bank_account_details LEFT JOIN bank_account_transaction ON bank_account_details.account_number = bank_account_transaction.account_number
LEFT JOIN bank_customer ON bank_account_details.customer_id = bank_customer.customer_id
AND NOT ( date_format(Transaction_Date , '%Y-%m') = "2020-03" );


  


