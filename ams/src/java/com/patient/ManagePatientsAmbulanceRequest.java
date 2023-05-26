package com.patient;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connection.DatabaseConnection;
import com.email.EmailUtility;
import static java.lang.Integer.parseInt;
import javax.servlet.ServletContext;

/**
 * Servlet implementation class ManagePatientsAmbulanceRequest
 */
@WebServlet("/ManagePatientsAmbulanceRequest")
public class ManagePatientsAmbulanceRequest extends HttpServlet {

    private String host;
    private String port;
    private String user;
    private String pass;

    public void init() {
        // reads SMTP server setting from web.xml file
        ServletContext context = getServletContext();
        host = "smtp.gmail.com";
        port = "587";
        user = "sushantakarmakar818@gmail.com";
        pass = "efdtififcnxxcfcg";
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int statusMode = 0;
            int statusMode1 = 0;
            String decline = "Decline";
            String assign = "Assigned";
            String book = "Booked";
            String ava = "Available";
            String message = "Ambulance Management System - Invoice";
            String patient_name = "";
            String email = "";

            ResultSet rs = DatabaseConnection.getResultFromSqlQuery("select * from tblambulancebooking where id='" + request.getParameter("id") + "' ");
            while (rs.next()) {
                if (rs.getString("status").equals("Pending")) {
                    String patient_id = rs.getString("patient_id");
                    ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tblpatient where patient_id='" + patient_id + "' ");
                    if (resultset.next()) {
                        patient_name = resultset.getString("patient_name");
                        email = resultset.getString("patient_email");
                    }
                    int distance = rs.getInt("distance");
                    String disease = rs.getString("patient_disease");
                    String source_address = rs.getString("source_address");
                    String destination_address = rs.getString("destination_address");
                    String pick_up = rs.getString("pickup_time");
                    float amount = rs.getFloat("amount");
                    String msg = "Hi " + patient_name + "," + System.lineSeparator() + System.lineSeparator() + "Your Patient Disease:" + disease + System.lineSeparator() + "From: " + source_address + System.lineSeparator() + "To: " + destination_address + System.lineSeparator() + "PickUp Time: " + pick_up + System.lineSeparator() + "Total Amount: " + amount + System.lineSeparator() + System.lineSeparator() + "Thank you." + System.lineSeparator() + "Ambulance Management System Team.";
                    EmailUtility.sendEmail(host, port, user, pass, email, message, msg);

                    statusMode = DatabaseConnection.insertUpdateFromSqlQuery("update tblambulancebooking set status='" + assign + "' where id='" + request.getParameter("id") + "'");
                    statusMode1 = DatabaseConnection.insertUpdateFromSqlQuery("update tblambulance set booking_status='" + book + "' where ambulance_vehicle_no='" + request.getParameter("avn") + "'");

                } else {
                    statusMode = DatabaseConnection.insertUpdateFromSqlQuery("update tblambulancebooking set status='" + decline + "' where id='" + request.getParameter("id") + "'");
                    statusMode1 = DatabaseConnection.insertUpdateFromSqlQuery("update tblambulance set booking_status='" + ava + "' where ambulance_vehicle_no='" + request.getParameter("avn") + "'");
                }

            }
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
