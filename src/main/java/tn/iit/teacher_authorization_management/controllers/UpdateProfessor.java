package tn.iit.teacher_authorization_management.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tn.iit.teacher_authorization_management.Professor;
import tn.iit.teacher_authorization_management.dao.ProfessorDAO;
import tn.iit.teacher_authorization_management.util.HibernateUtil;

/**
 * Servlet implementation class UpdateProfessor
 */
@WebServlet("/UpdateProfessor")
public class UpdateProfessor extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProfessorDAO professorDAO;

	public UpdateProfessor() {
		super();
	}

	public void init() {
		professorDAO = new ProfessorDAO(HibernateUtil.getSessionFactory());

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Long id = Long.parseLong(request.getParameter("id"));
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");
		String cin = request.getParameter("cin");
		Professor professor = professorDAO.getProfessorById(id);
		if(professorDAO.verifyProfessor(cin)==false) {	
			professor.setFirstName(firstName);
			professor.setLastName(lastName);
			professor.setEmail(email);
			professor.setCin(cin);
			professorDAO.updateProfessor(professor);
			request.setAttribute("error","Professor Updated Successfully !");
			request.getRequestDispatcher("ProfessorListController").forward(request, response);

		}
		else {
			request.setAttribute("error", "CIN already Exists");
			request.getRequestDispatcher("ProfessorListController").forward(request, response);

		}
	}

}
