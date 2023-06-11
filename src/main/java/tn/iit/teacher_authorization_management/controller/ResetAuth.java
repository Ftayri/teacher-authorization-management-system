package tn.iit.teacher_authorization_management.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tn.iit.teacher_authorization_management.dao.ProfessorDAO;
import tn.iit.teacher_authorization_management.util.HibernateUtil;

/**
 * Servlet implementation class ResetAuth
 */
@WebServlet("/ResetAuth")
public class ResetAuth extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProfessorDAO professorDAO;

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResetAuth() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	public void init() {
		professorDAO = new ProfessorDAO(HibernateUtil.getSessionFactory());

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if (professorDAO.resetAuthorization()==true) {
			request.setAttribute("error","Authorization reset successful.");
			request.getRequestDispatcher("ProfessorListController").forward(request, response);
		}
		else {
			
			request.setAttribute("error","Authorization reset already performed this year.");
			request.getRequestDispatcher("ProfessorListController").forward(request, response);
			
		}
		
		
		
		
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
