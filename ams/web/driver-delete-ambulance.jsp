<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.connection.*"%>
<%
	String Id=request.getParameter("id");
        String avn = request.getParameter("avn");
	int deleteDriver=DatabaseConnection.insertUpdateFromSqlQuery("delete from tblambulance where id='"+Id+"' and ambulance_vehicle_no='"+avn+"'");
	if(deleteDriver>0){
		response.sendRedirect("driver-view-ambulance.jsp");
	}
%>