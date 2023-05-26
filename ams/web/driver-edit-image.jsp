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
    <jsp:include page="driver-header.jsp"></jsp:include>
        <div class="container" >
            <div class="row pad-botm">
                <div class="col-md-12 register-header">
                    <h4 class="header-line"><b>My Profile</b></h4>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 col-sm-6 col-xs-12">
                    <img src="images/my-profile.jpg"
                         >                                     
                </div>

                <div class="col-md-6 col-sm-6 col-xs-12">
                <%
                    String success = (String) session.getAttribute("profile-update");
                    if (success != null) {
                        session.removeAttribute("profile-update");
                %>
                <div class="alert alert-success" id="success">Your profile Image updated successfully.</div>
                <%
                    }
                %>
                <div class="panel panel-default">
                    <div class="panel-heading">My Profile</div>
                    <div class="panel-body">
                        <form role="form" action="EditDriverProfileImage" method="post" enctype="multipart/form-data">
                            <%
                                byte[] imgData = null;
                                OutputStream img = null;
                                String encode = null;
                                ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tbldriver where uname='" + session.getAttribute("uname") + "' and driver_id='" + session.getAttribute("did") + "'");
                                while (resultset.next()) {
                            %>
                                                        <div class="form-group">
                                <label>Full Name</label> <input class="form-control" type="text"
                                                                name="dname" value="<%=resultset.getString("driver_name")%>" readonly />
                            </div>
                            <div class="form-group">
                                <label>Email Id</label> <input class="form-control" name="email"
                                                               type="text" value="<%=resultset.getString("driver_email")%>" readonly />
                            </div>
                            <%
                                Blob image = resultset.getBlob(10);
                                imgData = image.getBytes(1, (int) image.length());
                                encode = Base64.getEncoder().encodeToString(imgData);
                            %>
                            <div class="form-group">
                                <p><b>License Image</b></p> <input class="form-control"
                                                                   type="file" name="dimage" id="picfile" onchange="document.getElementById('pic').src = window.URL.createObjectURL(this.files[0]);" required /> 
                                <img src="data:image/jpg;base64,<%=encode%>" width="150" height="150" id="pic" name="pic" alt="Lesence Image" style="padding-top: 10px;">
                            </div>

                            <button type="submit" class="btn btn-info">Update
                                Profile</button>
                                <%
                                    }
                                %>
                        </form>
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