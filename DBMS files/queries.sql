
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
	
	
-- nested 
	-- 1  get all stock deets which is there in 3 cust's carts
	
	-- 2  get list of all emp who manage at least 1 inv or approved one payment
	select distinct employee.emp_id, employee.emp_name
	from employee, inventory, payment
	where employee.emp_id = inventory.emp_id or employee.emp_id = payment.emp_id ;
	
	
	-- 3  for a particular emp list all the approved customer's emails
	
	
	-- 4  get all inv that they have to visit for a particular cart
	
	
	-- 5  get payments such that a particular payment mode and delivery method is selected (nested)
	select pay_id, cus_id, order_id, pay_amt, pay_mode, pay_date
	from payment
	where payment.pay_mode = 'COD' and payment.order_id = (select order_id
								from product_order
								where delivery_method = 'road') ;
								
	--6 get cost from stores
	
	
