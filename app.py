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
		inp = st.text_input('Enter customer id')
		submit = st.button("Submit")
		if submit and inp != "":
			cur.execute("select order_id, order_date, delivery_method, delivery_date from product_order where product_order.cus_id = '"+inp+"';")
			df = pd.DataFrame(cur.fetchall())
			df.columns = ['order_id', 'order_date', 'delivery_method', 'delivery_date']
                             
			st.table(df)
			
	elif(option == 'view payment details of a particular cust'):
		inp = st.text_input('Enter customer id')
		submit = st.button("Submit")
		if submit and inp != "":
			cur.execute("select pay_id, order_id, pay_amt, pay_mode, pay_date from payment where payment.cus_id = '"+inp+"';")
			df = pd.DataFrame(cur.fetchall())
			df.columns = ['Payment Id', 'Order Id', 'Amount', 'Payment Mode', 'Payment Date']
		                         
			st.table(df)
	
	'''#Finsih this part
	elif(option == 'inventory details'):
	elif(option == 'get payments on a particular date'):
	elif(option == 'list of all emp details'):
	elif(option == 'updating cust deets'):'''
	
	
#same thing for complex queries
#def complex_queries(username, pw):

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

