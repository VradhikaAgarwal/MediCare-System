<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

				<li class="nav-item"><a class="nav-link active " href="index.jsp">HOME</a></li>
				<li class="nav-item"><a class="nav-link active" href="patient.jsp">PATIENT</a></li>
			</ul>
			
  
			<form class="d-flex">
				<div class="dropdown">
					<button class="btn btn-light dropdown-toggle" type="button"
						id="dropdownMenuButton1" data-bs-toggle="dropdown"
						area-expanded="false">
						<i class="fas fa-user-circle"></i> ${doctObj.fullName}</button>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
					<li><a class="dropdown-item" href="edit_profile.jsp">Edit Profile</a></li>
						<li><a class="dropdown-item" href="../doctorLogout">LogOut</a></li>
					</ul>
				</div>
			</form>
		</div>
	</div>
</nav>