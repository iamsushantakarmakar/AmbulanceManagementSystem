<%@page import="java.util.Base64"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.connection.DatabaseConnection"%>
<%@page import="java.io.OutputStream"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<header class="header header_style_01">
    <nav class="megamenu navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <img src="images/logos/logo.png" class="logo" alt="LoGo" onclick="window.location.assign('patient-dashboard.jsp')">
                <button type="button" class="navbar-toggle collapsed"
                        data-toggle="collapse" data-target="#navbar" aria-expanded="false"
                        aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span> <span
                        class="icon-bar"></span> <span class="icon-bar"></span> <span
                        class="icon-bar"></span>
                </button>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li><a class="active" href="patient-dashboard.jsp">Home</a></li>
                    <li><a class="btn-primary btn-radius btn-brd log"
                           href="search-ambulance.jsp">Search Ambulance</a></li>
                    <li><a class="btn-primary btn-radius btn-brd log"
                           href="patient-view-ambulances.jsp">View Ambulances</a></li>
                    <li><a class="btn-primary btn-radius btn-brd log"
                           href="patient-view-ambulance-status.jsp">Booking Ambulance
                            Status</a></li>
                    <li><a class="btn-primary btn-radius btn-brd log"
                           href="patient-feedback-complaints.jsp">Feedback/Complaints</a></li>
                    <!--					<li><a class="btn-primary btn-radius btn-brd log"
                                                                    href="details-ambulance-application.jsp">Help</a></li>-->
                    <%
                        byte[] imgData = null;
                        OutputStream img = null;
                        String encode = null;
                        ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select patient_image from tblpatient where uname='" + session.getAttribute("uname") + "' and patient_id='" + session.getAttribute("pid") + "'");
                        if (resultset.next()) {
                            Blob image = resultset.getBlob(1);
                            imgData = image.getBytes(1, (int) image.length());
                            encode = Base64.getEncoder().encodeToString(imgData);

                        }
                    %>
                    <li class="dropdown"><a class="dropdown-toggle"
                                            data-toggle="dropdown" href="#"><span class="caret"></span><img src="data:image/jpg;base64,<%=encode%>" style="width: 35px; height: 30px; border-radius: 20px; "> </a>
                        <ul class="dropdown-menu">
                            <li><a href="patient-profile.jsp">My Profile</a></li>
                            <li><a href="patient-change-password.jsp">Change Password</a></li>
                            <li><a href="patient-edit-image.jsp" >Profile Picture</a></li>
                            <li><a href="logout.jsp">Logout</a></li>
                        </ul>
                    </li>
            </div>
        </div>
    </nav>
</header>