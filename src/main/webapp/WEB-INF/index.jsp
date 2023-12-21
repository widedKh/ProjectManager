<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<script src="/script/script.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<meta charset="ISO-8859-1">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.12/css/intlTelInput.min.css">
    <!-- Other scripts -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.12/js/intlTelInput.min.js"></script>
<title>Project manger Sign Up</title>

</head>
<body>

	<div id="register-box">
		<div class="left">
			<h1>Sign up</h1>
			<form:form action="/register" method="post"
				modelAttribute="newUser" class="form-group">
				
					
				
				
					<form:input name="firstName" path="firstName" class="form-control"
						placeholder="First name" />
					<form:errors path="firstName" class="text-danger" />
				
					<form:input name="lastName" path="lastName" class="form-control"
						placeholder="Last name" />
					<form:errors path="lastName" class="text-danger" />
			
					
					<form:input name="email" path="email" type="email"
						class="form-control" placeholder="E-mail" />
					<form:errors path="email" class="text-danger" />
			
					<form:input name="password" path="password" type="password"
						class="form-control" placeholder="Password" />
					<form:errors path="password" class="text-danger" />
			
					<form:input name="confirm" path="confirm" type="password"
						placeholder="Retype password" class="form-control" />
					<form:errors path="confirm" class="text-danger" />
			

				<input type="submit" name="signup_submit" value="Sign me up" />
	
		</form:form>
			</div>
		<div class="right">
			<span class="loginwith">
<h1>Welcome Page</h1>

<p class="intro-text">Sign in to continue access</p>
</span>
		<a href="/login">	<button class="social-signin facebook">SIGN IN</button></a>
			
		</div>
		<div class="or">OR</div>
	</div>


</body>
</html>