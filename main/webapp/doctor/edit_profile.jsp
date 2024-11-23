<%@page import="com.entity.Specialist"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DbConnect"%>
<%@page import="com.dao.SpecialistDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>
<%@include file="../components/allCSS.jsp"%>

<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
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

	<div class="container p-4">
		<div class="row">
			<div class="col-md-4">


				<div class="card paint-card">
					<div class="card-body">
						<h2 class="text-center fs-3">Change Password</h2>

						<c:if test="${not empty successmsg}">
							<p class="text-center text-success fs-4">${successmsg}</p>
							<c:remove var="successmsg" scope="session" />
						</c:if>
						<c:if test="${not empty errormsg}">
							<p class="text-center text-danger fs-4">${errormsg}</p>
							<c:remove var="errormsg" scope="session" />
						</c:if>

						<form action="../doctChangePassword" method="post">
							<div class="mb-3">
								<label>Enter New Password</label><input type="text"
									name="newPassword" class="form-control" required>
							</div>

							<div class="mb-3">
								<label>Enter Old Password</label><input type="text"
									name="oldPassword" class="form-control" required>
							</div>
							<input type="hidden" value="${ doctObj.id }" name="uid">
							<button class="btn btn-primary col-md-12">Change
								Password</button>

						</form>

					</div>
				</div>
			</div>
			<div class="col-md-5 offset-md-2">
				<div class="card paint-card">
					<div class="card-body">
					<h2 class="text-center fs-3">Edit Profile</h2>
					
					<c:if test="${not empty successMsg}">
							<p class="text-center text-success fs-4">${successMsg}</p>
							<c:remove var="successMsg" scope="session" />
						</c:if>
						<c:if test="${not empty errorMsg}">
							<p class="text-center text-danger fs-4">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						
						<form action="../doctorEditProfile" method="post">
								<div class="mb-3">
									<label class="form-label">Full Name</label> <input type="text"
										name="fullname" class="form-control" value="${ doctObj.fullName }" required>
								</div>

								<div class="mb-3">
									<label class="form-label">DOB</label> <input type="date"
										name="dob" class="form-control" value="${ doctObj.dob }" required>
								</div>

								<div class="mb-3">
									<label class="form-label">Qualification</label> <input
										type="text" name="qualification" class="form-control" value="${ doctObj.qualification }" required>
								</div>

								<div class="mb-3">
									<label class="form-label">Specialist</label> <select
										name="spec" class="form-control" required>
										<option> ${doctObj.specialist }</option>
										<%
										SpecialistDao dao = new SpecialistDao(DbConnect.getConn());
										List<Specialist> list = dao.getAllSpecialist();
										for (Specialist s : list) {
										%>
										<option><%=s.getSpecialistName()%></option>
										<%
										}
										%>

									</select>
								</div>

								<div class="mb-3">
									<label class="form-label">Email</label> <input type="email"
										name="email" class="form-control" value="${ doctObj.email }" readonly>
								</div>

								<div class="mb-3">
									<label class="form-label">Mob No.</label> <input type="number"
										name="mobno" class="form-control" value="${ doctObj.mobNo }" required>
								</div>

								   <input type="hidden" name="id" value="${ doctObj.id }">
									<button type="submit" class="btn btn-primary col-md-12">Update Details</button><br>
						

							</form>
			
					
					
					
					</div>
				</div>

			</div>
		</div>
	</div>


</body>
</html>