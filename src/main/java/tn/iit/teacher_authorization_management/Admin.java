package tn.iit.teacher_authorization_management;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "admin")
public class Admin {

	private String username;
	private String password;

}
