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
 * Servlet implementation class AddProfessor
 */
@WebServlet("/AddProfessor")
public class AddProfessor extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProfessorDAO professorDAO;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProfessor() {
        super();
    }
    
	public void init() {
		professorDAO = new ProfessorDAO(HibernateUtil.getSessionFactory());

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");
		String cin = request.getParameter("cin");
		Professor professor=new Professor();
		professor.setFirstName(firstName);
		professor.setLastName(lastName);
		professor.setEmail(email);
		professor.setCin(cin);
		if(professorDAO.verifyProfessor(cin, Long.valueOf(0))==true) {
			request.setAttribute("error", "Professor already Exists");
			request.getRequestDispatcher("ProfessorListController").forward(request, response);

		}
		else {
		professorDAO.saveProfessor(professor);
		request.setAttribute("error", "Professor Added Successfully");

		request.getRequestDispatcher("ProfessorListController").forward(request, response);}
	}
	
	

}
