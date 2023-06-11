<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<ul
	class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
	id="accordionSidebar">

	<!-- Sidebar - Brand -->
	<a
		class="sidebar-brand d-flex align-items-center justify-content-center"
		href="ProfessorListController">
		<div class="sidebar-brand-icon rotate-n-0">
			<i class="fas fa-user-shield"></i>
		</div>
		<div class="sidebar-brand-text mx-3">Admin</div>
	</a>

	<!-- Divider -->
	<hr class="sidebar-divider">
	<div class="sidebar-heading">Professors</div>
	<!-- Nav Item - Dashboard -->
	<li
		class="nav-item ${pageContext.request.servletPath == '/table.jsp' ? 'active' : ''}">
		<a class="nav-link" href="ProfessorListController"> <i
			class="fas fa-fw fa-table"></i> <span>Professors List</span>
	</a>
	</li>

	<!-- Divider -->
	<hr class="sidebar-divider">

	<!-- Heading -->
	<div class="sidebar-heading">Authorization</div>

	<!-- Nav Item - Pages Collapse Menu -->
	<!-- ... -->

	<!-- Nav Item - Tables -->
	<li
		class="nav-item ${pageContext.request.servletPath == '/document.jsp' ? 'active' : ''}">
		<a class="nav-link" href="DocumentController"> <i
			class="far fa-file-pdf fa-lg"></i> <span>Generate
				Authorization</span>
	</a>
	</li>

	<!-- Divider -->
	<hr class="sidebar-divider d-none d-md-block">
	<li class="nav-item"><a class="nav-link" href="#"
		data-toggle="modal" data-target="#logoutModal"> <i
			class="fas fa-fw fa-sign-out-alt"></i> <span>Logout</span>
	</a></li>
	<!-- Sidebar Toggler (Sidebar) -->
	<div class="text-center d-none d-md-inline">
		<button class="rounded-circle border-0" id="sidebarToggle"></button>
	</div>

</ul>
