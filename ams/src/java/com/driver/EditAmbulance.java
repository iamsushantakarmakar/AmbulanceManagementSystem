/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.driver;

import com.connection.DatabaseConnection;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Integer.parseInt;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author RVIN
 */
@WebServlet(name = "EditAmbulance", urlPatterns = {"/EditAmbulance"})
public class EditAmbulance extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        String ambulanceType = request.getParameter("ambulanceType");
        String city = request.getParameter("city");
        HttpSession session = request.getSession();
        try {
            if (city != null) {
                int editAmbulance = DatabaseConnection.insertUpdateFromSqlQuery("update tblambulance set ambulance_type='" + ambulanceType + "',city='" + city + "' where id='" + id + "' ");
                if (editAmbulance > 0) {
                    String message="Ambulance updated successfully.";
                    session.setAttribute("ambulance-update", message);
                    response.sendRedirect("driver-view-ambulance.jsp");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
