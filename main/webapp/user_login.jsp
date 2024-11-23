<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Panel</title>
<%@include file="components/allCSS.jsp" %>
<style type="text/css">
.point-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
	transition: transform 0.3s ease;
}
.point-card:hover {
            transform: scale(1.05); /* Scale down slightly on hover */
        }
body {
    background-image: url('img/hospi2.jpg');
    background-size: cover;
    background-repeat: no-repeat;
    background-attachment: fixed;
    background-position: center center;
}
</style>
</head>
<body>
   <%@include file="components/navbar.jsp" %>
   <div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card point-card">
					<div class="card-body">
						<h2 class="fs-4 text-center">Patient Login</h2>
						
						<c:if test="${not empty successmsg}">
						     <p class="text-center text-success fs-3">${successmsg}</p>
						     <c:remove var="successmsg" scope="session"/>
						 </c:if>
						 <c:if test="${not empty errormsg}">
						     <p class="text-center text-danger fs-5">${errormsg}</p>
						     <c:remove var="errormsg" scope="session"/>
						 </c:if>
						 
						<form action="userLogin" method="post">
							<div class="mb-3">
								<label class="form-label">Email address</label> <input
									name="email" type="email" class="form-control" required>

							</div>
							<div class="mb-3">
								<label class="form-label">Password</label> <input
									name="new_pass" type="password" class="form-control" required>

							</div>

							<button type="submit" class="btn bg-primary text-white col-md-12">Login</button>


						</form>
						<br><a href="forgotPassword.jsp" class="text-decoration">Forget Password</a>
						<br>
						<br>Don't have an account? <a href="signup.jsp" class="text-decoration-none">click here</a>
					  
					</div>
				</div>


			</div>


		</div>


	</div>
</body>
</html>