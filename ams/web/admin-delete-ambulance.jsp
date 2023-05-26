<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.connection.*"%>
<%
	String Id=request.getParameter("id");
	int deleteDriver=DatabaseConnection.insertUpdateFromSqlQuery("delete from tblambulance where id='"+Id+"'");
	if(deleteDriver>0){
		response.sendRedirect("admin-view-ambulance.jsp");
	}
%>