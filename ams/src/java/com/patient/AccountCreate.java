package com.patient;

import com.connection.DatabaseConnection;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import static com.connection.DatabaseConnection.connection;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.imageio.ImageIO;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;
import oracle.jdbc.OracleDriver;

@MultipartConfig

@WebServlet("/AccountCreate")
public class AccountCreate extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String patientId = request.getParameter("patientId");
        String pname = request.getParameter("patientName");
        String pemail = request.getParameter("emailId");
        String pgender = request.getParameter("gender");
        String pmobile = request.getParameter("mobile");
        String paddress = request.getParameter("address");
        String uname = request.getParameter("uname");
        String upass = request.getParameter("upass");
        // Assuming the image was uploaded as part of a form
        Part imagePart = request.getPart("pimage");
        InputStream inputStream = imagePart.getInputStream();

        try {
            Connection connection = DatabaseConnection.getConnection();
            HttpSession hs = request.getSession();

            PreparedStatement pstmt = (PreparedStatement) connection.prepareStatement("insert into tblpatient(patient_id,patient_name,patient_email,patient_gender,patient_mobile,patient_address,patient_image,uname,upass) VALUES (?,?,?,?,?,?,?,?,?)");

            pstmt.setString(1, patientId);
            pstmt.setString(2, pname);
            pstmt.setString(3, pemail);
            pstmt.setString(4, pgender);
            pstmt.setString(5, pmobile);
            pstmt.setString(6, paddress);
            pstmt.setBlob(7, inputStream);
            pstmt.setString(8, uname);
            pstmt.setString(9, upass);

            int patientAccount = pstmt.executeUpdate();
//            int patientAccount = DatabaseConnection.insertUpdateFromSqlQuery("insert into tblpatient(patient_id,patient_name,patient_email,patient_gender,patient_mobile,patient_address,patient_image,uname,upass) values('" + patientId + "','" + pname + "','" + pemail + "', '" + pgender + "' ,'" + pmobile + "','" + paddress + "','" + imageBlob + "' ,'" + uname + "','" + upass + "')");
            if (patientAccount > 0) {
                String message = "Patient account created successfully.";
                hs.setAttribute("success-message", message);
                response.sendRedirect("patient-register.jsp");
            } else {
                response.sendRedirect("patient-register.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
