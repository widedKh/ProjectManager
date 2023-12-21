<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Project Manqger Sign In</title>

</head>
<body>

	<div id="login-box">
		<div class="left">
			<h2>Welcome Back project manager!</h2>
			<p>Login to your account</p>
			<form:form action="/login" method="post" modelAttribute="newLogin" class="form-group">
			  <form:input name="email" path="email" type="email"
						class="form-control" placeholder="E-mail" />
					<form:errors path="email" class="text-danger" />
			
					<form:input name="password" path="password" type="password"
						class="form-control" placeholder="Password" />
					<form:errors path="password" class="text-danger" />
					
					
				<input type="submit" name="signup_submit" value="Sign In" />
	
		</form:form>
			</div>
		<div class="right"style="height:400px;">
			<span class="loginwith">
<h1>New Here?</h1>

<p class="intro-text"> Sign Up and expand your business with us</p>
</span>
		<a href="/">	<button class="social-signin facebook">SIGN UP</button></a>
			
		</div>
		<div class="or">OR</div>
	</div>
</body>
</html>