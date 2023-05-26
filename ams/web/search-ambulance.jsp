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
    <jsp:include page="patient-header.jsp"></jsp:include>
        <div class="container-fluid" style="margin-bottom: 300px;">
            <div class="row pad-botm">
                <div class="col-md-12">
                    <div class="register-header"><h4 class="header-line"><b>Search Ambulance</b></h4></div>
                    <form class="form-inline" action="search-ambulance.jsp"
                          method="post">
                        <label for="email">Enter City.:</label> <input type="text"
                                                                       class="form-control" id="city" placeholder="Enter city"
                                                                       name="city">
                        <button type="submit" class="btn btn-primary">Search
                            Ambulance</button>
                    </form>

                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-md-12">
                <%
                    String bookAmbulance = (String) session.getAttribute("book-ambulance");
                    if (bookAmbulance != null) {
                        session.removeAttribute("book-ambulance");
                %>
                <div class="alert alert-success" id="success">Ambulance booking successfully.</div>
                <%
                    }
                %>
                <div class="panel panel-default">
                    <div class="panel-heading">View Ambulance</div>
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
                                        <th>Vehicle Status</th>
                                        <th>Book Ambulance</th>
                                    </tr>
                                </thead>
                                <%
                                    ResultSet resultset = DatabaseConnection
                                            .getResultFromSqlQuery("select * from tblambulance where city like '%" + request.getParameter("city") + "%' and status='Added' and booking_status='Available' ");
                                    while (resultset.next()) {
                                %>
                                <tbody>
                                    <tr class="default">
                                        <td><%=resultset.getString("id")%></td>
                                        <td><%=resultset.getString("ambulance_vehicle_no")%></td>
                                        <td><%=resultset.getString("ambulance_type")%></td>
                                        <td><%=resultset.getString("driver_name")%></td>
                                        <td><%=resultset.getString("driver_mobile")%></td>
                                        <td><%=resultset.getString("driver_lincense_no")%></td>
                                        <td><%=resultset.getString("state")%></td>
                                        <td><%=resultset.getString("city")%></td>

                                        <%
                                            if (resultset.getString("status").equals("Added")) {
                                        %>
                                        <td><span class="label label-success">Available</span></td>
                                        <td><a href="book-ambulance.jsp?avn=<%=resultset.getString("ambulance_vehicle_no")%>&name=<%=resultset.getString("driver_name")%>&license=<%=resultset.getString("driver_lincense_no")%>&driver_id=<%=resultset.getString("driver_id")%>"
                                               class="btn btn-warning">Book Ambulance</a></td>
                                            <%
                                            } else {
                                            %>
                                        <td><span class="label label-danger">Not Available</span></td>
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
<script type="text/javascript">
    $(function () {
        $('#success').delay(3000).show().fadeOut('slow');
    });
</script>
</html>