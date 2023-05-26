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
					<div class="col-md-12">
						<h4 class="header-line">Details of Ambulance Application</h4>

					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="alert alert-default">
							<strong>An ambulance is a medically equipped vehicle
								which transports patients to treatment facilities, such as
								hospitals.Typically, out-of-hospital medical care is provided to
								the patient.</strong><br> <br>
							<div>
								<h4>This Ambulance Management System have 3 modules like a
									Patient,Ambulance Driver, Admin.</h4>
								<strong>Patient Module</strong>
								<ul class="list-group list-group-flush">
									<li class="list-group-item">Patient Create Own Account</li>
									<li class="list-group-item">Patient Login</li>
									<li class="list-group-item">Forgot Password</li>
									<li class="list-group-item">View Profile</li>
									<li class="list-group-item">Change Password</li>
									<li class="list-group-item">Patient search the ambulance
										after his login.</li>
									<li class="list-group-item">Patient book the ambulance.</li>
									<li class="list-group-item">Patient can check the status
										ambulance available or not.</li>
									<li class="list-group-item">Patient can see all ambulance.</li>
									<li class="list-group-item">Patient give feedback or
										complaint of ambulance.</li><br>
									<strong>Driver Module</strong>
									<ul class="list-group list-group-flush">
										<li class="list-group-item">Driver Create Own Account</li>
										<li class="list-group-item">Driver Login</li>
										<li class="list-group-item">Forgot Password</li>
										<li class="list-group-item">View Profile</li>
										<li class="list-group-item">Change Password</li>
										<li class="list-group-item">Driver send request to add
											his ambulance to Admin.</li>
										<li class="list-group-item">Driver can view his
											ambulances.</li>
										<li class="list-group-item">Driver can check his
											ambulance is added or not by Admin.</li>
										<li class="list-group-item">Driver can check patient
											ambulance request.</li>
									</ul>
									<strong>Admin Module</strong>
									<ul class="list-group list-group-flush">
										<li class="list-group-item">Admin Login</li>
										<li class="list-group-item">Forgot Password</li>
										<li class="list-group-item">View Profile</li>
										<li class="list-group-item">Change Password</li>
										<li class="list-group-item">View Drivers</li>
										<li class="list-group-item">View Ambulance</li>
										<li class="list-group-item">Patient Complaints/Feedback</li>
										<li class="list-group-item">View Patients</li>
										<li class="list-group-item">Generate Reports</li>
										<li class="list-group-item">a)All Ambulance Report</li>
										<li class="list-group-item">b)All Drivers Report</li>
										<li class="list-group-item">c)All Patients Report</li>
										<li class="list-group-item">d)Patient Ambulance Booking Report</li>
										<li class="list-group-item">e)Contact & Inquiry Report</li>
										<li class="list-group-item">f)Feedback & Complaint report</li>
										<li class="list-group-item">View Contacts/Inquiry</li>
									</ul>
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