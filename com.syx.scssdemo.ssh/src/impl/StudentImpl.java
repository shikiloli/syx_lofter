package impl;

import java.security.NoSuchAlgorithmException;
import java.util.List;

import model.Admin;
import model.Classa;
import model.College;
import model.Student;
import model.Teacher;
import basic.HibernateDAO;
import server.IStudent;
import util.util;

public class StudentImpl implements IStudent {
	HibernateDAO dao=new HibernateDAO();
	@Override
	public List<Student> show(Student student) {
		// TODO Auto-generated method stub
		String hql="select cla from Classa cla left outer join fetch cla.students where cla.ClassID=?";
		String[] parmas={student.getClassa().getClassID()};
		return dao.select(hql,parmas);
	}
	@Override
	public int save(Student student) {
		// TODO Auto-generated method stub
		if(dao.save(student).equals(student.getStuID())){
			return 1;
		}
		else {
			return 0;
		}
	}

	@Override
	public int delete(Student student) {
		// TODO Auto-generated method stub
		return dao.delete(Student.class, student.getStuID());
	}

	@Override
	public int update(Student student) {
		// TODO Auto-generated method stub
		Student stu=(Student)dao.findByID(Student.class, student.getStuID());
		Classa classa=new Classa();
		classa.setClassID(student.getClassa().getClassID());
		stu.setClassa(classa);
		stu.setStuID(student.getStuID());
		stu.setSex(student.getSex());
		stu.setBirth(student.getBirth());
		stu.setFamily(student.getFamily());
		stu.setName(student.getName());
		stu.setPhone(student.getPhone());
		stu.setRemark(student.getRemark());
		return dao.update(stu);
	}
	@Override
	public int update2(Student student) {
		// TODO Auto-generated method stub
		Student stu=(Student)dao.findByID(Student.class, student.getStuID());
		Classa classa=new Classa();
		classa.setClassID(student.getClassa().getClassID());
		stu.setStuID(student.getStuID());
		stu.setSex(student.getSex());
		stu.setBirth(student.getBirth());
		stu.setFamily(student.getFamily());
		stu.setName(student.getName());
		stu.setPhone(student.getPhone());
		stu.setRemark(student.getRemark());
		return dao.update(stu);
	}
	@Override
	public int reset(Student student) {
		// TODO Auto-generated method stub
		Student ad=(Student)dao.findByID(Student.class, student.getStuID());
		try {
			ad.setPassword(util.UseMD5("123456"));
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dao.update(ad);
	}
	@Override
	public Student login(Student student) {
		// TODO Auto-generated method stub
		return (Student)dao.findByID(Student.class, student.getStuID());
	}
	@Override
	public int pwdupdate(Student student) {
		// TODO Auto-generated method stub
		Student stu=(Student)dao.findByID(Student.class, student.getStuID());
		stu.setPassword(student.getPassword());
		return dao.update(stu);
	}
}
