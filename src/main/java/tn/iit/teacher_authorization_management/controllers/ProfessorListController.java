package tn.iit.teacher_authorization_management.controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tn.iit.teacher_authorization_management.Professor;
import tn.iit.teacher_authorization_management.dao.ProfessorDAO;

/**
 * Servlet implementation class ProfessorListController
 */
@WebServlet("/ProfessorListController")
public class ProfessorListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProfessorListController() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Professor> professors = ProfessorDAO.getAllProfessors();
		request.setAttribute("professors", professors);
        request.getRequestDispatcher("view/table.jsp").forward(request, response);

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
