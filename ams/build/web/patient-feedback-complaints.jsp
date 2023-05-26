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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body class="host_version">
	<%
		if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
	%>
	<jsp:include page="patient-header.jsp"></jsp:include><br>
	<div class="container">
		<div class="content-wrapper">
			<div class="container">
				<div class="row pad-botm">
					<div class="col-md-12 register-header">
                                            <h4 class="header-line"><b>Patient Feedback/Complaint</b></h4>

					</div>

				</div>
				<div class="container">
					<div class="row">
						<div class="col-md-5 col-sm-5 col-xs-12">
							<img src="images/feedback-complaint.jpg"
								style="width: 400px; height: 400px; margin-top: 110px;">
						</div>
						<div class="col-md-7 col-sm-7 col-xs-12">
							<div class="panel panel-info">
								<div class="panel-heading">Patient Feedback/Complaint</div>
								<div class="panel-body">
									<form role="form" action="AddFeedback" method="post">
										<div class="form-group">
											<label>Patient Id</label> <input type="text"
												class="form-control" name="patientId"
												value="<%=session.getAttribute("pid")%>" readonly>
										</div>
										<div class="form-group">
											<label>Patient Name</label> <input class="form-control"
												type="text" name="patientName"
												value="<%=session.getAttribute("pname")%>" readonly />
										</div>
										<div class="form-group">
											<label>Mobile No</label> <input class="form-control"
												type="text" name="patientMobile"
												value="<%=session.getAttribute("mobile")%>" readonly />
										</div>
										<div class="form-group">
											<label>Ambulance Vehicle No </label> <input
												class="form-control" type="text" name="avn" value="" />
										</div>
										<div class="form-group">
											<label>Driver Name</label> <input class="form-control"
												type="text" name="dname" value="" />
										</div>
										<div class="form-group">
											<label>Select Feedback Or Complaint</label> <select
												class="form-control" name="type">
												<option>- Select -</option>
												<option>Feedback</option>
												<option>Complaint</option>
											</select>
										</div>
										<div class="form-group">
											<label>Feedback OR Complaint</label>
											<textarea class="form-control" rows="3" name="feedback"></textarea>
										</div>
										<button type="submit" class="btn btn-info">Submit</button>
									</form>
								</div>
							</div>
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