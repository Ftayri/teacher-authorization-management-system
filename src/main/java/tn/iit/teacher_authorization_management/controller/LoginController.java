package tn.iit.teacher_authorization_management.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tn.iit.teacher_authorization_management.Admin;
import tn.iit.teacher_authorization_management.dao.AdminDAO;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminDAO adminDAO = new AdminDAO(HibernateUtil.getSessionFactory());
		//get the username and password from the request
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		//get the admin from the database
		Admin admin = adminDAO.getAdminByUsernameAndPassword(username,password);
		if(admin != null) {
			//if the admin exists, set the session attribute to the admin
			request.getSession().setAttribute("admin", admin);
			//redirect to the home page
			response.sendRedirect("index.jsp");
		} else {
			//set the error message
			request.setAttribute("error", "Invalid username or password");
			//redirect to the login page
			response.sendRedirect("login.jsp");
		}
	}

}
