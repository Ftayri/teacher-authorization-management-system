<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<jsp:include page="/partials/_sidebar.jsp"/>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<jsp:include page="/partials/_navbar.jsp"/>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">
					<c:if test="${not empty requestScope.pdfSuccess}">
						<div class="alert alert-success alert-dismissible fade show"
							role="alert">
							<strong>${requestScope.pdfSuccess}</strong>
							<button type="button" class="close" data-dismiss="alert"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
					</c:if>
					<form action="DocumentController" method="POST">
						<div class="form-group">
							<label for="selectProfessor">Select a professor to
								generate document</label> <select class="form-control"
								id="selectProfessor" name="id" required>
								<option value="0">Select Professor</option>
								<c:forEach items="${requestScope.professors}" var="professor">
									<option value="${professor.id}">${professor.firstName}
										${professor.lastName}</option>
								</c:forEach>
							</select>
						</div>
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="firstName">First Name</label> <input type="text"
										class="form-control" id="firstName" placeholder="First Name"
										disabled>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="lastName">Last Name</label> <input type="text"
										class="form-control" id="lastName" placeholder="Last Name"
										disabled>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="cin">CIN</label> <input type="text"
										class="form-control" id="cin" placeholder="CIN" disabled>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="email">Email address</label> <input type="email"
										class="form-control" id="email" placeholder="Email" disabled>
								</div>
							</div>
							<div class="col-md-3">
								<button type="submit"
									class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
									<i class="fas fa-download fa-sm text-white-50"></i> Generate
									Authorization
								</button>
							</div>
						</div>

					</form>

				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->
			<jsp:include page="/partials/_footer.jsp"/>
		</div>
		<!-- End of Content Wrapper -->

	</div>
</body>

</html>