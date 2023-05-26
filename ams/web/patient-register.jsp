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
    <jsp:include page="header.jsp"></jsp:include><br>
        <div class="container">
            <div class="row pad-botm">
                <div class="col-md-12 register-header">
                    <h4 class="header-line"><b>Patient Registration</b></h4>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 col-sm-6 col-xs-12">
                    <img src="images/patient-registration.jpg">
                </div>
                <div class="col-md-6 col-sm-6 col-xs-12">
                <%
                    String adminRegister = (String) session.getAttribute("success-message");
                    if (adminRegister != null) {
                        session.removeAttribute("success-message");
                %>
                <div class="alert alert-success" id="success">Patient account
                    created successfully.</div>
                    <%
                        }
                    %>
                <div class="panel panel-info">
                    <div class="panel-heading">Create Patient Account</div>
                    <div class="panel-body">
                        <form role="form" action="AccountCreate" method="post" name='patientRegister' enctype="multipart/form-data">
                            <div class="form-group" style="display: none">
                                <label>Patient Id</label>
                                <%
                                    String patientId = DatabaseConnection.generatePatientId();
                                %>
                                <input class="form-control" type="text" value="<%=patientId%>"
                                       name="patientId" readonly />
                            </div>
                            <div class="form-group">
                                <label>Patient Name</label> <input class="form-control"
                                                                   type="text" name="patientName" required/>
                            </div>
                            <div class="form-group">
                                <label>Email Id</label> <input class="form-control" type="email"
                                                               name="emailId" required/>
                            </div>
                            <div class="form-group">
                                <label>Gender</label> <select class="form-control"
                                                              type="text" name="gender" required>
                                    <option>Male</option>
                                    <option>Female</option>
                                    <option>Other</option>

                                </select>
                            </div>
                            <div class="form-group">
                                <label>Mobile No</label> <input class="form-control" type="number"
                                                                name="mobile" id="txtMB"
                                                                required/>
                                <p id="phone-error" style="display:none; color:red;">Phone number must be 10 digits long.</p>
                            </div>
                            <div class="form-group">
                                <label>Address</label> <textarea class="form-control" type="text"
                                                                 name="address" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>User Name</label> <input class="form-control" type="text"
                                                                name="uname" required/>
                            </div>
                            <div class="form-group">
                                <label>Password</label> <input class="form-control"
                                                               type="password" name="upass" required/>
                            </div>
                            <div class="form-group">
                                <label>Image</label> <input class="form-control"
                                                            type="file" name="pimage" id="picfile" onchange="document.getElementById('pic').src = window.URL.createObjectURL(this.files[0]);" required/>
                                <img src="" width="150" height="150" id="pic" name="pic" alt="No image Choce" style="padding-top: 10px;">
                            </div>
                            <div class="form-check form-switch check-box">
                                <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault" required onclick="funCheck(this)">
                                <label class="form-check-label check-box-label" for="flexSwitchCheckDefault" >I Agree To The Term & Conditions</label>
                            </div>
                            <div class="btn-sub">           
                                <button type="submit" class="btn btn-info" id="btnValidate" disabled>Create
                                    Account</button>
                                <button type="reset" class="btn btn-danger btn-reset" id="btnReset">Reset</button>
                                <span class="already"><b>Already
                                        registered?</b><a class="for-pwd" href="patient-login.jsp">Please Login</a></span>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<br>
<br>
<br>
<br>

<jsp:include page="footer.jsp"></jsp:include>
<script type="text/javascript">
    $(function () {
        $('#danger').delay(3000).show().fadeOut('slow');
    });
    $(function () {
        $('#success').delay(3000).show().fadeOut('slow');
    });
    $(function () {
        $('#info').delay(3000).show().fadeOut('slow');
    });</script>
<script>

    const phoneInput = document.getElementById("txtMB");
    const phoneError = document.getElementById("phone-error");

    phoneInput.addEventListener("change", function () {
        const phoneNumber = phoneInput.value;

        if (phoneNumber.length !== 10) {
            phoneError.style.display = "block";
            phoneInput.value = "";
        } else {
            phoneError.style.display = "none";
        }
    });

    function funCheck(chk)
    {
        if (chk.checked)
            document.getElementById("btnValidate").disabled = false;
        else
            document.getElementById("btnValidate").disabled = true;
    }
</script>
</body>
</html>