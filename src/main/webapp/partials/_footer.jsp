<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<script
		src="<c:url value='/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="<c:url value='/vendor/jquery-easing/jquery.easing.min.js'/>"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script
		src="<c:url value='/vendor/datatables/jquery.dataTables.min.js'/>"></script>
	<script
		src="<c:url value='/vendor/datatables/dataTables.bootstrap4.min.js'/>"></script>
	<script>
		$(document).ready(function() {
			$('#selectProfessor').change(function() {
				var selectedProfessor = $(this).val();
				$.ajax({
					url : 'ProfessorController',
					type : 'POST',
					data : {
						'professorId' : selectedProfessor
					},
					dataType : 'json'
				}).done(function(data) {

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
	<script type="text/javascript" src="<c:url value='/scripts/toggle.js'/>"></script>