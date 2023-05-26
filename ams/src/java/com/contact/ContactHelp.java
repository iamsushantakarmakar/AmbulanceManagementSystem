package com.contact;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class ContactHelp
 */
@WebServlet("/ContactHelp")
public class ContactHelp extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id=1;
		HttpSession hs=request.getSession();
		String fname=request.getParameter("first_name");
		String lname=request.getParameter("last_name");
		String fullName=fname+" "+lname;
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		String comments=request.getParameter("comments");
		try {
			int help=DatabaseConnection.insertUpdateFromSqlQuery("insert into tblcontact(contact_id,name,email,mobile,message)values('"+id+"','"+fullName+"','"+email+"','"+phone+"','"+comments+"')");
			if(help>0) {
				String message="Thanks for contacting us! We will get in touch with you.";
				hs.setAttribute("message", message);
				response.sendRedirect("help.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
