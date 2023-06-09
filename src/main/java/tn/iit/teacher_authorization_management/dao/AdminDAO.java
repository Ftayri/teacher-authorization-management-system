package tn.iit.teacher_authorization_management.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import tn.iit.teacher_authorization_management.Admin;

public class AdminDAO {

	private SessionFactory sessionFactory;

	public AdminDAO(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Admin getAdminByUsernameAndPassword(String username, String password) {
		try (Session session = sessionFactory.openSession()) {
			Query<Admin> query = session.createQuery("FROM Admin WHERE username = :username AND password = :password",
					Admin.class);
			query.setParameter("username", username);
			query.setParameter("password", password);
			return query.uniqueResult();
		}
	}

	public List<Admin> getAllAdmins() {
		try (Session session = sessionFactory.openSession()) {
			Query<Admin> query = session.createQuery("FROM Admin", Admin.class);
			return query.list();
		}
	}

	public void saveOrUpdateAdmin(Admin admin) {
		try (Session session = sessionFactory.openSession()) {
			Transaction transaction = session.beginTransaction();
			session.saveOrUpdate(admin);
			transaction.commit();
		}
	}

	public void deleteAdmin(Admin admin) {
		try (Session session = sessionFactory.openSession()) {
			Transaction transaction = session.beginTransaction();
			session.delete(admin);
			transaction.commit();
		}
	}
}