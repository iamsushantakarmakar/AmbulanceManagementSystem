package com.driver;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class EditDriverProfile
 */
@WebServlet("/EditDriverProfile")
public class EditDriverProfile extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String dname=request.getParameter("dname");
		String email=request.getParameter("email");
		String mobile=request.getParameter("mobile");
		String address=request.getParameter("address");
		HttpSession session=request.getSession();
		try {
			int editProfile=DatabaseConnection.insertUpdateFromSqlQuery("update tbldriver set driver_name='"+dname+"',driver_email='"+email+"',driver_mobile='"+mobile+"',driver_address='"+address+"' where uname='"+session.getAttribute("uname")+"' and driver_id='"+session.getAttribute("did")+"'");
			if(editProfile>0) {
				String message="Profile updated successfully.";
				session.setAttribute("profile-update", message);
				response.sendRedirect("driver-profile.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
