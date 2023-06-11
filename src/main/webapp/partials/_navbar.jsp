
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<nav
	class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
	<!-- Topbar Navbar -->
	<ul class="navbar-nav ml-auto">
		<div class="topbar-divider d-none d-sm-block"></div>

		<!-- Nav Item - User Information -->
		<li class="nav-item dropdown no-arrow"><a
			class="nav-link dropdown-toggle" href="#" id="userDropdown"
			role="button" data-toggle="dropdown" aria-haspopup="true"
			aria-expanded="false"> <span
				class="mr-2 d-none d-lg-inline text-gray-600 small">${sessionScope.admin.getUsername()}</span>
				<img class="img-profile rounded-circle" src="<c:url value='images/undraw_profile.svg'/>">
		</a> <!-- Dropdown - User Information -->
	</ul>

</nav>