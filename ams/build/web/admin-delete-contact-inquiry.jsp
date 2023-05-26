<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.connection.*"%>
<%
	String id=request.getParameter("id");
	int deleteDriver=DatabaseConnection.insertUpdateFromSqlQuery("delete from tblcontact where contact_id='"+id+"'");
	if(deleteDriver>0){
		response.sendRedirect("view-contacts-inquiry.jsp");
	}
%>