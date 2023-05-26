<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.connection.DatabaseConnection"%>
<%@page import="java.util.Base64"%>
<%@page import="java.sql.Blob"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<header class="header header_style_01">
    <nav class="megamenu navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <img src="images/logos/logo.png" class="logo" alt="LoGo" onclick="window.location.assign('driver-dashboard.jsp')">
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
                    <li><a class="active" href="driver-dashboard.jsp">Home</a></li>
                    <li><a class="btn-primary btn-radius btn-brd log" href="patient-request-driver-for-ambulance.jsp">Patients Request For Ambulance</a></li>
                    <li><a class="btn-primary btn-radius btn-brd log" href="add-ambulance-driver.jsp">Add Ambulance</a></li>
                    <li><a class="btn-primary btn-radius btn-brd log" href="driver-view-ambulance.jsp">View Ambulance</a></li>
                    <li><a class="btn-primary btn-radius btn-brd log" href="driver-ambulance-status.jsp">Ambulance Status</a></li>
                        <%
                            byte[] imgData = null;
                            OutputStream img = null;
                            String encode = null;
                            ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select driver_image from tbldriver where uname='" + session.getAttribute("uname") + "' and driver_id='" + session.getAttribute("did") + "'");
                            if (resultset.next()) {
                                Blob image = resultset.getBlob(1);
                                imgData = image.getBytes(1, (int) image.length());
                                encode = Base64.getEncoder().encodeToString(imgData);
                            }
                        %>
                    <li class="dropdown"><a class="dropdown-toggle"
                                            data-toggle="dropdown" href="#"><span class="caret"></span><img src="data:image/jpg;base64,<%=encode%>" style="width: 35px; height: 30px; border-radius: 20px; "> </a>

                        <ul class="dropdown-menu">
                            <li><a href="driver-profile.jsp">My Profile</a></li>
                            <li><a href="driver-change-password.jsp">Change Password</a></li>
                            <li><a href="driver-edit-image.jsp" >Profile Picture</a></li>
                            <li><a href="logout.jsp">Logout</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>