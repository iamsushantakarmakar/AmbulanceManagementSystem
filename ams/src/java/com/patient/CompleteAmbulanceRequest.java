/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.patient;

import com.connection.DatabaseConnection;
import java.io.IOException;
import static java.lang.Integer.parseInt;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author RVIN
 */
public class CompleteAmbulanceRequest extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = parseInt(request.getParameter("id"));

            int statusMode = DatabaseConnection.insertUpdateFromSqlQuery("update tblambulancebooking set status='Completed' where id='" + id + "'");
             int statusMode1 = DatabaseConnection.insertUpdateFromSqlQuery("update tblambulance set booking_status='Available' where ambulance_vehicle_no='" + request.getParameter("avn") + "'");

            if (statusMode > 0 && statusMode1 > 0) {
                response.sendRedirect("patient-request-driver-for-ambulance.jsp");
            } else {
                response.sendRedirect("patient-request-driver-for-ambulance.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
