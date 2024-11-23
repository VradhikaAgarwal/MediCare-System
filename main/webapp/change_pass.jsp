<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change Password</title>
<%@include file="../components/allCSS.jsp"%>

<style type="text/css">
.paint-card {
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
</head>
<body>
	<%@include file="components/navbar.jsp"%>

	<c:if test="${ empty userObj }">
		<c:redirect url="user_login.jsp"></c:redirect>
	</c:if>

	<div class="container p-4">
		<div class="row">
			<div class="col-md-4 offset-md-4">


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

						<form action="userChangePassword" method="post">
							<div class="mb-3">
								<label>Enter New Password</label><input type="text"
									name="newPassword" class="form-control" required>
							</div>

							<div class="mb-3">
								<label>Enter Old Password</label><input type="text"
									name="oldPassword" class="form-control" required>
							</div>
							<input type="hidden" value="${ userObj.id }" name="uid">
							<button class="btn btn-primary col-md-12">Change
								Password</button>

						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>