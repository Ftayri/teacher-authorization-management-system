package tn.iit.teacher_authorization_management.controllers;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tn.iit.teacher_authorization_management.Admin;
import tn.iit.teacher_authorization_management.dao.AdminDAO;
import tn.iit.teacher_authorization_management.util.HibernateUtil;

/**
 * Servlet implementation class LoginController
 */
@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"}, loadOnStartup = 1)
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AdminDAO adminDAO;

	public void init() {
		adminDAO = new AdminDAO(HibernateUtil.getSessionFactory());
	}

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
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

			Cookie[] cookies = request.getCookies();
			if (cookies != null) {
				for (Cookie cookie : cookies) {
					if (cookie.getName().equals("remember_token")) {
						Admin admin = adminDAO.getAdminByRememberToken(cookie.getValue());
						if (admin != null) {
							request.getSession().setAttribute("admin", admin);
							response.sendRedirect("table.jsp");
							return;
						}
					}
				}
			}
			response.sendRedirect("login.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// get the username and password from the request
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String remember = request.getParameter("rememberToken");
		// get the admin from the database
		Admin admin = adminDAO.getAdminByUsernameAndPassword(username, password);
		if (admin != null) {
			// if the admin exists, set the session attribute to the admin
			request.getSession().setAttribute("admin", admin);
			String token = null;
			// if the remember me is checked, set the cookie
			if (remember != null) {
				token = UUID.randomUUID().toString();
				Cookie cookie = new Cookie("remember_token", token);
				cookie.setMaxAge(60 * 60 * 24 * 30);
				response.addCookie(cookie);
			}else {
				Cookie cookie = new Cookie("remember_token", "");
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
			admin.setRememberToken(token);
			adminDAO.saveOrUpdateAdmin(admin);
			// redirect to the home page
			response.sendRedirect("ProfessorListController");
		} else {
			// set the error message
			request.setAttribute("error", "Invalid username or password");
			// redirect to the login page
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		}
	}

}
