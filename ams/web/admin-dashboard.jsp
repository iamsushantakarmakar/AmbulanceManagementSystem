<%@page import="java.sql.ResultSet"%>
<%@page import="com.connection.DatabaseConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
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
        if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
    %>
    <jsp:include page="admin-header.jsp"></jsp:include>
        <div class="container" style="margin-bottom: 160px;">
            <div class="row d-flex justify-content-center" style="margin-left: 30px;
                 padding-top: 31px;">
                <div class="col-sm-3">
                    <div class="card dynamic-card">
                        <div class="card-body">
                            <h5 class="card-title">Total Patient</h5>
                            <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                        <%
                            int patient = 0;
                            ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select count(*) from tblpatient");
                            if (resultset.next()) {
                                patient = resultset.getInt(1);
                            }
                        %>
                        <p class="card-text"><%=patient%></p>
                        <a href="admin-view-patient.jsp" class="card-link">View Details</a>
                    </div>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="card dynamic-card">
                    <div class="card-body">
                        <h5 class="card-title">Total Driver</h5>
                        <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                        <%
                            int driver = 0;
                            ResultSet resultset1 = DatabaseConnection.getResultFromSqlQuery("select count(*) from tbldriver");
                            if (resultset1.next()) {
                                driver = resultset1.getInt(1);
                            }
                        %>
                        <p class="card-text"><%= driver%></p>
                        <a href="admin-view-drivers.jsp" class="card-link">View Details</a>
                    </div>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="card dynamic-card">
                    <div class="card-body">
                        <h5 class="card-title">Total Ambulance</h5>
                        <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                        <%
                            int ambulance = 0;
                            ResultSet resultset2 = DatabaseConnection.getResultFromSqlQuery("select count(*) from tblambulance");
                            if (resultset2.next()) {
                                ambulance = resultset2.getInt(1);
                            }
                        %>
                        <p class="card-text"><%= ambulance%></p>
                        <a href="admin-view-ambulance.jsp" class="card-link">View Details</a>
                    </div>
                </div>
            </div>
            <%
                int totalAmbulance = 0;
                int bookedAmbulance = 0;
                ResultSet resultset3 = DatabaseConnection.getResultFromSqlQuery("select count(*) from tblambulance where status='Added'");
                if (resultset3.next()) {
                    totalAmbulance = resultset3.getInt(1);
                    ResultSet resultset4 = DatabaseConnection.getResultFromSqlQuery("select count(*) from tblambulance where booking_status='Booked'");
                    if (resultset4.next()) {
                        bookedAmbulance = resultset4.getInt(1);
                    }

                }
            %>
            <div class="col-sm-3">
                <div class="card dynamic-card">
                    <div class="card-body">
                        <h5 class="card-title">Avaliable Ambulance</h5>
                        <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                        <p class="card-text"><%=totalAmbulance - bookedAmbulance%></p>
                    </div>
                </div>
            </div>

        </div>
        <div class="row d-flex justify-content-center" style="margin-left: 30px;
             padding-top: 31px;">
            <div class="col-sm-3" style="margin-bottom: 40px;">
                <div class="card dynamic-card">
                    <div class="card-body">
                        <h5 class="card-title">Total Income</h5>
                        <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                        <%
                            int amount = 0;
                            ResultSet resultset5 = DatabaseConnection.getResultFromSqlQuery("select sum(admin_amount) from tblambulancebooking where status='Completed'");
                            if (resultset5.next()) {
                                amount = resultset5.getInt(1);
                            }

                        %>
                        <p class="card-text"><%= amount%></p>
                    </div>
                </div>
            </div>
        </div>
        <div>

            <div class="row admin-dashboard-table" style="margin-left: 22px;">
                <div class="col-md-12">
                    <!--    Context Classes  -->
                    <div class="panel panel-default">

                        <div class="panel-heading">All Ambulance</div>

                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Ambulance Vehicle No</th>
                                            <th>Ambulance Type</th>
                                            <th>Driver Name</th>
                                            <th>Mobile No</th>
                                            <th>License No</th>
                                            <th>State</th>
                                            <th>City</th>
                                            <th>Created At</th>
                                            <th>Vehicle Status</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <%
                                        ResultSet resultset4 = DatabaseConnection.getResultFromSqlQuery("select * from tblambulance where status='Pending'");
                                        while (resultset4.next()) {
                                    %>
                                    <tbody>
                                        <tr class="default">
                                            <td><%=resultset4.getString("id")%></td>
                                            <td><%=resultset4.getString("ambulance_vehicle_no")%></td>
                                            <td><%=resultset4.getString("ambulance_type")%></td>
                                            <td><%=resultset4.getString("driver_name")%></td>
                                            <td><%=resultset4.getString("driver_mobile")%></td>
                                            <td><%=resultset4.getString("driver_lincense_no")%></td>
                                            <td><%=resultset4.getString("state")%></td>
                                            <td><%=resultset4.getString("city")%></td>
                                            <td><%=resultset4.getString("created_at")%></td>
                                            <%
                                                if (resultset4.getString("status").equals("Pending")) {
                                            %>
                                            <td><span class="label label-danger"><%=resultset4.getString("status")%></span></td>

                                            <%
                                            } else {
                                            %><td><span class="label label-success"><%=resultset4.getString("status")%></span></td>

                                            <%
                                                }
                                            %>
                                            <td><a href="admin-check-ambulance.jsp?id=<%=resultset4.getString("id")%>" class="btn btn-info">Check It</a></td>
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
    </div>
    <br>

    <jsp:include page="footer.jsp"></jsp:include>
    <%
        } else {
            response.sendRedirect("index.jsp");
        }
    %>
</body>
</html>