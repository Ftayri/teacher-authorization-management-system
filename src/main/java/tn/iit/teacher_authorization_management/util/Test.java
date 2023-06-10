package tn.iit.teacher_authorization_management.util;

import tn.iit.teacher_authorization_management.Admin;
import tn.iit.teacher_authorization_management.Professor;
import tn.iit.teacher_authorization_management.dao.ProfessorDAO;

public class Test {

	public static void main(String[] args) {
		ProfessorDAO professorDAO = new ProfessorDAO(HibernateUtil.getSessionFactory());
		Professor professor = professorDAO.getProfessorById(Long.valueOf(1));
		Admin admin = new Admin();
		admin.setUsername("Test");
		PDFGenerator.generatePDF(professor, admin);
		
	}
}
