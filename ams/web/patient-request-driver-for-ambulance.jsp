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
        if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
    %>
    <jsp:include page="driver-header.jsp"></jsp:include>
        <div class="container-fluid" style="margin-bottom: 350px;">
            <div class="row pad-botm">
                <div class="col-md-12 register-header">
                    <h4 class="header-line"><b>Patients Request For Ambulance</b></h4>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <!--    Context Classes  -->
                    <div class="panel panel-default">

                        <div class="panel-heading">Patients Request For Ambulance</div>

                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Patient Id</th>
                                            <th>Name</th>
                                            <th>Email Id</th>
                                            <th>Mobile</th>
                                            <th>Disease</th>
                                            <th>Ambulance Id</th>
                                            <th>Source Address</th>
                                            <th>Destination Address</th>
                                            <th>Distance</th>
                                            <th>Total Amount</th>
                                            <th>Your Amount</th>
                                            <th>Status</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                <%
                                    String avn = null;
                                    ResultSet rs = DatabaseConnection.getResultFromSqlQuery("select * from tblambulance where driver_name='" + session.getAttribute("dname") + "'");
                                    if (rs.next()) {
                                        avn = rs.getString("ambulance_vehicle_no");
                                    }
                                    System.out.println("avn " + avn);

                                    ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("SELECT * FROM tblpatient INNER JOIN tblambulancebooking ON tblpatient.patient_id=tblambulancebooking.patient_id where tblambulancebooking.avn = '" + avn + "'");
                                    while (resultset.next()) {
                                %>
                                <tbody>
                                    <tr class="default">
                                        <td><%=resultset.getString("patient_id")%></td>
                                        <td><%=resultset.getString("patient_name")%></td>
                                        <td><%=resultset.getString("patient_email")%></td>
                                        <td><%=resultset.getString("patient_mobile")%></td>
                                        <td><%=resultset.getString("patient_disease")%></td>
                                        <td><%=resultset.getString("avn")%></td>
                                        <td><%=resultset.getString("source_address")%></td>
                                        <td><%=resultset.getString("destination_address")%></td>
                                        <td><%=resultset.getString("distance")%></td>
                                        <td><%=resultset.getString("amount")%></td>
                                        <td><%=resultset.getString("driver_amount")%></td>
                                        <%
                                            if (resultset.getString("status").equals("Assigned")) {
                                        %>
                                        <td><span class="label label-success">Assigned</span></td>
                                        <%
                                        } else if (resultset.getString("status").equals("Decline")) {
                                        %>
                                        <td><span class="label label-danger">Declined</span></td>
                                        <%
                                        } else if (resultset.getString("status").equals("Completed")) {
                                        %>
                                        <td><span class="label label-info">Completed</span></td>

                                        <%
                                        } else {
                                        %>
                                        <td><span class="label label-danger">Pending</span></td>
                                        <%
                                            }
                                        %>
                                        <%
                                            if (resultset.getString("status").equals("Assigned")) {
                                        %>
                                        <td><a
                                                href="ManagePatientsAmbulanceRequest?id=<%=resultset.getString("id")%>&pantietId=<%=resultset.getString("patient_id")%>"><button
                                                    class="btn btn-danger"
                                                    onClick="return confirm('Are you sure, you want to cancel ambulance?');">Cancel</button></a></td>
                                        <td><a
                                                href="CompleteAmbulanceRequest?id=<%=resultset.getString("id")%>&avn=<%=resultset.getString("avn")%>"><button
                                                    class="btn btn-info"
                                                    onClick="return confirm('Are you sure?');">Complete</button></a></td>
                                                <%
                                                } else if (resultset.getString("status").equals("Pending")) {
                                                %>
                                        <td><a
                                                href="ManagePatientsAmbulanceRequest?id=<%=resultset.getString("id")%>&avn=<%=resultset.getString("avn")%>"><button
                                                    class="btn btn-primary"
                                                    >Assign</button></a></td>
                                                <%
                                                    }
                                                %>
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