import streamlit as st
import psycopg2
from streamlit import cursor
from datetime import date
from streamlit.state.session_state import SessionState
import pandas as pd

DATABASE = "inventory_management_system"
USER = "postgres"
HOST = "localhost"
PASSWORD = "myPassword"
PORT = '5432'


full_message_temp ="""
<div style="background-color:silver;overflow-x: auto; padding:10px;border-radius:5px;margin:10px;">
<p style="text-align:justify;color:black;padding:10px">{}</p>
</div>
"""

def read(username, pw):
    if(username != "" and pw != ""):
        con = psycopg2.connect(
            host='localhost',
            database='inventory_management_system',
            user=username,
            password=pw
        )
        cur = con.cursor()
        cur.execute(
            "select table_name from information_schema.tables where table_schema = 'public';")
        df = cur.fetchall()
        df = pd.DataFrame(df)
        df.columns = ["tables"]
        option = st.selectbox("Choose table", options=tuple(df["tables"]))
        cur.execute("select * from "+option+"")
        cur.execute(
            "select column_name from information_schema.columns where table_schema = 'public' and table_name='"+option+"'")
        col = [row[0] for row in cur]
        cur.execute("Select * from "+option)
        df = pd.DataFrame(cur.fetchall())
        df.columns = col
        st.table(df)
        cur.close()
        con.close()


def login(username, pw):
    try:
        if(username != "" and pw != ""):
            con = psycopg2.connect(
                host='localhost',
                database='inventory_management_system',
                user=username,
                password=pw
            )
            ROLE = username
            st.sidebar.info('\tlogged in as ' + ROLE)
            con.close()
            return True
    except psycopg2.OperationalError as e:
        st.sidebar.warning('\tnot logged in')
        st.error(e)
        return False


def simple_queries(username, pw):
    con = psycopg2.connect(
        host='localhost',
        database='inventory_management_system',
        user=username,
        password=pw
    )
    cur = con.cursor()
    queries = {'view product_order details of a particular cust', 'view payment details of a particular cust', 'inventory details','get payments on a particular date','list of all emp details','updating cust deets'}
    option = st.selectbox("Choose query", options=queries)

    if(option == 'view product_order details of a particular cust'):
        st.markdown(full_message_temp.format("Gets information of the orders of a customer"),unsafe_allow_html=True)
        inp = st.text_input('Enter customer id')
        submit = st.button("Submit")
        if submit and inp != "":
            cur.execute("select order_id, order_date, delivery_method, delivery_date from product_order where product_order.cus_id = '"+inp+"';")
            df = pd.DataFrame(cur.fetchall())
            df.columns = ['order_id', 'order_date', 'delivery_method', 'delivery_date']
            st.table(df)

    elif(option == 'view payment details of a particular cust'):
        st.markdown(full_message_temp.format("Gets information of the payments of a customer"),unsafe_allow_html=True)
        inp = st.text_input('Enter customer id')
        submit = st.button("Submit")
        if submit and inp != "":
            cur.execute("select pay_id, order_id, pay_amt, pay_mode, pay_date from payment where payment.cus_id = '"+inp+"';")
            df = pd.DataFrame(cur.fetchall())
            df.columns = ['Payment Id', 'Order Id', 'Amount', 'Payment Mode', 'Payment Date']
            st.table(df)

    elif (option == 'inventory details'):
        st.markdown(full_message_temp.format("Gets information of the inventory contents"),unsafe_allow_html=True)
        cur.execute("select * from inventory ;")
        df = pd.DataFrame(cur.fetchall())
        df.columns = ['inv_id', 'emp_id', 'inv_num', 'inv_desc', 'inv_items']
        st.table(df)
        # st.markdown(full_message_temp.format(v),unsafe_allow_html=True)

    elif (option == 'get payments on a particular date'):
        st.markdown(full_message_temp.format("gets infomration of all the payments done on a particular date"),unsafe_allow_html=True)
        inp = st.text_input('Enter date (YYYY-MM-DD)')
        cur.execute(f"select pay_id, order_id, pay_amt, pay_mode, pay_date from payment where payment.pay_date = '{inp}' ;")
        df = pd.DataFrame(cur.fetchall())
        df.columns = ['pay_id', 'order_id', 'pay_amt', 'pay_mode', 'pay_date']
        st.table(df)
        # st.markdown(full_message_temp.format(v),unsafe_allow_html=True)

    elif (option == 'list of all emp details'):
        st.markdown(full_message_temp.format("Gets information of the employees"),unsafe_allow_html=True)
        cur.execute("select emp_id, role_id, emp_mobile, emp_addr, emp_email, emp_name from employee ;")
        df = pd.DataFrame(cur.fetchall())
        df.columns = ['emp_id', 'role_id', 'emp_mobile', 'emp_addr', 'emp_email', 'emp_name']
        st.table(df)
        # st.markdown(full_message_temp.format(v),unsafe_allow_html=True)

    elif (option == 'updating cust deets'):
        st.markdown(full_message_temp.format("updates information of a particular customer"),unsafe_allow_html=True)
        mobile = st.text_input('Enter mobile')
        cus_id = st.text_input('Enter id')
        cur.execute(f"update customer set cus_mobile = '{mobile}' where cus_id = '{cus_id}';")
        cur.execute(f"select * from customer where cus_id = '{cus_id}';")
        df = pd.DataFrame(cur.fetchall())
        df.columns = ['cus_id', 'cus_mobile', 'cus_addr', 'cus_email', 'cus_name']
        st.table(df)

#same thing for complex queries
def complex_queries(username, pw):
    con = psycopg2.connect(
        host='localhost',
        database='inventory_management_system',
        user=username,
        password=pw
    )
    cur = con.cursor()
    queries = {"get all stock deets which is there in 3 cust's carts", 'get list of all emp who manage at least 1 inv or approved one payment', "for a particular emp list all the approved customer's emails",'get all inv that they have to visit for a particular cart','get payments such that a particular payment mode and delivery method is selected (nested)', 'get cost from stores'}
    option = st.selectbox("Choose query", options=queries)

    if (option == "get all stock deets which is there in 3 cust's carts"):
        st.markdown(full_message_temp.format("get all stock details which is there in 3 cust's carts"),unsafe_allow_html=True)
        cus_id1  = st.text_input('Enter id 1')
        cus_id2  = st.text_input('Enter id 2')
        cus_id3  = st.text_input('Enter id 3')

        cur.execute(f"select stk_id, stk_name, stk_desc from stock where stk_id in (select stk_id from stores where cart_id in (select cart_id from cart where cus_id = '{cus_id1}' or cus_id = '{cus_id2}' or cus_id = '{cus_id3}')) ;")
        df = pd.DataFrame(cur.fetchall())
        df.columns = ['stk_id', 'stk_name', 'stk_desc']
        st.table(df)

    elif (option == 'get list of all emp who manage at least 1 inv or approved one payment'):
        st.markdown(full_message_temp.format("get list of all emp who manage at least 1 inv or approved one payment"),unsafe_allow_html=True)
        cur.execute(f"select distinct employee.emp_id, employee.emp_name from employee where employee.emp_id in (select emp_id from inventory) or employee.emp_id in (select emp_id from payment where approval = 1) ;")
        df = pd.DataFrame(cur.fetchall())
        df.columns = ['emp_id', 'emp_name']
        st.table(df)

    elif (option == "for a particular emp list all the approved customer's emails"):
        st.markdown(full_message_temp.format("for a particular emp list all the approved customer's emails"),unsafe_allow_html=True)
        cur.execute(f"select cus_email from customer where cus_id in ( select cus_id from payment where approval =1 and emp_id in (select emp_id from employee));")
        df = pd.DataFrame(cur.fetchall())
        df.columns = ['cus_email']
        st.table(df)

    elif (option == 'get all inv that they have to visit for a particular cart'):
        st.markdown(full_message_temp.format("get all inv that they have to visit for a particular cart"),unsafe_allow_html=True)
        cart_id  = st.text_input('Enter cart id')
        cur.execute(f"select inv_id from stock where stk_id in (select stk_id from stores where cart_id = '{cart_id}');")
        df = pd.DataFrame(cur.fetchall())
        df.columns = ['inv_id']
        st.table(df)

    elif (option == "get payments such that a particular payment mode and delivery method is selected"):
        st.markdown(full_message_temp.format("get payments such that a particular payment mode and delivery method is selected"),unsafe_allow_html=True)
        pay_mode  = st.text_input('Enter pay_mode')
        delivery_method  = st.text_input('Enter delivery_method')
        cur.execute(f"select pay_id, cus_id, order_id, pay_amt, pay_mode, pay_date from payment where payment.pay_mode = '{pay_mode}' and payment.order_id in (select order_id from product_order where delivery_method = '{delivery_method}') ;")

    elif (option == 'get cost from stores'):
        st.markdown(full_message_temp.format("get cost from stores"),unsafe_allow_html=True)
        cart_id  = st.text_input('Enter cart id')
        cur.execute(f"select stk_name, stk_cost from stock where stk_id in (select stk_id from stores where cart_id = '{cart_id}') ;")
        df = pd.DataFrame(cur.fetchall())
        df.columns = ['stk_name', 'stk_cost']
        st.table(df)


title = st.container()
title.title('Inventory Management System')


st.title('Home Page')
with st.sidebar.form(key='loginform', clear_on_submit=True):
	st.sidebar.header('Already have an Account?')
	option = st.sidebar.text_input('Username')
	passw = st.sidebar.text_input('password', placeholder="Enter password", type='password')
	st.sidebar.button('sign in', key='login')

ref = st.container()
login(option, passw)
page = st.sidebar.selectbox('Choose page', options=('read', 'simple queries', 'complex queries'))
with ref:
	if passw == '' or option == '':
	    st.warning('please enter password and username')
	else:
		try:
			if page == 'read':
				st.header('Select')
				read(option, passw)
			elif page == 'simple queries':
				st.header('Simple queries')
				simple_queries(option, passw)
			elif page == 'complex queries':
				st.header('Complex queries')
				complex_queries(option, passw)
		except psycopg2.errors.InFailedSqlTransaction as e:
			print(e)
		except psycopg2.OperationalError as e:
			print(e)
		except psycopg2.errors.InsufficientPrivilege as e:
			print(e)

