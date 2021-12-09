
-- simple
	-- 1  view product_order details of a particular cust
	select order_id, order_date, delivery_method, delivery_date
	from product_order
	where product_order.cus_id = '2181965863' ;
	
	
	-- 2  view payment details of a particular cust
	select pay_id, order_id, pay_amt, pay_mode, pay_date
	from payment
	where payment.cus_id = '5246490685' ;
	
	
	-- 3  inventory details 
	select inv_id, inv_num, inv_desc, inv_items 
	from inventory ;
	
	
	-- 4  get payments on a particular date
	select pay_id, order_id, pay_amt, pay_mode, pay_date
	from payment
	where payment.pay_date = '2021-05-10' ;
	
	
	-- 5  list of all emp details
	select * from employee ;
	
	
	--6  updating cust deets
	update customer
	set cus_mobile = '654-373-1254'
	where cus_id = '2695731926' ;
	select * from customer;
	
	
-- nested 
	-- 1  get all stock deets which is there in 3 cust's carts
	select stk_id, stk_name, stk_desc
	from stock
	where stk_id in (select stk_id
			from stores
			where cart_id in (select cart_id
					  from cart
					  where cus_id = '2181965863' or cus_id = '9626368997' or cus_id = '2695731926')
			) ;
			
			
	-- 2  get list of all emp who manage at least 1 inv or approved one payment
	select distinct employee.emp_id, employee.emp_name
	from employee
	where employee.emp_id in (select emp_id
				  from inventory)
	      or 
	      employee.emp_id in (select emp_id 
	 			       from payment
	 			       where approval = 1) ;
	
	
	-- 3  for a particular emp list all the approved customer's emails
	select cus_email
	from customer
	where cus_id in ( select cus_id
			   from payment
			   where approval =1 and emp_id in (select emp_id
			 		            	     from employee));
			 		  	
	-- 4  get all inv that they have to visit for a particular cart
	select inv_id
	from stock
	where stk_id in (select stk_id
			 from stores
			 where cart_id = '5205508521');
	
	-- 5  get payments such that a particular payment mode and delivery method is selected (nested)
	select pay_id, cus_id, order_id, pay_amt, pay_mode, pay_date
	from payment
	where payment.pay_mode = 'COD' and payment.order_id in (select order_id
								from product_order
								where delivery_method = 'road') ;
								
	--6 get cost from stores
	select stk_name, stk_cost
	from stock
	where stk_id in (select stk_id
			 from stores
			 where cart_id = '3534925645') ;
	
