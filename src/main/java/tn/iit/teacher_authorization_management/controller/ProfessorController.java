package tn.iit.teacher_authorization_management.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import tn.iit.teacher_authorization_management.dao.ProfessorDAO;
import tn.iit.teacher_authorization_management.entity.Professor;
import tn.iit.teacher_authorization_management.util.HibernateUtil;

/**
 * Servlet implementation class ProfessorController
 */
@WebServlet("/ProfessorController")
public class ProfessorController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProfessorDAO professorDAO;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProfessorController() {
		super();
		// TODO Auto-generated constructor stub
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
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Long id = Long.parseLong(request.getParameter("professorId"));
		Professor professor = professorDAO.getProfessorById(id);
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		if (professor != null) {
			JSONObject professorData = new JSONObject();
			professorData.put("firstName", professor.getFirstName());
			professorData.put("lastName", professor.getLastName());
			professorData.put("cin", professor.getCin());
			professorData.put("email", professor.getEmail());

			out.print(professorData.toString());
		} else {
			JSONObject responseData = new JSONObject();
			responseData.put("status", "none");
			out.print(responseData.toString());
		}
		out.flush();
	}

}
