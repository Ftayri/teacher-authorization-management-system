<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<!DOCTYPE html>
	<html lang="en">

	<c:set var="pageTitle" value="Generate Document" />
	<jsp:include page="/partials/_head.jsp">
		<jsp:param name="pageTitle" value="${pageTitle}" />
	</jsp:include>

	<body id="page-top">

		<!-- Page Wrapper -->
		<div id="wrapper">

			<!-- Sidebar -->
			<jsp:include page="/partials/_sidebar.jsp" />
			<!-- End of Sidebar -->

			<!-- Content Wrapper -->
			<div id="content-wrapper" class="d-flex flex-column">

				<!-- Main Content -->
				<div id="content">

					<!-- Topbar -->
					<jsp:include page="/partials/_navbar.jsp" />
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
				<jsp:include page="/partials/_footer.jsp"></jsp:include>
				<!-- End of Footer -->

			</div>
			<!-- End of Content Wrapper -->

		</div>
		<!-- End of Page Wrapper -->

		<!-- Scroll to Top Button-->
		<a class="scroll-to-top rounded" href="#page-top"> <i class="fas fa-angle-up"></i>
		</a>

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
		<script>
			$(document).ready(function () {
				$('#dataTable').DataTable();
			});
		</script>
	</body>

	</html>