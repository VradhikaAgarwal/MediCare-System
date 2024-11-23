<%@page import="com.db.DbConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>MediCare Services</title>
<%@include file="components/allCSS.jsp"%>
<link href="components/style.css" rel="stylesheet" type="text/css"/>

<style type="text/css">
.point-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="components/navbar.jsp"%>
	

	<div id="carouselExampleIndicators" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="img/hos.jpg" class="d-block w-100" alt="doctor"
					height="550px">
			</div>
			<div class="carousel-item">
				<img src="img/doctr.jpg" class="d-block w-100" alt="doctor"
					height="550px">
			</div>
			<div class="carousel-item">
				<img src="img/medi.jpg" class="d-block w-100" alt="medi"
					height="550px">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>
	<div class="container p-3">
		<h1 class="text-center fs-2 mt-2">Key Features of our Hospital</h1>

		<div class="row ">
			<div class="col-md-8 p-5">
				<div class="row">
					<div class="col-md-6 mt-2">
						<div class="card point-card">
							<div class="card-body">
								<h4 class="fs-5">100% Safety</h4>
								<p>Robust multi-factor authentication and role-based access control ensure only authorized users access the system</p>
							</div>
						</div>
					</div>

					<div class="col-md-6 mt-2">
						<div class="card point-card">
							<div class="card-body">
								<h4 class="fs-5">Clean Environment</h4>
								<p>Strict adherence to hygiene and sanitation standards to maintain a clean and healthy environment for patients and staff.</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 mt-4">
						<div class="card point-card">
							<div class="card-body">
								<h4 class="fs-5">Friendly Doctors</h4>
								<p> Our doctors prioritize patient well-being by actively listening and addressing individual concerns with empathy and understanding.</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 mt-4">
						<div class="card point-card">
							<div class="card-body">
								<h4 class="fs-5">Medical Research</h4>
								<p>Partnering with leading medical institutions and researchers to foster collaborative studies and share groundbreaking findings.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<img alt="doctor" src="img/doctor3.png" height="340px" width="360px">
			</div>
		</div>
	</div>

	<hr>

	<div class="container p-2">
		<h1 class="text-center fs-2">Our Team</h1>

		<div class="row">
			<div class="col-md-3 ">

				<div class="card point-card">
					<div class="card-body text-center">
						<img alt="" class="center-image" src="img/doctor4.jpg" width="250px" height="300px">
						<p class="fw-bold fs-5">Nishant Agarwal</p>
						<p class="fs-7">(CEO & Chairman)</p>
					</div>
				</div>
			</div>


			<div class="col-md-3">
				<div class="card point-card">
					<div class="card-body text-center">
						<img alt="" class="center-image" src="img/doctor5.jpg" width="250px" height="300px">
						<p class="fw-bold fs-5">Deepali Garg</p>
						<p class="fs-7">Co-Founder</p>

					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card point-card">
					<div class="card-body text-center">
						<img alt="" class="center-image" src="img/doctor6.jpg" width="250px" height="300px">
						<p class="fw-bold fs-5">Sanjana Singh</p>
						<p class="fs-7">Founder</p>

					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card point-card">
					<div class="card-body text-center">
						<img alt="" class="center-image" src="img/doctor.jpg" width="250px" height="300px">
						<p class="fw-bold fs-5">Nitesh Chopra</p>
						<p class="fs-7">Vice- President</p>

					</div>
				</div>
			</div>
		</div>

	</div>
<%@include file="components/footer.jsp" %>

</body>
</html>