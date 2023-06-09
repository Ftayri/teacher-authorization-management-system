package tn.iit.teacher_authorization_management.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tn.iit.teacher_authorization_management.dao.ProfessorDAO;
import tn.iit.teacher_authorization_management.util.HibernateUtil;

/**
 * Servlet implementation class DeleteProfessor
 */
@WebServlet("/DeleteProfessor")
public class DeleteProfessor extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProfessorDAO professorDAO;

    public DeleteProfessor() {
        super();
        // TODO Auto-generated constructor stub
    }
	public void init() {
		 professorDAO = new ProfessorDAO(HibernateUtil.getSessionFactory());

	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    int professorId = Integer.parseInt(request.getParameter("professorId"));
	    professorDAO.deleteProfessor(professorId);
	    response.setContentType("text/plain");
	    response.getWriter().write("Professor deleted successfully");
	    

	}

}
