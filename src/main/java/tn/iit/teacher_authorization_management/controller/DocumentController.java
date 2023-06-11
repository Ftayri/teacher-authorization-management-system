package tn.iit.teacher_authorization_management.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tn.iit.teacher_authorization_management.dao.ProfessorDAO;
import tn.iit.teacher_authorization_management.entity.Admin;
import tn.iit.teacher_authorization_management.entity.Professor;
import tn.iit.teacher_authorization_management.util.HibernateUtil;
import tn.iit.teacher_authorization_management.util.PDFGenerator;

/**
 * Servlet implementation class DocumentController
 */
@WebServlet("/DocumentController")
public class DocumentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProfessorDAO professorDAO;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DocumentController() {

	}

	@Override
	public void init() {
		professorDAO = new ProfessorDAO(HibernateUtil.getSessionFactory());
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Professor> professors = professorDAO.getAuthorizedProfessors();
		request.setAttribute("professors", professors);
		request.getRequestDispatcher("document.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    Long id = Long.parseLong(request.getParameter("id"));
	    Professor professor = professorDAO.getProfessorById(id);
	    HttpSession httpSession = request.getSession();
	    Admin admin = (Admin) httpSession.getAttribute("admin");
	    if (admin == null) {
	        admin = new Admin();
	        admin.setUsername("test");
	    }
	    professor.setAuthorized(true);
	    professorDAO.updateProfessor(professor);
	    ByteArrayOutputStream outputStream = PDFGenerator.generatePDF(professor, admin);
	    response.setContentType("application/pdf");
	    response.setHeader("Content-Disposition", "attachment; filename=" + professor.getFirstName() + "_" + professor.getLastName() + "_authorization.pdf");

	    OutputStream out = response.getOutputStream();
	    outputStream.writeTo(out);
	    out.flush();
	    out.close();

	}

}
