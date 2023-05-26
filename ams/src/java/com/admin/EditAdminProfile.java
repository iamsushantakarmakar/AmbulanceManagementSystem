package com.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class EditAdminProfile
 */
@WebServlet("/EditAdminProfile")
public class EditAdminProfile extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String uname = request.getParameter("uname");
        HttpSession session = request.getSession();
        try {
            int editProfile = DatabaseConnection.insertUpdateFromSqlQuery("update tbladmin set email='" + email + "', uname='" + uname + "' where uname='" + session.getAttribute("uname") + "'");
            if (editProfile > 0) {
                session.setAttribute("uname", uname);
                String message = "Profile updated successfully.";
                session.setAttribute("profile-update", message);
                response.sendRedirect("admin-profile.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}