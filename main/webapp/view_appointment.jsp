<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DbConnect"%>
<%@page import="com.dao.AppointmentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Appointment</title>
<%@include file="../components/allCSS.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}

.backImg {
	background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
		url("img/hospi.jpg");
	height: 30vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>

</head>
<body>
	<%@include file="components/navbar.jsp"%>

	<c:if test="${ empty userObj }">
		<c:redirect url="user_login.jsp"></c:redirect>
	</c:if>

	<div class="container-fluid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-9">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 fw-bold text-center text-success ">Appointment
							List</p>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">Gender</th>
									<th scope="col">Age</th>
									<th scope="col">Appointment date</th>
									<th scope="col">Diseases</th>
									<th scope="col">Doctor Name</th>
									<th scope="col">Status</th>

								</tr>

							</thead>
							<tbody>
								<%
								//to get the id of the login patient so that through id , we can retrieve all details of the patient
								User user = (User) session.getAttribute("userObj");
								AppointmentDao dao = new AppointmentDao(DbConnect.getConn());

								//doctorDao to get the name of the particular doctor
								DoctorDao dao2 = new DoctorDao(DbConnect.getConn());

								//retrieving all details of the patient
								List<Appointment> list = dao.getAllAppointmentById(user.getId());
								for (Appointment ap : list) {
									Doctor d = dao2.getDoctorById(ap.getDoctorId());
								%>
								<tr>
									<th><%=ap.getFullName()%></th>
									<th><%=ap.getGender()%></th>
									<th><%=ap.getAge()%></th>
									<th><%=ap.getAppointDate()%></th>
									<th><%=ap.getDiseases()%></th>
									<th><%=d.getFullName()%></th>
									<th>
										<%
										if ("Pending".equals(ap.getStatus())) {
										%> <a href=""
										class="btn btn-sm btn-warning">Pending</a> <%
 } else {
 %> <%=ap.getStatus()%>

										<%
										}
										%>

									</th>
								</tr>

								<%
								}
								%>


							</tbody>
						</table>

					</div>
				</div>
			</div>
			<div class="col-md-3 p-3">
				<img alt="doctor" src="img/doctor3.png">

			</div>
		</div>

	</div>
</body>
</html>