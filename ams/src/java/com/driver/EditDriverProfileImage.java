/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.driver;

import com.connection.DatabaseConnection;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig

/**
 *
 * @author RVIN
 */

@WebServlet(name = "EditDriverProfileImage", urlPatterns = {"/EditDriverProfileImage"})


public class EditDriverProfileImage extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Part imagePart = request.getPart("dimage");
        InputStream inputStream = imagePart.getInputStream();
        HttpSession session = request.getSession();

        try {
            Connection connection = DatabaseConnection.getConnection();

            PreparedStatement pstmt = (PreparedStatement) connection.prepareStatement("update tbldriver set driver_image=?  where uname='" + session.getAttribute("uname") + "' and driver_id='" + session.getAttribute("did") + "'");

            pstmt.setBlob(1, inputStream);

            int driverAccount = pstmt.executeUpdate();
            if (driverAccount > 0) {
                String message = "Driver Profile Image successfully.";
                session.setAttribute("profile-update", message);
                response.sendRedirect("driver-edit-image.jsp");
            } else {
                response.sendRedirect("driver-register.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
