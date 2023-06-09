package tn.iit.teacher_authorization_management.dao;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import tn.iit.teacher_authorization_management.Professor;

public class ProfessorDAO {
	private SessionFactory sessionFactory;

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

	public void deleteProfessor(Professor professor) {
		Session session = sessionFactory.openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			session.delete(professor);
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
}
