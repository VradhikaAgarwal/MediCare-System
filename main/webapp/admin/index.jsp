<%@page import="com.db.DbConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<%@include file="../components/allCSS.jsp"%>
<style type="text/css">
.point-card {
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

	<c:if test="${empty adminObj }">
		<c:redirect url="../admin_login.jsp"></c:redirect>
	</c:if>


	<div class="container p-5">
		<p class="text-center fs-3">Admin Dashboard</p>
		
		<c:if test="${not empty successmsg}">
			<p class="text-center text-success fs-3">${successmsg}</p>
			<c:remove var="successmsg" scope="session" />
		</c:if>
		<c:if test="${not empty errormsg}">
			<p class="text-center text-danger fs-3">${errormsg}</p>
			<c:remove var="errormsg" scope="session" />
		</c:if>
		<%
		
		// to get the total number of all the things ... doctors,users,appointment,specialist
		
		DoctorDao dao=new DoctorDao(DbConnect.getConn());
		%>
		
		<div class="row">
			<div class="col-md-4">
				<div class="card point-card zoom-out ">
					<div class="card-body text-center text-success">
						<i class="fas fa-user-md fa-3x"></i><br>
						<p class="fs-4 text-center">
							Doctor<br><%=dao.countDoctor() %>
						</p>

					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card point-card zoom-out">
					<div class="card-body text-center text-success">
						<i class="fas fa-user-circle fa-3x"></i><br>
						<p class="fs-4 text-center">
							PATIENT<br><%=dao.countUser() %>
						</p>

					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card point-card zoom-out">
					<div class="card-body text-center text-success">
						<i class="fas fa-calendar-check fa-3x"></i><br>
						<p class="fs-4 text-center">
							Total Appointments<br><%=dao.countAppointment() %>
						</p>

					</div>
				</div>
			</div>
			<div class="col-md-4 mt-2">
				<div class="card point-card zoom-out " data-bs-toggle="modal"
					data-bs-target="#exampleModal">
					<div class="card-body text-center text-success">
						<i class="fas fa-calendar-check fa-3x"></i><br>
						<p class="fs-4 text-center">
							Specialist<br><%=dao.countSpecialist() %>
						</p>

					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="../addSpecialist" method="post">
						<div class="form-group">
							<label>Specialist name</label> <input type="text" name="specName"
								class="form-control">
							<div class="text-center mt-3">
							<button type="submit" class="btn btn-primary">Add</button>
							</div>
						</div>
					</form>


				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					
				</div>
			</div>
		</div>
	</div>

</body>
</html>