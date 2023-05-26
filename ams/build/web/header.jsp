<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<header class="header header_style_01">
	<nav class="megamenu navbar navbar-default">
		<div class="container">
			<div class="navbar-header">
                            <img src="images/logos/logo.png" class="logo" alt="LoGo" onclick="window.location.assign('index.jsp')">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
                            
				<ul class="nav navbar-nav navbar-right">
					<li><a class="active" href="index.jsp">Home</a></li>
					<li><a class="btn-primary btn-radius btn-brd log" href="patient-login.jsp"><i
							class="flaticon-padlock"></i> Patient Login</a></li>
					<li><a class="btn-primary btn-radius btn-brd log" href="driver-login.jsp"><i
							class="flaticon-padlock"></i> Driver Login</a></li>
					<li><a class="btn-primary btn-radius btn-brd log" href="admin-login.jsp"><i
							class="flaticon-padlock"></i> Admin Login</a></li>
					<li><a href="help.jsp">Contact Us</a></li>
				</ul>
			</div>
		</div>
	</nav>
</header>