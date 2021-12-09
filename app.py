import streamlit as st
import psycopg2
from streamlit import cursor
from datetime import date
from streamlit.state.session_state import SessionState

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

def exec(role, query):
    connection = psycopg2.connect(database=DATABASE,user=role,password = PASSWORD,host=HOST,port=PORT)
    connection.autocommit = True
    cursor = connection.cursor()
    sql = f"""{query}"""
    cursor.execute(sql)
    value = cursor.fetchall()
    connection.commit()
    connection.close()
    return value

def main_menu():
    roles = ["emp", "mover", "cust", "admin", "accountant", "hr"]
    role = st.sidebar.selectbox("Role",roles)
    query=st.text_input("Enter query",key='query')
    st.markdown(full_message_temp.format(f"{query} {role}"), unsafe_allow_html=True)
    value = exec(role, query)
    st.markdown(full_message_temp.format(f"{value}"), unsafe_allow_html=True)
    print(role, query)

main_menu()
