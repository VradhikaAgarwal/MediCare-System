<%@page import="com.entity.Doctor"%>
<%@page import="com.db.DbConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor Dashboard</title>
<%@include file="../components/allCSS.jsp"%>

<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
.zoom-out {
    transition: transform 0.2s ease-in-out;
}

.zoom-out:hover {
    transform: scale(1.05);
}
body {
    background-image: url('../img/hospi2.jpg');
    background-size: cover;
    background-repeat: no-repeat;
    background-attachment: fixed;
    background-position: center center;
}

</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<c:if test="${empty doctObj}">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>
	<% 
	Doctor d= (Doctor)session.getAttribute("doctObj");
	DoctorDao dao= new DoctorDao(DbConnect.getConn()); %>

	<h2 class="text-center fs-3 mt-5">Doctor Dashboard</h2>
	<div class="container p-4">
		<div class="row">
			<div class="col-md-4 offset-md-2">
				<div class="card paint-card zoom-out">
					<div class="card-body text-center text-success">
						<i class="fas fa-user-md fa-3x"></i><br>
						<p class="fs-4 text-center">Doctor
						<br><%=dao.countDoctor() %>
						</p>
					</div>
				</div>
			</div>
			
			<div class="col-md-4">
				<div class="card paint-card zoom-out">
					<div class="card-body text-center text-success">
						<i class="fas fa-calendar-check fa-3x"></i><br>
						<p class="fs-4 text-center">Total Appointment
						<br><%=dao.countAppointmentById(d.getId()) %>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>