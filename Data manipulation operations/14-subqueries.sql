create view base_result as select * from sales where volume > 1000; 
 
select customer_name,product_name from base_result;