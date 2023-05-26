<%@page import="java.util.Base64"%>
<%@page import="java.io.OutputStream"%>
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
    <jsp:include page="admin-header.jsp"></jsp:include>
        <div class="container">
            <div class="row pad-botm">
                <div class="col-md-12 register-header">
                    <h4 class="header-line"><b>Check Ambulance</b></h4>
                </div>
            </div>
            <div class="row">
                <div class="col-md-5 col-sm-5 col-xs-12">
                    <img src="images/check-ambulance.jpg" style="margin-top: 170px;">
                </div>
                <div class="col-md-7 col-sm-7 col-xs-12">
                    <div class="panel panel-info">
                        <div class="panel-heading">Check Ambulance</div>
                        <div class="panel-body">
                            <form role="form" action="ApproveAmbulance" method="post">
                            <%
                                byte[] imgData = null;
                                OutputStream img = null;
                                String encode = null;
                                ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tblambulance where id='" + request.getParameter("id") + "'");
                                while (resultset.next()) {
                            %>
                            <div class="form-group">
                                <label>Id</label> <input class="form-control" type="text"
                                                         name="id" value="<%=resultset.getString("id")%>" readonly />
                            </div>
                            <div class="form-group">
                                <label>Ambulance Vehicle No</label> <input class="form-control"
                                                                           type="text" name="avn" value="<%=resultset.getString("ambulance_vehicle_no")%>" readonly />
                            </div>
                            <div class="form-group">
                                <label>Ambulance Type</label> <input type="text"
                                                                     class="form-control" name="ambulanceType" value="<%=resultset.getString("ambulance_type")%>">
                            </div>
                            <div class="form-group">
                                <label>Driver Name </label> <input class="form-control"
                                                                   type="text" name="driverName" value="<%=resultset.getString("driver_name")%>" readonly />
                            </div>
                            <div class="form-group">
                                <label>Mobile No </label> <input class="form-control"
                                                                 type="text" name="mobile" value="<%=resultset.getString("driver_mobile")%>" readonly />
                            </div>
                            <div class="form-group">
                                <label>License No</label> <input class="form-control"
                                                                 type="text" name="licenseNo" value="<%=resultset.getString("driver_lincense_no")%>"/>
                            </div>
                            <%
                                Blob image = resultset.getBlob(12);
                                imgData = image.getBytes(1, (int) image.length());
                                encode = Base64.getEncoder().encodeToString(imgData);
                            %>
                            <div class="form-group">
                                <p><b>License Image</b></p> 
                                <img src="data:image/jpg;base64,<%=encode%>" width="150" height="150" id="pic" name="pic" alt="Lesence Image" style="padding-top: 10px;">
                            </div>
                            <div class="form-group">
                                <label>State</label> <input class="form-control" type="text"
                                                            name="state" value="<%=resultset.getString("state")%>"/>
                            </div>
                            <div class="form-group">
                                <label>City</label> <input class="form-control" type="text"
                                                           name="city" value="<%=resultset.getString("city")%>"/>
                            </div>
                            <div class="form-group">
                                <label>Status</label> <input class="form-control" type="text"
                                                             name="status" value="<%=resultset.getString("status")%>"/>
                            </div>
                            <button type="submit" class="btn btn-info">Add Ambulance
                            </button>
                            <%
                                }
                            %>
                        </form>
                    </div>
                </div>
            </div>

        </div>
    </div>
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