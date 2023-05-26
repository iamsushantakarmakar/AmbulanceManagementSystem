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
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;
import oracle.jdbc.OracleDriver;

@MultipartConfig

/**
 * Servlet implementation class DriverAccountCreate
 */
@WebServlet("/DriverAccountCreate")
public class DriverAccountCreate extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String driverId = request.getParameter("driverId");
        String dname = request.getParameter("dname");
        String demail = request.getParameter("demail");
        String dmobile = request.getParameter("dmobile");
        String daddress = request.getParameter("daddress");
        String uname = request.getParameter("uname");
        String upass = request.getParameter("upass");
        Part imagePart = request.getPart("dimage");
        InputStream inputStream = imagePart.getInputStream();
        HttpSession hs = request.getSession();

        try {
            Connection connection = DatabaseConnection.getConnection();

            PreparedStatement pstmt = (PreparedStatement) connection.prepareStatement("insert into tbldriver(driver_id,driver_name,driver_email,driver_mobile,driver_address,driver_image,uname,upass) values(?,?,?,?,?,?,?,?)");

            pstmt.setString(1, driverId);
            pstmt.setString(2, dname);
            pstmt.setString(3, demail);
            pstmt.setString(4, dmobile);
            pstmt.setString(5, daddress);
            pstmt.setBlob(6, inputStream);
            pstmt.setString(7, uname);
            pstmt.setString(8, upass);

            int driverAccount = pstmt.executeUpdate();
            if (driverAccount > 0) {
                String message = "Driver account created successfully.";
                hs.setAttribute("success-message", message);
                response.sendRedirect("driver-register.jsp");
            } else {
                response.sendRedirect("driver-register.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
