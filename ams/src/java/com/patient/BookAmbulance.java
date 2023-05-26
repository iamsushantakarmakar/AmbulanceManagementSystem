package com.patient;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;
import static java.lang.Integer.parseInt;

/**
 * Servlet implementation class BookAmbulance
 */
@WebServlet("/BookAmbulance")
public class BookAmbulance extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pdisease = request.getParameter("pdisease");
        String avn = request.getParameter("vehicleNo");
        String scity = request.getParameter("scity");
        String ambulance_status = "Pending";
        String dcity = request.getParameter("dcity");
        String pickup_time = request.getParameter("pickuptime");
        String driver_name = request.getParameter("driverName");
        String driver_license = request.getParameter("vehicleLicense");
        int dis = parseInt(request.getParameter("distance"));
        
        float amount = dis * 10;
        double driver_amount = amount * 0.7;
        float admin_amount = (float) (amount-driver_amount);
        

        HttpSession session = request.getSession();
        try {
            int ambulanceBook = DatabaseConnection.insertUpdateFromSqlQuery(
					"insert into tblambulancebooking(patient_id,patient_disease, source_address, avn, destination_address,pickup_time,status, driver_name, driver_license, distance, amount, driver_amount, admin_amount)values('"
							+ session.getAttribute("pid") + "','" + pdisease + "','" + scity + "','" + avn + "','" + dcity + "','"
							+ pickup_time + "','" + ambulance_status+ "', '"+driver_name+"','"+driver_license+"', '"+dis+"','"+amount+"','"+driver_amount+"','"+admin_amount+"')");
            
            if (ambulanceBook > 0) {
                String message = "Ambulance booking successfully.";
                session.setAttribute("book-ambulance", message);
                response.sendRedirect("search-ambulance.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
