DROP DATABASE inventory_management_system;
CREATE DATABASE inventory_management_system;
\c inventory_management_system;

create table roles (
    role_id VARCHAR(10) PRIMARY KEY,
    role_name VARCHAR(20),
    role_desc VARCHAR
);

create table permission (
    per_id VARCHAR(10) PRIMARY KEY,
    per_name VARCHAR(20),
    per_desc VARCHAR
);

create table assigned (
    role_id VARCHAR(10) references roles(role_id) ON DELETE CASCADE ON UPDATE CASCADE ,
    per_id VARCHAR(10) references permission(per_id) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY(role_id, per_id)
);

create table employee (
    emp_id VARCHAR(10) PRIMARY KEY,
    role_id VARCHAR(10) references roles(role_id) ON DELETE CASCADE ON UPDATE CASCADE,
    emp_mobile VARCHAR(13),
    emp_addr VARCHAR,
    emp_email VARCHAR(30),
    emp_name VARCHAR(20),
    emp_password VARCHAR(32)
);

create table customer (
    cus_id VARCHAR(10) PRIMARY KEY,
    cus_mobile VARCHAR(13),
    cus_addr VARCHAR,
    cus_email VARCHAR(30),
    cus_name VARCHAR(20)
);

create table inventory (
    inv_id VARCHAR(10) PRIMARY KEY,
    emp_id VARCHAR(10) references employee(emp_id) ON DELETE CASCADE ON UPDATE CASCADE,
    inv_num INT,
    inv_desc VARCHAR,
    inv_items VARCHAR ARRAY
);

create table stock ( -- rename stk_type -> stk_name
    stk_id VARCHAR(10) UNIQUE NOT NULL,
    inv_id VARCHAR(10) references inventory(inv_id) ON DELETE CASCADE ON UPDATE CASCADE,
    stk_name VARCHAR,
    stk_desc VARCHAR,
    stk_cost INT,
    PRIMARY KEY(stk_id, inv_id)
);

create table product_order (
    order_id VARCHAR(10) PRIMARY KEY,
    cus_id VARCHAR(10) references customer(cus_id) ON DELETE CASCADE ON UPDATE CASCADE,
    delivery_method VARCHAR(10),
    order_date DATE,
    delivery_date DATE
);

create table orders (
    cus_id VARCHAR(10) references customer(cus_id) ON DELETE CASCADE ON UPDATE CASCADE,
    order_id VARCHAR(10) references product_order(order_id) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (cus_id, order_id)
);


create table payment (-- rename pay_desc -> pay_mode
    pay_id VARCHAR(10) PRIMARY KEY,
    cus_id VARCHAR(10) references customer(cus_id) ON DELETE CASCADE ON UPDATE CASCADE,
    emp_id VARCHAR(10) references employee(emp_id) ON DELETE CASCADE ON UPDATE CASCADE,
    order_id VARCHAR(10) references product_order(order_id) ON DELETE CASCADE ON UPDATE CASCADE,
    pay_amt INT,
    pay_date DATE,
    pay_mode VARCHAR
);

create table cart (
    cart_id VARCHAR(10) PRIMARY KEY,
    cus_id VARCHAR(10) references customer(cus_id) ON DELETE CASCADE ON UPDATE CASCADE
);

create table stores (
    stk_list VARCHAR[] ,
    cart_id VARCHAR(10) references cart(cart_id) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY(cart_id)
);
