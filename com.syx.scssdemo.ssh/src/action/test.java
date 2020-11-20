package action;

import model.Admin;
import model.College;
import model.Department;
import model.Profession;
import model.Student;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		SessionFactory factory=new Configuration().configure().buildSessionFactory();
		Session session=factory.openSession();
		Transaction tran=session.beginTransaction();
		Profession col=(Profession)session.get(Profession.class, "1101");
		System.out.println(col.getProfessionName());
		session.flush();
		tran.commit();
		session.close();
	}

}
