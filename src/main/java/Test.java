import org.hibernate.SessionFactory;

import tn.iit.teacher_authorization_management.util.HibernateUtil;

public class Test {

	public static void main(String[] args) {
		// Get the Hibernate SessionFactory
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

		// Output a message if the SessionFactory is successfully obtained
		if (sessionFactory != null) {
			System.out.println("Hibernate SessionFactory successfully obtained.");
		} else {
			System.out.println("Failed to obtain Hibernate SessionFactory.");
		}
	}
}
