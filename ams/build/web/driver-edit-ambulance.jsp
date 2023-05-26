<%@page import="java.util.Base64"%>
<%@page import="java.io.OutputStream"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.connection.*" %>
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
        <div class="container">
            <div class="row pad-botm">
                <div class="col-md-12 register-header">
                    <h4 class="header-line"><b>Edit Ambulance Details</b></h4>
                </div>
            </div>
            <div class="row">
                <div class="col-md-5 col-sm-5 col-xs-12">
                    <img src="images/ambulance-request.jpg"
                         style="width: 400px; height: 400px;">
                </div>
                <div class="col-md-7 col-sm-7 col-xs-12">
                <div class="panel panel-info">
                    <div class="panel-heading">Update Ambulance Details</div>
                    <%
                        byte[] imgData = null;
                        OutputStream img = null;
                        String encode = null;
                        String id = request.getParameter("id");
                        ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tblambulance where id='" + id + "'");
                        if (resultset.next()) {
                    %>
                    <div class="panel-body">
                        <form role="form" action="EditAmbulance" method="post">
                            <div class="form-group">
                                <label>Name</label> <input class="form-control" type="text"
                                                           name="dname" value="<%= session.getAttribute("dname")%>" readonly/>
                                <input type="text" name="id" value="<%=resultset.getInt("id")%>" style="display: none" />
                            </div>
                            <div class="form-group">
                                <label>Mobile No</label> <input class="form-control" type="text"
                                                                name="mobile" value="<%= session.getAttribute("mobile")%>" readonly/>
                            </div>
                            <div class="form-group">

                                <label>Ambulance Vehicle No</label> <input class="form-control"
                                                                           type="text" name="vehicleNo" value="<%=resultset.getString("ambulance_vehicle_no")%>" readonly/>
                            </div>
                            <div class="form-group">
                                <%
                                    String ambulance_type = resultset.getString("ambulance_type");
                                %>
                                <label>Ambulance Type</label> <select class="form-control"
                                                                      type="text" name="ambulanceType" required>
                                    <option <% if (ambulance_type.equals("Individual Ambulance")) {
                                            out.print("selected");
                                        } %> >Individual Ambulance</option>
                                    <option <% if (ambulance_type.equals("Cardiac Ambulance")) {
                                            out.print("selected");
                                        } %> >Cardiac Ambulance</option>
                                    <option <% if (ambulance_type.equals("Collective Ambulance")) {
                                            out.print("selected");
                                        } %> >Collective Ambulance</option>
                                    <option <% if (ambulance_type.equals("Mobile ICU Ambulance")) {
                                            out.print("selected");
                                        } %> >Mobile ICU Ambulance</option>
                                    <option <% if (ambulance_type.equals("Basic Life Support Ambulance")) {
                                            out.print("selected");
                                        }%> >Basic Life Support Ambulance</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>License No</label> <input class="form-control"
                                                                 type="text" name="licenseNo" value="<%=resultset.getString("driver_lincense_no")%>" readonly />
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
                            <%
                                String state = resultset.getString("state");
                            %>
                            <div class="form-group">
                                <label>State</label> <select class="form-control" name="state" readonly />
                                <option <% if(state.equals("Andhra Pradesh")) out.print("selected"); %> >Andhra Pradesh</option>
                                <option <% if(state.equals("Arunachal Pradesh")) out.print("selected"); %> >Arunachal Pradesh</option>
                                <option <% if(state.equals("Assam")) out.print("selected"); %> >Assam</option>
                                <option <% if(state.equals("Bihar")) out.print("selected"); %> >Bihar</option>
                                <option <% if(state.equals("Chhattisgarh")) out.print("selected"); %> >Chhattisgarh</option>
                                <option <% if(state.equals("Goa")) out.print("selected"); %> >Goa</option>
                                <option <% if(state.equals("Gujarat")) out.print("selected"); %> >Gujarat</option>
                                <option <% if(state.equals("Haryana")) out.print("selected"); %> >Haryana</option>
                                <option <% if(state.equals("Himachal Pradesh")) out.print("selected"); %> >Himachal Pradesh</option>
                                <option <% if(state.equals("Jharkhand")) out.print("selected"); %> >Jharkhand</option>
                                <option <% if(state.equals("Karnataka")) out.print("selected"); %> >Karnataka</option>
                                <option <% if(state.equals("Kerala")) out.print("selected"); %> >Kerala</option>
                                <option <% if(state.equals("Madhya Pradesh")) out.print("selected"); %> >Madhya Pradesh</option>
                                <option <% if(state.equals("Maharashtra")) out.print("selected"); %> >Maharashtra</option>
                                <option <% if(state.equals("Manipur")) out.print("selected"); %> >Manipur</option>
                                <option <% if(state.equals("Meghalaya")) out.print("selected"); %> >Meghalaya</option>
                                <option <% if(state.equals("Mizoram")) out.print("selected"); %> >Mizoram</option>
                                <option <% if(state.equals("Nagaland")) out.print("selected"); %> >Nagaland</option>
                                <option <% if(state.equals("Odisha")) out.print("selected"); %> >Odisha</option>
                                <option <% if(state.equals("Punjab")) out.print("selected"); %> >Punjab</option>
                                <option <% if(state.equals("Rajasthan")) out.print("selected"); %> >Rajasthan</option>
                                <option <% if(state.equals("Sikkim")) out.print("selected"); %> >Sikkim</option>
                                <option <% if(state.equals("Tamil Nadu")) out.print("selected"); %> >Tamil Nadu</option>
                                <option <% if(state.equals("Telangana")) out.print("selected"); %> >Telangana</option>
                                <option <% if(state.equals("Tripura")) out.print("selected"); %> >Tripura</option>
                                <option <% if(state.equals("Uttar Pradesh")) out.print("selected"); %> >Uttar Pradesh</option>
                                <option <% if(state.equals("Uttarakhand")) out.print("selected"); %> >Uttarakhand</option>
                                <option <% if(state.equals("West Bengal")) out.print("selected"); %> >West Bengal</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>City</label> <input class="form-control"
                                                           type="text" name="city" value="<%=resultset.getString("city")%>" required/>
                            </div>

                            <div>
                                <button type="submit" class="btn btn-info">Update
                                </button>
                                <a href="driver-view-ambulance.jsp" class="btn btn-danger" style="margin-left: 50px;" >Close</a>
                            </div>   

                        </form>
                    </div>
                    <%
                        }
                    %>
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