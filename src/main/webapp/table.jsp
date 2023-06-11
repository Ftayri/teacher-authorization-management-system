<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<!DOCTYPE html>
	<html lang="en">

	<head>

		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta name="description" content="">
		<meta name="author" content="">

		<title>SB Admin 2 - Tables</title>

		<!-- Custom fonts for this template -->
		<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.0/css/all.min.css" rel="stylesheet"
			type="text/css">
		<link
			href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
			rel="stylesheet">

		<!-- Custom styles for this template -->
		<link href="<c:url value='/css/sb-admin-2.min.css'/>" rel="stylesheet">

		<!-- Custom styles for this page -->
		<link href="https://cdn.datatables.net/1.13.4/css/dataTables.bootstrap4.min.css" rel="stylesheet">




	</head>

	<body id="page-top">

		<!-- Page Wrapper -->
		<div id="wrapper">

			<!-- Sidebar -->
			<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

				<!-- Sidebar - Brand -->
				<a class="sidebar-brand d-flex align-items-center justify-content-center"
					href="ProfessorListController">
					<div class="sidebar-brand-icon rotate-n-0">
						<i class="fas fa-user-shield"></i>
					</div>
					<div class="sidebar-brand-text mx-3">
						Admin
					</div>
				</a>

				<!-- Divider -->
				<hr class="sidebar-divider my-0">

				<!-- Nav Item - Dashboard -->

				<li class="nav-item active"><a class="nav-link" href="ProfessorListController"> <i
							class="fas fa-fw fa-table"></i>
						<span>Professors List</span></a>
				</li>

				<!-- Divider -->

				<!-- Heading -->


				<!-- Divider -->
				<hr class="sidebar-divider">

				<!-- Heading -->
				<div class="sidebar-heading">Authorization</div>

				<!-- Nav Item - Pages Collapse Menu -->



				<!-- Nav Item - Tables -->
				<li class="nav-item"><a class="nav-link" href="DocumentController">
						<i class="far fa-file-pdf fa-lg"></i> <span>Generate Authorization</span>
					</a></li>

				<!-- Divider -->
				<hr class="sidebar-divider d-none d-md-block">

				<!-- Sidebar Toggler (Sidebar) -->
				<div class="text-center d-none d-md-inline">
					<button class="rounded-circle border-0" id="sidebarToggle"></button>
				</div>

			</ul>
			<!-- End of Sidebar -->

			<!-- Content Wrapper -->
			<div id="content-wrapper" class="d-flex flex-column">

				<!-- Main Content -->
				<div id="content">

					<!-- Topbar -->
					<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

						<!-- Sidebar Toggle (Topbar) -->
						<form class="form-inline">
							<button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
								<i class="fa fa-bars"></i>
							</button>
						</form>

						<!-- Topbar Navbar -->
						<ul class="navbar-nav ml-auto">

							<!-- Nav Item - Search Dropdown (Visible Only XS) -->
							<li class="nav-item dropdown no-arrow d-sm-none"><a class="nav-link dropdown-toggle"
									href="#" id="searchDropdown" role="button" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false"> <i class="fas fa-search fa-fw"></i>
								</a> <!-- Dropdown - Messages -->
								<div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
									aria-labelledby="searchDropdown">
									<form class="form-inline mr-auto w-100 navbar-search">
										<div class="input-group">
											<input type="text" class="form-control bg-light border-0 small"
												placeholder="Search for..." aria-label="Search"
												aria-describedby="basic-addon2">
											<div class="input-group-append">
												<button class="btn btn-primary" type="button">
													<i class="fas fa-search fa-sm"></i>
												</button>
											</div>
										</div>
									</form>
								</div>
							</li>

							<!-- Nav Item - Alerts -->
							<li class="nav-item dropdown no-arrow mx-1"><a class="nav-link dropdown-toggle" href="#"
									id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false"> <i class="fas fa-bell fa-fw"></i> <!-- Counter - Alerts -->
									<span class="badge badge-danger badge-counter">3+</span>
								</a> <!-- Dropdown - Alerts -->
								<div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
									aria-labelledby="alertsDropdown">
									<h6 class="dropdown-header">Alerts Center</h6>
									<a class="dropdown-item d-flex align-items-center" href="#">
										<div class="mr-3">
											<div class="icon-circle bg-primary">
												<i class="fas fa-file-alt text-white"></i>
											</div>
										</div>
										<div>
											<div class="small text-gray-500">December 12, 2019</div>
											<span class="font-weight-bold">A new monthly report is
												ready to download!</span>
										</div>
									</a> <a class="dropdown-item d-flex align-items-center" href="#">
										<div class="mr-3">
											<div class="icon-circle bg-success">
												<i class="fas fa-donate text-white"></i>
											</div>
										</div>
										<div>
											<div class="small text-gray-500">December 7, 2019</div>
											$290.29 has been deposited into your account!
										</div>
									</a> <a class="dropdown-item d-flex align-items-center" href="#">
										<div class="mr-3">
											<div class="icon-circle bg-warning">
												<i class="fas fa-exclamation-triangle text-white"></i>
											</div>
										</div>
										<div>
											<div class="small text-gray-500">December 2, 2019</div>
											Spending Alert: We've noticed unusually high spending for your
											account.
										</div>
									</a> <a class="dropdown-item text-center small text-gray-500" href="#">Show All
										Alerts</a>
								</div>
							</li>

							<!-- Nav Item - Messages -->
							<li class="nav-item dropdown no-arrow mx-1"><a class="nav-link dropdown-toggle" href="#"
									id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false"> <i class="fas fa-envelope fa-fw"></i>
									<!-- Counter - Messages --> <span class="badge badge-danger badge-counter">7</span>
								</a> <!-- Dropdown - Messages -->
								<div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
									aria-labelledby="messagesDropdown">
									<h6 class="dropdown-header">Message Center</h6>
									<a class="dropdown-item d-flex align-items-center" href="#">
										<div class="dropdown-list-image mr-3">
											<img class="rounded-circle" src="img/undraw_profile_1.svg" alt="...">
											<div class="status-indicator bg-success"></div>
										</div>
										<div class="font-weight-bold">
											<div class="text-truncate">Hi there! I am wondering if
												you can help me with a problem I've been having.</div>
											<div class="small text-gray-500">Emily Fowler · 58m</div>
										</div>
									</a> <a class="dropdown-item d-flex align-items-center" href="#">
										<div class="dropdown-list-image mr-3">
											<img class="rounded-circle" src="img/undraw_profile_2.svg" alt="...">
											<div class="status-indicator"></div>
										</div>
										<div>
											<div class="text-truncate">I have the photos that you
												ordered last month, how would you like them sent to you?</div>
											<div class="small text-gray-500">Jae Chun · 1d</div>
										</div>
									</a> <a class="dropdown-item d-flex align-items-center" href="#">
										<div class="dropdown-list-image mr-3">
											<img class="rounded-circle" src="img/undraw_profile_3.svg" alt="...">
											<div class="status-indicator bg-warning"></div>
										</div>
										<div>
											<div class="text-truncate">Last month's report looks
												great, I am very happy with the progress so far, keep up the
												good work!</div>
											<div class="small text-gray-500">Morgan Alvarez · 2d</div>
										</div>
									</a> <a class="dropdown-item d-flex align-items-center" href="#">
										<div class="dropdown-list-image mr-3">
											<img class="rounded-circle"
												src="https://source.unsplash.com/Mv9hjnEUHR4/60x60" alt="...">
											<div class="status-indicator bg-success"></div>
										</div>
										<div>
											<div class="text-truncate">Am I a good boy? The reason I
												ask is because someone told me that people say this to all
												dogs, even if they aren't good...</div>
											<div class="small text-gray-500">Chicken the Dog · 2w</div>
										</div>
									</a> <a class="dropdown-item text-center small text-gray-500" href="#">Read More
										Messages</a>
								</div>
							</li>

							<div class="topbar-divider d-none d-sm-block"></div>

							<!-- Nav Item - User Information -->
							<li class="nav-item dropdown no-arrow"><a class="nav-link dropdown-toggle" href="#"
									id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false"> <span
										class="mr-2 d-none d-lg-inline text-gray-600 small">Douglas
										McGee</span> <img class="img-profile rounded-circle"
										src="img/undraw_profile.svg">
								</a> <!-- Dropdown - User Information -->
								<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
									aria-labelledby="userDropdown">
									<a class="dropdown-item" href="#"> <i
											class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> Profile
									</a> <a class="dropdown-item" href="#"> <i
											class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
										Settings
									</a> <a class="dropdown-item" href="#"> <i
											class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
										Activity Log
									</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal"> <i
											class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
										Logout
									</a>
								</div>
							</li>

						</ul>

					</nav>
					<!-- End of Topbar -->

					<!-- Begin Page Content -->
					<div class="container-fluid">
						<c:if test="${not empty requestScope.error}">
							<c:choose>
								<c:when test="${requestScope.error eq 'Professor Added Successfully'}">
									<div class="alert alert-success alert-dismissible fade show" role="alert">
										<strong>${requestScope.error}</strong>
										<button type="button" class="close" data-dismiss="alert" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
								</c:when>
								<c:when test="${requestScope.error eq 'Professor already Exists'}">
									<div class="alert alert-warning alert-dismissible fade show" role="alert">
										<strong>${requestScope.error}</strong>
										<button type="button" class="close" data-dismiss="alert" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
								</c:when>
								<c:when test="${requestScope.error eq 'CIN already Exists'}">
									<div class="alert alert-warning alert-dismissible fade show" role="alert">
										<strong>${requestScope.error}</strong>
										<button type="button" class="close" data-dismiss="alert" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
								</c:when>

								<c:when test="${requestScope.error eq 'Professor Updated Successfully !'}">
									<div class="alert alert-success alert-dismissible fade show" role="alert">
										<strong>${requestScope.error}</strong>
										<button type="button" class="close" data-dismiss="alert" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
								</c:when>


								<c:when
									test="${requestScope.error eq 'Authorization reset already performed this year.'}">
									<div class="alert alert-warning alert-dismissible fade show" role="alert">
										<strong>${requestScope.error}</strong>
										<button type="button" class="close" data-dismiss="alert" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
								</c:when>


								<c:when test="${requestScope.error eq 'Authorization reset successful.'}">
									<div class="alert alert-success alert-dismissible fade show" role="alert">
										<strong>${requestScope.error}</strong>
										<button type="button" class="close" data-dismiss="alert" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
								</c:when>
							</c:choose>
						</c:if>










						<!-- Page Heading -->
						<h1 class="h3 mb-2 text-gray-800">Professors List</h1>
						<div class="d-flex justify-content-between mb-3">
							<div class="text-left">
								<a href="#" class="btn btn-success btn-icon-split" data-toggle="modal"
									data-target="#myModal" id="addButton">
									<span class="icon text-white-30">
										<i class="fas fa-user-plus"></i>
									</span>
									<span class="text">Add Professor</span>
								</a>
							</div>

							<div class="text-right">
								<a href="ResetAuth" class="btn btn-danger btn-icon-split" data-toggle="modal"
									data-target="#myModal" id="addButton">
									<span class="icon text-white-30">
										<i class="fas fa-undo"></i>
									</span>
									<span class="text">Reset Authorization</span>
								</a>
							</div>
						</div>


						<!-- DataTales Example -->
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">Professors
									Data</h6>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
										<thead>
											<tr>
												<th>First Name</th>
												<th>Last Name</th>
												<th>CIN</th>
												<th>Email</th>
												<th>Work Authorization</th>
												<th>Actions</th>

											</tr>
										</thead>
										<tfoot>
											<tr>
												<th>First Name</th>
												<th>Last Name</th>
												<th>CIN</th>
												<th>Email</th>
												<th>Work Authorization</th>
												<th>Actions</th>

											</tr>
										</tfoot>
										<tbody>
											<c:forEach var="professor" items="${requestScope.professors}">
												<tr>
													<td>${professor.firstName}</td>
													<td>${professor.lastName}</td>
													<td>${professor.cin}</td>
													<td>${professor.email}</td>
													<td>${professor.authorized}</td>
													<td>
														<button class="btn btn-circle btn-warning editButton"
															data-toggle="modal" data-target="#myModal"
															data-professor-id="${professor.id}">
															<i class="fas fa-edit"></i>
														</button>
														<button class="btn btn-circle btn-danger deleteButton"
															data-toggle="modal" data-target="#myModalDelete"
															data-professor-id="${professor.id}">
															<i class="fas fa-trash"></i>
														</button>



													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>

					</div>
					<!-- /.container-fluid -->

				</div>
				<!-- End of Main Content -->

				<!-- Footer -->
				<footer class="sticky-footer bg-white">
					<div class="container my-auto">
						<div class="copyright text-center my-auto">
							<span>Copyright &copy; Iyed & Hatem 2023</span>
						</div>
					</div>
				</footer>
				<!-- End of Footer -->

			</div>
			<!-- End of Content Wrapper -->

		</div>
		<!-- End of Page Wrapper -->

		<!-- Scroll to Top Button-->
		<a class="scroll-to-top rounded" href="#page-top"> <i class="fas fa-angle-up"></i>
		</a>

		<!-- Logout Modal-->
		<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
			aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
						<button class="close" type="button" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">Select "Logout" below if you are ready
						to end your current session.</div>
					<div class="modal-footer">
						<button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
						<a class="btn btn-primary" href="login.html">Logout</a>
					</div>
				</div>
			</div>
		</div>


		<!-- Modal EDIT-->
		<div id="myModal" class="modal">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h4 id="modalTitle" class="modal-title">Edit Professor</h4>
						<button type="button" class="close" data-dismiss="modal" id="closeModal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>

					</div>

					<form action="UpdateProfessor" method="POST">
						<div class="modal-body">
							<input id="idEdit" type="hidden" name="id">
							<div class="form-group">
								<label for="name">First Name</label> <input type="text" class="form-control"
									name="firstName" id="name" placeholder="Enter name">
							</div>
							<div class="form-group">
								<label for="lastName">Last Name</label> <input type="text" name="lastName"
									class="form-control" id="lastName" placeholder="Enter Last Name">
							</div>
							<div class="form-group">
								<label for="cin">CIN</label> <input type="number" name="cin" class="form-control"
									id="cin" placeholder="Enter CIN">
							</div>
							<div class="form-group">
								<label for="email">Email</label> <input type="email" name="email" class="form-control"
									id="email" placeholder="Enter Email">
							</div>


						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-primary">Submit</button>
						</div>
					</form>
				</div>
			</div>
		</div>




		<!-- Modal DELETE-->
		<div id="myModalDelete" class="modal">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Are You Sure?</h5>
						<button type="button" class="close" data-dismiss="modal" id="closeModalDelete"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<p>Are you sure you want to delete?</p>
					</div>
					<div class="modal-footer">
						<form action="DeleteProfessor" method="POST">
							<input type="hidden" name="id" id="professorIdInput">
							<button type="submit" class="btn btn-danger">Yes</button>
						</form>
						<button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
					</div>
				</div>
			</div>
		</div>







		<script>
			document.addEventListener("DOMContentLoaded", function () {
				var editButtons = document.querySelectorAll(".editButton");
				var deleteButtons = document.querySelectorAll(".deleteButton");


				editButtons.forEach(function (button) {
					button.addEventListener("click", function () {
						// Get the professor's ID from the data attribute
						var professorId = button.dataset.professorId;
						var tableRow = button.closest("tr");

						// Retrieve the professor's data from the table row
						var tds = tableRow.querySelectorAll("td");

						var professorFirstName = tds[0].innerText;
						var professorLastName = tds[1].innerText;
						var professorCin = tds[2].innerText;
						var professorEmail = tds[3].innerText;

						// Fill the modal fields with the professor's data
						var editModal = document.querySelector("#myModal");
						editModal.querySelector("#name").value = professorFirstName;
						editModal.querySelector("#lastName").value = professorLastName;
						editModal.querySelector("#cin").value = professorCin;
						editModal.querySelector("#email").value = professorEmail;
						editModal.querySelector("#idEdit").value = professorId;
						editModal.querySelector("#modalTitle").innerText = "Edit" + " " + professorFirstName + " " + professorLastName + "'s Information";

						editModal.querySelector("form").action = "UpdateProfessor";
						editModal.style.display = "block";

						//close the modal
						var closeModal = document.querySelector("#closeModal");
						closeModal.addEventListener("click", function () {
							editModal.style.display = "none";
						});

						// Perform additional actions based on the professor's ID if needed
					});
				});


				deleteButtons.forEach(function (button) {
					button.addEventListener("click", function () {
						// Get the professor's ID from the data attribute
						var professorId = button.dataset.professorId;
						console.log(professorId);
						// Open the delete modal using the professor's ID
						var deleteModal = document.querySelector("#myModalDelete");
						deleteModal.style.display = "block"; // Show the modal

						// Perform additional actions based on the professor's ID if neededvalue with
						var Inputform = document.querySelector("#professorIdInput");
						Inputform.value = professorId;

						var closeModalDelete = document.querySelector("#closeModalDelete");
						closeModalDelete.addEventListener("click", function () {
							deleteModal.style.display = "none";
						});
						var noButton = document.querySelector("#myModalDelete .modal-footer .btn-secondary");
						noButton.addEventListener("click", function () {
							deleteModal.style.display = "none";
						});


					});
				});

			});

		</script>
		<script>
			var addButton = document.querySelector("#addButton");
			addButton.addEventListener("click", function () {

				var editModal = document.querySelector("#myModal");
				editModal.querySelector("#name").value = "";
				editModal.querySelector("#lastName").value = "";
				editModal.querySelector("#cin").value = "";
				editModal.querySelector("#email").value = "";
				editModal.querySelector("#idEdit").value = "";
				editModal.querySelector("#modalTitle").innerText = "Add New Professor";
				editModal.querySelector("form").action = "AddProfessor";
				editModal.style.display = "block";

				//close the modal
				var closeModal = document.querySelector("#closeModal");
				closeModal.addEventListener("click", function () {
					editModal.style.display = "none";
				});
			});
		</script>




		<!-- Bootstrap core JavaScript-->
		<script src="<c:url value='/vendor/jquery/jquery.min.js'/>"></script>
		<script src="<c:url value='/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>

		<!-- Core plugin JavaScript-->
		<script src="<c:url value='/vendor/jquery-easing/jquery.easing.min.js'/>"></script>

		<!-- Custom scripts for all pages-->
		<script src="js/sb-admin-2.min.js"></script>

		<!-- Page level plugins -->
		<script src="<c:url value='/vendor/datatables/jquery.dataTables.min.js'/>"></script>
		<script src="<c:url value='/vendor/datatables/dataTables.bootstrap4.min.js'/>"></script>





		<!-- added now
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.5.2/css/bootstrap.min.css">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->






		<script>
			$(document).ready(function () {
				$('#dataTable').DataTable();
			});
		</script>
	</body>

	</html>