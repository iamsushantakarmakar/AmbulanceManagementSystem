package com.driver;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;
import static com.connection.DatabaseConnection.connection;
import java.io.InputStream;
import static java.lang.Integer.parseInt;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;
import oracle.jdbc.OracleDriver;

@MultipartConfig

/**
 * Servlet implementation class RequestToAddAmbulance
 */
@WebServlet("/RequestToAddAmbulance")
public class RequestToAddAmbulance extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        String avn = request.getParameter("vehicleNo");
        String ambulanceType = request.getParameter("ambulanceType");
        String licenseNo = request.getParameter("licenseNo");
        String driverName = request.getParameter("dname");
        String driverMobile = request.getParameter("mobile");
        String state = request.getParameter("state");
        String city = request.getParameter("city");
        int did = parseInt((String) session.getAttribute("did"));
        String status = "Pending";
        Part imagePart = request.getPart("aimage");
        InputStream inputStream = imagePart.getInputStream();
        try {

            Connection connection = DatabaseConnection.getConnection();

            ResultSet rs = DatabaseConnection.getResultFromSqlQuery("select * from tblambulance where driver_name='" + session.getAttribute("dname") + "' and driver_mobile='" + session.getAttribute("mobile") + "' ");

            if (rs.next()) {
                String message = "Can not Add more than one Ambulance.";
                session.setAttribute("no-ambulance", message);
                response.sendRedirect("add-ambulance-driver.jsp");
            } else {
                PreparedStatement pstmt = (PreparedStatement) connection.prepareStatement("insert into tblambulance(ambulance_vehicle_no,ambulance_type,driver_lincense_no,driver_name,driver_mobile,state,city,status,license_image,driver_id)values(?,?,?,?,?,?,?,?,?,?)");

                pstmt.setString(1, avn);
                pstmt.setString(2, ambulanceType);
                pstmt.setString(3, licenseNo);
                pstmt.setString(4, driverName);
                pstmt.setString(5, driverMobile);
                pstmt.setString(6, state);
                pstmt.setString(7, city);
                pstmt.setString(8, status);
                pstmt.setBlob(9, inputStream);
                pstmt.setInt(10, did);

                int requestAmbulance = pstmt.executeUpdate();

                if (requestAmbulance > 0) {
                    String message = "Ambulance added successfully, waiting for admin approval.";
                    session.setAttribute("add-ambulance", message);
                    response.sendRedirect("add-ambulance-driver.jsp");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
