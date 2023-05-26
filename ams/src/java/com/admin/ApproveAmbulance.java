package com.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class ApproveAmbulance
 */
@WebServlet("/ApproveAmbulance")
public class ApproveAmbulance extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String avn = request.getParameter("avn");
        String ava = "Available";
        try {
            int addAmbulance = DatabaseConnection.insertUpdateFromSqlQuery("update tblambulance set status='Added' where id='" + id + "' and ambulance_vehicle_no='" + avn + "'");
            int statusMode1 = DatabaseConnection.insertUpdateFromSqlQuery("update tblambulance set booking_status='" + ava + "' where ambulance_vehicle_no='" + avn + "'");

            if (addAmbulance > 0) {
                response.sendRedirect("admin-view-ambulance.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
