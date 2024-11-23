<%@page import="com.entity.User"%>
<%@page import="com.dao.UserDAO"%>
<%@page import="com.entity.Doctor"%>
<%@page import="java.util.List"%>
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
<title>Patient Appointment</title>
<%@include file="components/allCSS.jsp"%>
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
 <script>
        function validateAppointmentDate() {
            var appointmentDate = new Date(document.getElementById("appointmentDate").value);
            var today = new Date();

            if (appointmentDate < today) {
                alert("Appointment dates must not precede today's date !!!");
                return false;
            }
            return true;
        }
        function validatePhoneNumber() {
            var phoneNumber = document.getElementById("contact").value;
            if (phoneNumber.length !== 10 || isNaN(phoneNumber)) {
                alert("Please enter a valid 10-digit phone number.");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
	<%@include file="components/navbar.jsp"%>
	<div class="container-fluid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>
	<div class="container p-3">
		<div class="row">


			<div class="col-md-7">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fw-bold text-center fs-3">Appointment</p>

						<c:if test="${not empty errormsg}">
							<p class="fs-5 text-center text-danger ">${errormsg}</p>
							<c:remove var="errormsg" scope="session" />
						</c:if>
						<c:if test="${not empty successmsg}">
							<p class="fs-5 text-center text-success ">${successmsg}</p>
							<c:remove var="successmsg" scope="session" />
						</c:if>

						<form class="row g-3" onsubmit="return validateAppointmentDate() && validatePhoneNumber()" action="addAppointment" method="post">

							<!-- to get the patients id who are already login -->

							<input type="hidden" name="userId" value="${userObj.id}">


							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Full Name</label> <input
									type="text" name="fullname" class="form-control" required>
							</div>

							<div class="col-md-6">
								<label>Gender</label> <select class="form-control" name="gender"
									required>
									<option value="male">Male</option>
									<option value="female">Female</option>
									<option value="other">Other</option>
								</select>
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Age</label> <input
									type="number" name="age" class="form-control" required>
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Appointment
									Date</label> <input type="date" id="appointmentDate" name="date"
									class="form-control" id="appointmentDate" required>
								
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Email</label> <input
									type="email" name="email" class="form-control" required>
							</div>
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Mobile No.</label> <input
									type="number" id="contact" maxlength="10" name="phno" class="form-control"
									required>
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Disease</label> <input
									type="text" name="diseases" class="form-control" required>
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Doctor</label> <select
									class="form-control" name="doct" required>
									<option value="">---select---</option>

									<%
									DoctorDao dao = new DoctorDao(DbConnect.getConn());
									List<Doctor> list = dao.getAllDoctor();
									for (Doctor d : list) {
									%>
									<option value="<%=d.getId()%>"><%=d.getFullName()%> (<%=d.getSpecialist()%>)
									</option>
									<%
									}
									%>


								</select>
							</div>
							<div class="col-md-12">
								<label>Full Address</label>
								<textarea name="address" rows="4" cols="" class="form-control"
									required></textarea>
							</div>
							<!-- to check if the user is registered or not if not registered means empty -->
							<c:if test="${empty userObj}">
								<a href="user_login.jsp"
									class="col-md-6 offset-md-3 btn btn-success">Submit</a>
							</c:if>

							<c:if test="${not empty userObj}">
								<button class="col-md-6 offset-md-3 btn btn-primary" >Submit</button>
							</c:if>


						</form>
					</div>
				</div>
			</div>
			<div class="col-md-5 p-5">
				<img alt="" src="img/doctor6.jpg">
			</div>

		</div>
	</div>
	<%@include file="components/footer.jsp"%>

</body>
</html>