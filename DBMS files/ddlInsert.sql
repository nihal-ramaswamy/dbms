\c inventory_management_system;

insert into roles (role_id, role_name, role_desc) values (1128591118, 'Human Resources', 'Responsible for recruiting, screening, interviewing and placing workers'); 
insert into roles (role_id, role_name, role_desc) values (1353340127, 'Customer Support', 'Address customer issues and resolve them in a timely and efficient manner');
insert into roles (role_id, role_name, role_desc) values (3049749390, 'Inventory Manager', 'Manages functioning of inventory systems');
insert into roles (role_id, role_name, role_desc) values (3745544084, 'Mover', 'Transportation of goods');
insert into roles (role_id, role_name, role_desc) values (7728174008, 'Accountant', 'Manages finances');

insert into permission (per_id, per_name, per_desc) values (8095194223, 'Admin', 'Full access');
insert into permission (per_id, per_name, per_desc) values (1343514041, 'Delivery', 'Access to delivery equipments');
insert into permission (per_id, per_name, per_desc) values (3452358644, 'Employee data', 'Access to employee data');
insert into permission (per_id, per_name, per_desc) values (6542683543, 'Finance Transactions', 'Access to finance related documents');
insert into permission (per_id, per_name, per_desc) values (9576846732, 'Inventory', 'Access to inventory and stock data');

insert into assigned (role_id, per_id) values (3745544084, 1343514041);
insert into assigned (role_id, per_id) values (1128591118, 3452358644);
insert into assigned (role_id, per_id) values (7728174008, 6542683543);
insert into assigned (role_id, per_id) values (3049749390, 9576846732);

insert into employee (emp_id, emp_name, emp_email, emp_mobile, emp_addr, emp_password, role_id) values (1584547556, 'Faber Lemonnier', 'flemonnier0@xing.com', '134-647-2432', '25 Dryden Junction', '123', 1128591118);
insert into employee (emp_id, emp_name, emp_email, emp_mobile, emp_addr, emp_password, role_id) values (8637060244, 'Lynett Pischel', 'lpischel1@hugedomains.com', '641-631-4297', '3471 Menomonie Point', '123', 1353340127);
insert into employee (emp_id, emp_name, emp_email, emp_mobile, emp_addr, emp_password, role_id) values (6633512062, 'Kristine Minister', 'kminister2@icq.com', '213-912-7307', '2 Farragut Trail', '123', 3049749390);
insert into employee (emp_id, emp_name, emp_email, emp_mobile, emp_addr, emp_password, role_id) values (6191548101, 'Hugues Petrik', 'hpetrik3@phoca.cz', '406-691-3437', '397 Arkansas Center', '123', 3745544084);
insert into employee (emp_id, emp_name, emp_email, emp_mobile, emp_addr, emp_password, role_id) values (5089474660, 'Elianore Oger', 'eoger4@bloomberg.com', '699-635-7926', '52203 David Road', '123', 3745544084);

insert into customer (cus_id, cus_name, cus_email, cus_mobile, cus_addr) values (2181965863, 'Adler Juhruke', 'ajuhruke0@google.ru', '784-373-0903', '78629 Porter Crossing');
insert into customer (cus_id, cus_name, cus_email, cus_mobile, cus_addr) values (2160309173, 'Waly Grimsdyke', 'wgrimsdyke1@storify.com', '802-760-7664', '916 Menomonie Junction');
insert into customer (cus_id, cus_name, cus_email, cus_mobile, cus_addr) values (2695731926, 'Arlen Critzen', 'acritzen2@springer.com', '379-364-3753', '8 Charing Cross Place');
insert into customer (cus_id, cus_name, cus_email, cus_mobile, cus_addr) values (5246490685, 'Krishnah Bundock', 'kbundock3@abc.net.au', '904-358-1646', '17109 Logan Avenue');
insert into customer (cus_id, cus_name, cus_email, cus_mobile, cus_addr) values (9626368997, 'Ginger Kelleher', 'gkelleher4@craigslist.org', '921-752-8583', '5551 Lukken Park');

insert into inventory (inv_id, emp_id, inv_num, inv_desc, inv_items) values (8536881882, 1584547556, 43, 'Upgradable composite product', '{"Essentials", "Boxes"}');
insert into inventory (inv_id, emp_id, inv_num, inv_desc, inv_items) values (6420242564, 8637060244, 92, 'Multi-tiered discrete initiative', '{"Boxes"}');
insert into inventory (inv_id, emp_id, inv_num, inv_desc, inv_items) values (9111925480, 6633512062, 68, 'Persistent asymmetric utilisation', '{"Essentials"}');
insert into inventory (inv_id, emp_id, inv_num, inv_desc, inv_items) values (2257984470, 6191548101, 41, 'Polarised client-driven time-frame', '{"Electronics"}');
insert into inventory (inv_id, emp_id, inv_num, inv_desc, inv_items) values (7682325210, 5089474660, 72, 'Open-architected fresh-thinking help-desk', '{"Essentials"}');
insert into inventory (inv_id, emp_id, inv_num, inv_desc, inv_items) values (6411067046, 6633512062, 97, 'Polarised directional contingency', '{"Essentials"}');
insert into inventory (inv_id, emp_id, inv_num, inv_desc, inv_items) values (3690148299, 5089474660, 12, 'Integrated multi-state Graphic Interface', '{"Shoes", "Appliances", "Essentials"}');
insert into inventory (inv_id, emp_id, inv_num, inv_desc, inv_items) values (2141023209, 6191548101, 37, 'Exclusive content-based help-desk', '{"Shoes"}');

insert into stock (stk_id, inv_id, stk_name, stk_desc, stk_cost) values (9998204122, 8536881882, 'Coffee Power', 'Monitored multi-tasking encoding', 543);
insert into stock (stk_id, inv_id, stk_name, stk_desc, stk_cost) values (7346031111, 6420242564, 'Moving Boxes', 'Total modular migration', 5231);
insert into stock (stk_id, inv_id, stk_name, stk_desc, stk_cost) values (3314580509, 9111925480, 'Cooking Oil', 'Implemented maximized methodology', 7435);
insert into stock (stk_id, inv_id, stk_name, stk_desc, stk_cost) values (7046796664, 7682325210, 'Detergent', 'De-engineered background moderator', 324);
insert into stock (stk_id, inv_id, stk_name, stk_desc, stk_cost) values (1033405616, 3690148299, 'Mixer', 'Synchronised regional frame', 756);
insert into stock (stk_id, inv_id, stk_name, stk_desc, stk_cost) values (2614987825, 2257984470, 'Phone-123', 'Advanced client-server moratorium', 745);
insert into stock (stk_id, inv_id, stk_name, stk_desc, stk_cost) values (3545011918, 6411067046, 'Paper Towel Touchless', 'Monitored interactive circuit', 25);
insert into stock (stk_id, inv_id, stk_name, stk_desc, stk_cost) values (6002807961, 3690148299, 'Running Shoes', 'Quality-focused optimizing budgetary management', 7653);


insert into  product_order (order_id, cus_id, delivery_method, order_date, delivery_Date) values (9565890671, 2181965863, 'air', '2020-11-10', '2020-11-10');
insert into  product_order (order_id, cus_id, delivery_method, order_date, delivery_Date) values (4496960720, 2181965863, 'overseas', '2020-12-13', '2021-6-18');
insert into  product_order (order_id, cus_id, delivery_method, order_date, delivery_Date) values (7687370684, 9626368997, 'road', '2020-11-18', '2021-6-9');
insert into  product_order (order_id, cus_id, delivery_method, order_date, delivery_Date) values (1123819871, 9626368997, 'road', '2020-12-15', '2021-2-3');
insert into  product_order (order_id, cus_id, delivery_method, order_date, delivery_Date) values (7715476629, 2695731926, 'overseas', '2020-11-18', '2021-8-10');
insert into  product_order (order_id, cus_id, delivery_method, order_date, delivery_Date) values (8761361059, 2695731926, 'overseas', '2020-11-06', '2021-2-10');
insert into  product_order (order_id, cus_id, delivery_method, order_date, delivery_Date) values (6497189210, 2695731926, 'air', '2020-12-02', '2021-2-1');
insert into  product_order (order_id, cus_id, delivery_method, order_date, delivery_Date) values (1993216719, 5246490685, 'air', '2020-11-16', '2021-9-3');

insert into  orders (order_id, cus_id) values (9565890671, 2181965863);
insert into  orders (order_id, cus_id) values (4496960720, 2181965863);
insert into  orders (order_id, cus_id) values (7687370684, 9626368997);
insert into  orders (order_id, cus_id) values (1123819871, 9626368997);
insert into  orders (order_id, cus_id) values (7715476629, 2695731926);
insert into  orders (order_id, cus_id) values (8761361059, 2695731926);
insert into  orders (order_id, cus_id) values (6497189210, 2695731926);
insert into  orders (order_id, cus_id) values (1993216719, 5246490685);

insert into  payment (pay_id, cus_id, emp_id, order_id, pay_amt, pay_mode, pay_date) values (9719599882, 2181965863, 1584547556, 9565890671, 522, 'COD', '2021-05-10');
insert into  payment (pay_id, cus_id, emp_id, order_id, pay_amt, pay_mode, pay_date) values (9117294401, 2181965863, 1584547556, 4496960720, 1398, 'UPI', '2021-06-29');
insert into  payment (pay_id, cus_id, emp_id, order_id, pay_amt, pay_mode, pay_date) values (7064519033, 9626368997, 1584547556, 7687370684, 9485, 'Debit/Credit card', '2021-08-18');
insert into  payment (pay_id, cus_id, emp_id, order_id, pay_amt, pay_mode, pay_date) values (1238048445, 9626368997, 6191548101, 1123819871, 3513, 'Managed intangible attitude', '2021-06-06');
insert into  payment (pay_id, cus_id, emp_id, order_id, pay_amt, pay_mode, pay_date) values (4904681268, 2695731926, 6191548101, 7715476629, 578, 'Persevering bifurcated task-force', '2021-09-12');
insert into  payment (pay_id, cus_id, emp_id, order_id, pay_amt, pay_mode, pay_date) values (3929715312, 2695731926, 6191548101, 8761361059, 7774, 'Seamless zero defect orchestration', '2021-09-09');
insert into  payment (pay_id, cus_id, emp_id, order_id, pay_amt, pay_mode, pay_date) values (9302317157, 2695731926, 5089474660, 6497189210, 8476, 'User-centric real-time encryption', '2021-05-22');
insert into  payment (pay_id, cus_id, emp_id, order_id, pay_amt, pay_mode, pay_date) values (2508791061, 5246490685, 5089474660, 1993216719, 5608, 'Progressive next generation application', '2021-08-29');

insert into  cart (cart_id, cus_id) values (4141604063, 2181965863); 
insert into  cart (cart_id, cus_id) values (3534925645, 2160309173);
insert into  cart (cart_id, cus_id) values (4202254122, 2695731926);
insert into  cart (cart_id, cus_id) values (8648101968, 5246490685);
insert into  cart (cart_id, cus_id) values (5205508521, 9626368997);

insert into  stores (cart_id, stk_list) values (4141604063, '{9998204122, 3545011918}');
insert into  stores (cart_id, stk_list) values (3534925645, '{3314580509, 3545011918}');
insert into  stores (cart_id, stk_list) values (4202254122, '{3314580509, 3545011918}');
insert into  stores (cart_id, stk_list) values (8648101968, '{9998204122, 3545011918}');
insert into  stores (cart_id, stk_list) values (5205508521, '{9998204122, 3545011918, 3314580509}');



