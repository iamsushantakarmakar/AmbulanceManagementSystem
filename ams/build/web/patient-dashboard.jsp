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
    <jsp:include page="patient-header.jsp"></jsp:include>
        <div class="container" style="margin-bottom: 350px;">
            <div class="row d-flex justify-content-center" style="margin-left: 30px;
                 padding-top: 31px;">
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
                <div class="card dynamic-card" style="width: 400px; height: 200px;">
                    <div class="card-body">
                        <h5 class="card-title">Avaliable Ambulance</h5>
                        <h6 class="card-subtitle mb-2 text-muted">Ambulance You can Book</h6>
                        <p class="card-text"><%=totalAmbulance - bookedAmbulance%></p>
                    </div>
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