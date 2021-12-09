\c inventory_management_system

create user cust with nosuperuser;
grant connect on database "inventory_management_system" to cust;
grant select on product_order to cust;
grant select on Payment to cust;
grant select on Customer to cust;
grant select on Cart to cust;
grant select on Stores to cust;
grant update on Customer to cust;
grant update on Cart to cust;
/*view product_order details
updating cust deets
get cost from stores*/

create user emp with nosuperuser;
grant connect on database "inventory_management_system" to emp;
grant select on Roles to emp;
grant select on Payment to emp;
grant select on Permission to emp;
grant select on Inventory to emp;
grant select on Stores to emp;
grant select on Stock to emp;
--view payment details of a particular cust
--get all stock deets which is there in 3 cust's carts

create user admin with nosuperuser;
grant connect on database "inventory_management_system" to admin;
grant all privileges on database inventory_management_system to admin;
--get list of all emp who manage at least 1 inv or approved one payment

create user manager with nosuperuser;
grant select on Inventory to manager;
grant update on Inventory to manager;
grant select on Roles to manager;
grant select on Employee to manager;
grant select on Payment to manager;
grant select on Permission to manager;
--inventory details
--for a particular emp list all the approved customer's emails

create user mover with nosuperuser;
grant select on Inventory to mover;
grant update on Inventory to mover;
--get all inv that they have to visit for a particular cart

create user accountant with nosuperuser;
grant select on Payment to accountant;
grant update on Payment to accountant;
--get payments on a particular date
--get payments such that a particular payment mode and delivery method is selected (nested)

create user hr with nosuperuser;
grant select on employee to hr;
grant update on employee to hr;
--list of all emp details
