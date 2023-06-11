package tn.iit.teacher_authorization_management.dao;

import java.util.Calendar;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import tn.iit.teacher_authorization_management.Professor;

public class ProfessorDAO {
	private SessionFactory sessionFactory;
	private static int lastResetYear = 0;

	public ProfessorDAO(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public void saveProfessor(Professor professor) {
		Session session = sessionFactory.openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			session.save(professor);
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	public Professor getProfessorById(Long id) {
		Session session = sessionFactory.openSession();
		Professor professor = null;
		try {
			professor = session.get(Professor.class, id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return professor;
	}

	public List<Professor> getAllProfessors() {
		Session session = sessionFactory.openSession();
		List<Professor> professors = null;
		try {
			Query<Professor> query = session.createQuery("FROM Professor", Professor.class);
			professors = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return professors;
	}

	public List<Professor> getAuthorizedProfessors() {
		Session session = sessionFactory.openSession();
		List<Professor> professors = null;
		try {
			Query<Professor> query = session.createQuery("FROM Professor p WHERE p.authorized = 0", Professor.class);
			professors = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return professors;
	}

	public void updateProfessor(Professor professor) {
		Session session = sessionFactory.openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			session.update(professor);
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	public void deleteProfessor(Long professorId) {
		Session session = sessionFactory.openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();

			// Retrieve the professor object by ID
			Professor professor = session.get(Professor.class, professorId);

			// Delete the professor if found
			if (professor != null) {
				session.delete(professor);
				transaction.commit();
			}
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	public boolean verifyProfessor(String cin, Long id) {
		Session session = sessionFactory.openSession();
		Professor professor = null; // Initialize the list

		try {
			Query<Professor> query = session.createQuery("FROM Professor WHERE cin = :cinValue", Professor.class);
			query.setParameter("cinValue", cin);
			professor = query.uniqueResult();
			if (professor != null) {
				if (professor.getId() != id) {
					return true;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return false;
	}

	public boolean resetAuthorization() {
		Session session = sessionFactory.openSession();
		Transaction transaction = null;

		try {
			// Get the current year
			int currentYear = Calendar.getInstance().get(Calendar.YEAR);

			// Check if the reset has already been done this year
			if (getLastResetYear() == currentYear) {
				System.out.println("Authorization reset already performed this year.");
				return false;
			}
			transaction = session.beginTransaction();

			Query query = session.createQuery("UPDATE Professor SET authorized = 0");
			query.executeUpdate();
			transaction.commit();
	        setLastResetYear(currentYear);
			System.out.println("Authorization reset successful.");

		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}

		return true;
	}

	private int getLastResetYear() {

		return lastResetYear;
	}

	private void setLastResetYear(int year) {
		lastResetYear = year;

	}

}
