<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<!-- Footer -->
	<footer class="sticky-footer bg-white">
		<div class="container my-auto">
			<div class="copyright text-center my-auto">
				<span>Copyright &copy; Teacher Work Authroization Management</span>
			</div>
		</div>
	</footer>
	<!-- End of Footer -->
	<!-- End of Page Wrapper -->

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
	<script>
		$(document).ready(function () {
			$('#selectProfessor').change(function () {
				var selectedProfessor = $(this).val();
				$.ajax({
					url: 'ProfessorController',
					type: 'POST',
					data: {
						'professorId': selectedProfessor
					},
					dataType: 'json'
				}).done(function (data) {

					if (data.status) {
						$('#firstName').val('');
						$('#lastName').val('');
						$('#cin').val('');
						$('#email').val('');
						return;
					} else {
						$('#firstName').val(data.firstName);
						$('#lastName').val(data.lastName);
						$('#cin').val(data.cin);
						$('#email').val(data.email);
					}
				});
			});
		});
	</script>



	<script>
		// Wait for 2 seconds and then remove the success alert
		setTimeout(function () {
			var successAlert = document.getElementById('success-alert');
			var exists1 = document.getElementById('exists1');
			var exists2 = document.getElementById('exists2');
			var exists3 = document.getElementById('exists3');
			var exists4 = document.getElementById('exists4');
			var exists5 = document.getElementById('exists5');
			if (successAlert) {
				successAlert.remove();
			}
			if (exists1) {
				exists1.remove();
			}
			if (exists2) {
				exists2.remove();
			}
			if (exists3) {
				exists3.remove();
			}
			if (exists4) {
				exists4.remove();
			}
			if (exists5) {
				exists5.remove();
			}

		}, 2000);
	</script>
	<script type="text/javascript" src="<c:url value='/scripts/toggle.js'/>"></script>