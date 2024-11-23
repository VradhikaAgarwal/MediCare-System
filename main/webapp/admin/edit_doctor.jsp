<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Specialist"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DbConnect"%>
<%@page import="com.dao.SpecialistDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor Panel</title>
<%@include file="../components/allCSS.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}

</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="container p-3">
		<div class="row">
		
		<!-- offset md-4 to make the card in center -->
			<div class="col-md-5 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Edit Doctor Details</p>

						<c:if test="${not empty errormsg}">
							<p class="fs-3 text-center text-danger">${errormsg}</p>
							<c:remove var="errormsg" scope="session" />
						</c:if>
						<c:if test="${not empty successmsg}">
							<div class="fs-3 text-center text-success" role="alert">${successmsg}</div>
							<c:remove var="successmsg" scope="session" />
						</c:if>
						
						<%
						int id=Integer.parseInt(request.getParameter("id"));
						DoctorDao dao2=new DoctorDao(DbConnect.getConn());
						Doctor d= dao2.getDoctorById(id);
						%>

					<!-- ../ is used to come out of the admin folder so that it can access updateDoctor servlet -->
							<form action="../updateDoctor" method="post">
								<div class="mb-3">
									<label class="form-label">Full Name</label> <input type="text"
										name="fullname" class="form-control" value="<%=d.getFullName() %> "required>
								</div>

								<div class="mb-3">
									<label class="form-label">DOB</label> <input type="date"
										name="dob" class="form-control" value="<%=d.getDob() %>"  required>
								</div>

								<div class="mb-3">
									<label class="form-label">Qualification</label> <input
										type="text" name="qualification" class="form-control" value="<%=d.getQualification()%>" required>
								</div>

								<div class="mb-3">
									<label class="form-label">Specialist</label> <select
										name="spec" class="form-control" required>
										<option><%=d.getSpecialist() %></option>
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
										name="email" class="form-control" value="<%=d.getEmail() %>" required>
								</div>

								<div class="mb-3">
									<label class="form-label">Mob No.</label> <input type="number"
										name="mobno" class="form-control" value="<%=d.getMobNo() %>" required>
								</div>

								<div class="mb-3">
									<label class="form-label">Password</label> <input
										type="text" name="password" class="form-control" value="<%=d.getPassword()  %>" required>
								</div>
								
								<!-- with the help of id we can fetch all details of the doctor from the database -->
								<input type="hidden" name="id" value="<%=d.getId() %>">
								
									<button type="submit" class="btn btn-primary col-md-12">Update</button><br>
						

							</form>
			
			
							<form action="viewlist.jsp" method="post">
				
									<button type="submit" class="btn btn-primary mt-2 col-md-12">View
										Details</button>
							
							</form>
						

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>