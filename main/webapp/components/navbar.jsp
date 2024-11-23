<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

 <style>
        .bg-ocean-blue {
            background-color: #0077be; /* Ocean blue color */
        }
    </style>

<nav class="navbar navbar-expand-lg navbar-dark bg-ocean-blue sticky-top">
	<div class="container-fluid">
		<a class="navbar-brand" href="index.jsp"><i
			class="fa-solid fa-house-chimney-medical"></i> Medi Care</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">

				<!-- If user is not Login  -->
				<c:if test="${empty userObj }">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="admin_login.jsp"><i
							class="fa-solid fa-right-to-bracket"></i> ADMIN</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="doctor_login.jsp">DOCTOR</a></li>
					<!-- 			<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#">APPOINTMENT</a></li> -->
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="user_login.jsp">NEW PATIENT</a></li>


				</c:if>
				<!-- if user object is not empty i.e User is Login -->
				<c:if test="${not empty userObj }">

					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="user_appointment.jsp">APPOINTMENT</a></li>

					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="view_appointment.jsp">VIEW APPOINTMENT</a></li>

					<form class="d-flex">
						<div class="dropdown">
							<button class="btn btn-light dropdown-toggle" type="button"
								id="dropdownMenuButton1" data-bs-toggle="dropdown"
								area-expanded="false">
								<i class="fas fa-user-circle"></i> ${userObj.fullName}
							</button>
							<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
							    <li><a class="dropdown-item" href="change_pass.jsp">Change Password</a></li>
								<li><a class="dropdown-item" href="userLogout">LogOut</a></li>
							</ul>
						</div>
					</form>



				</c:if>

			</ul>
		</div>
	</div>
</nav>