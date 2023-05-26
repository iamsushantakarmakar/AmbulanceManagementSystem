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
        <div class="container">
            <div class="row pad-botm">
                <div class="col-md-12 register-header">
                    <h4 class="header-line"><b>Application For Book Ambulance</b></h4>
                </div>
            </div>
        <%
            String avn = request.getParameter("avn");
            String driver_name = request.getParameter("name");
            String driver_license = request.getParameter("license");
            String driver_id = request.getParameter("driver_id");
        %>
        <div class="row">
            <div class="col-md-5 col-sm-5 col-xs-12">
                <img src="images/book-ambulance.jpg"
                     style="width: 450px; padding-top: 40px;">
            </div>
            <div class="col-md-7 col-sm-7 col-xs-12">
                <div class="panel panel-info">
                    <div class="panel-heading">Application For Book Ambulance</div>
                    <div class="panel-body">
                        <form role="form" action="BookAmbulance" method="post">
                            <div class="form-group">
                                <label>Patient Disease</label>
                                <textarea name="pdisease" class="form-control" rows="3"></textarea>
                            </div>
                    </div>
                    <div class="form-group">
                        <label>Ambulance Vehicle No</label> <input type="text"
                                                                   class="form-control" name="vehicleNo" value="<%=avn%>" readonly>
                    </div>
                    <div class="form-group">
                        <label>driver Name</label> <input type="text" 
                                                          class="form-control" name="driverName" value="<%=driver_name%>" readonly>
                    </div>
                    <div class="form-group">
                        <label>Ambulance Vehicle License No</label> <input type="text"
                                                                           class="form-control" name="vehicleLicense" value="<%=driver_license%>" readonly>

                        <div class="form-group">
                            <label>Source Address</label> <textarea class="form-control"
                                                                    type="text" name="scity" ></textarea>
                        </div>
                        <div class="form-group">
                            <label>Destination Address</label> <textarea class="form-control"
                                                                         type="text" name="dcity" ></textarea>
                        </div>
                        <div class="form-group">
                            <label>Distance In Km.</label> <input class="form-control"
                                                                   type="number" name="distance" />
                        </div>
                        <div class="form-group">
                            <label>PickUp Time</label> <input class="form-control"
                                                              type="datetime-local" name="pickuptime" />
                        </div>
                        <button type="submit" class="btn btn-info">Book
                            Ambulance</button>
                        </form>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <br>
    <br>
    <br>
    <jsp:include page="footer.jsp"></jsp:include>
    <%
        } else {
            response.sendRedirect("index.jsp");
        }
    %>
</body>
</html>