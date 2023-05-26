<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.connection.*"%>
<!DOCTYPE html>
<html lang="en">

    <!-- Basic -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Mobile Metas -->
    <meta name="viewport"
          content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <!-- Site Metas -->
    <title>AMS</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Site Icons -->
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
    <link rel="apple-touch-icon" href="images/apple-touch-icon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Site CSS -->
    <link rel="stylesheet" href="style.css">
    <!-- Colors CSS -->
    <link rel="stylesheet" href="css/colors.css">
    <!-- ALL VERSION CSS -->
    <link rel="stylesheet" href="css/versions.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="css/responsive.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/custom.css">

    <!-- Modernizer for Portfolio -->
    <script src="js/modernizer.js"></script>

    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script
    src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script
    src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body class="host_version">
    <%
        String page_name = "admin-view-ambulance";
        if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
    %>
    <jsp:include page="admin-header.jsp"></jsp:include>
        <div class="container-fluid" style="margin-bottom: 334px;">
            <div class="row pad-botm">
                <div class="col-md-12 register-header">
                    <h4 class="header-line"><b>All Ambulance Booking Status</b></h4>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <!--    Context Classes  -->
                    <div class="panel panel-default">

                        <div class="panel-heading">All Ambulance Booking Status</div>

                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Patient Name</th>
                                            <th>Patient Email</th>
                                            <th>Patient Mobile</th>
                                            <th>Ambulance Vehicle No</th>
                                            <th>Driver Name</th>
                                            <th>License No</th>
                                            <th> Source City</th>
                                            <th>Destination City</th>
                                            <th>PickUp Time</th>
                                            <th>Created At</th>
                                            <th>Status</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                <%
                                    ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("SELECT * FROM tblpatient INNER JOIN tblambulancebooking ON tblpatient.patient_id=tblambulancebooking.patient_id");
                                    while (resultset.next()) {
                                %>
                                <tbody>
                                    <tr class="default">
                                        <td><%=resultset.getString("id")%></td>
                                        <td><%=resultset.getString("patient_name")%></td>
                                        <td><%=resultset.getString("patient_email")%></td>
                                        <td><%=resultset.getString("patient_mobile")%></td>
                                        <td><%=resultset.getString("avn")%></td>
                                        <td><%=resultset.getString("driver_name")%></td>
                                        <td><%=resultset.getString("driver_license")%></td>
                                        <td><%=resultset.getString("source_address")%></td>
                                        <td><%=resultset.getString("destination_address")%></td>
                                        <td><%=resultset.getString("pickup_time")%></td>
                                        <td><%=resultset.getString("created_at")%></td>
                                        <%
                                            if (resultset.getString("status").equals("Pending")) {
                                        %>
                                        <td><span class="label label-info"><%=resultset.getString("status")%></span></td>
                                            <%
                                            } else if (resultset.getString("status").equals("Assigned")) {
                                            %>
                                        <td><span class="label label-success"><%=resultset.getString("status")%></span></td>
                                            <%
                                            } else if (resultset.getString("status").equals("Declined")) {
                                            %>
                                        <td><span class="label label-danger"><%=resultset.getString("status")%></span></td>
                                            <%

                                            } else {
                                            %>
                                        <td><span class="label label-success"><%=resultset.getString("status")%></span></td>
                                            <%
                                                }
                                            %>
<!--                                        <td><%=resultset.getString("status")%></td>-->
                                        <td><a href="admin-delete-booking.jsp?id=<%=resultset.getString("id")%>" class="btn btn-danger">Remove Booking</a></td>

                                    </tr>
                                </tbody>
                                <%
                                    }
                                %>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
    <%
        } else {
            response.sendRedirect("index.jsp");
        }
    %>
</body>
</html>