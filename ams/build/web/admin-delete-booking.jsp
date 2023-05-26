<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.connection.*"%>
<%
	String id=request.getParameter("id");
	int deleteDriver=DatabaseConnection.insertUpdateFromSqlQuery("delete from tblambulancebooking where id='"+id+"'");
	if(deleteDriver>0){
		response.sendRedirect("admin-ambulance-booking.jsp");
	}
%>