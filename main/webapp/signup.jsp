<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up Page</title>
<%@include file="components/allCSS.jsp"%>
<style type="text/css">
.point-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}

body {
	background-image: url('img/hospi2.jpg');
	background-size: cover;
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-position: center center;
}
</style>
 <script>
        function validatePasswords() {
            var newPassword = document.getElementById("newPass").value;
            var confirmPassword = document.getElementById("confirmPass").value;

            if (newPassword !== confirmPassword) {
                alert("New Password and Confirm Password do not match.");
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
	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card point-card">
					<div class="card-body">
						<h1 class="fs-4 text-center">Patient Register</h1>

						<!-- here JSTL is used for displaying registered success and error msgs -->
						<c:if test="${not empty successmsg}">
							<p class="text-center text-success fs-3">${successmsg}</p>
							<c:remove var="successmsg" scope="session" />
						</c:if>
						<c:if test="${not empty errormsg}">
							<p class="text-center text-danger fs-3">${errormsg}</p>
							<c:remove var="errormsg" scope="session" />
						</c:if>

						<form onsubmit="return validatePasswords() && validatePhoneNumber()" action="user_register" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label> <input
									name="fullname" type="text" class="form-control" required>

							</div>
							<div class="mb-3">
								<label class="form-label">Contact No.</label> <input
									name="contact" id="contact" type="number" class="form-control" required>

							</div>
							<div class="mb-3">
								<label class="form-label">Email address</label> <input
									name="email" type="email" class="form-control" required>

							</div>
							<div class="mb-3">
								<label class="form-label">New Password</label> <input
									name="newPass" id="newPass" type="password"
									class="form-control" required>

							</div>
							<div class="mb-3">
								<label class="form-label">Confirm Password</label> <input
									name="confirmPass" id="confirmPass" type="password"
									class="form-control" required>

							</div>

							<button type="submit" class="btn bg-primary text-white col-md-12">Register</button>
							

						</form>

					</div>
				</div>

			</div>

		</div>

	</div>



</body>
</html>