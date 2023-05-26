<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<header class="header header_style_01">
    <nav class="megamenu navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <img src="images/logos/logo.png" class="logo" alt="LoGo" onclick="window.location.assign('admin-dashboard.jsp')">
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
                    <li><a class="active" href="admin-dashboard.jsp">Home</a></li>

                    <li><a class="btn-primary btn-radius btn-brd log" href="admin-ambulance-booking.jsp">Ambulances Booking</a></li>
                    <li><a class="btn-primary btn-radius btn-brd log" href="admin-view-patients-complaint-feedback.jsp">Patient Complaints/Feedback</a></li>
                    <li><a class="btn-primary btn-radius btn-brd log" href="admin-generate-report.jsp">Generate Reports</a></li>
                    <li><a class="btn-primary btn-radius btn-brd log" href="view-contacts-inquiry.jsp">View Contacts/Inquiry</a></li>
                    <li class="dropdown"><a class="dropdown-toggle"
                                            data-toggle="dropdown" href="#"><span class="caret"></span>View</a>
                        <ul class="dropdown-menu">
                            <li><a  href="admin-view-drivers.jsp">View Drivers</a></li>
                            <li><a  href="admin-view-ambulance.jsp">View Ambulances</a></li>
                            <li><a  href="admin-view-patient.jsp">View Patients</a></li>

                        </ul>
                    </li>
                    <li class="dropdown"><a class="dropdown-toggle"
                                            data-toggle="dropdown" href="#"><span class="caret"></span> My Account</a>
                        <ul class="dropdown-menu">
                            <li><a href="admin-profile.jsp">My Profile</a></li>
                            <li><a href="admin-change-password.jsp">Change Password</a></li>
                            <li><a href="logout.jsp">Logout</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>