package impl;

import java.security.NoSuchAlgorithmException;
import java.util.List;

import model.Admin;
import model.College;
import model.Department;
import model.Student;
import model.Teacher;
import basic.HibernateDAO;
import server.ITeacher;
import util.util;

public class Teacherimpl implements ITeacher {
	HibernateDAO dao=new HibernateDAO();
	@Override
	public List<Teacher> show(Teacher teacher) {
		// TODO Auto-generated method stub
		String hql="select col from College col left outer join fetch col.teachers where col.CollegeID=?";
		String[] parmas={teacher.getCollege().getCollegeID()};
		return dao.select(hql,parmas);
	}
	@Override
	public int save(Teacher teacher) {
		// TODO Auto-generated method stub
		if(dao.save(teacher).equals(teacher.getTeacherID())){
			return 1;
		}
		else {
			return 0;
		}
	}

	@Override
	public int delete(Teacher teacher) {
		// TODO Auto-generated method stub
		return dao.delete(Teacher.class, teacher.getTeacherID());
	}

	@Override
	public int update(Teacher teacher) {
		// TODO Auto-generated method stub
		Teacher tea=(Teacher)dao.findByID(Teacher.class, teacher.getTeacherID());
		College college=new College();
		college.setCollegeID(teacher.getCollege().getCollegeID());
		tea.setCollege(college);
		tea.setTeacherID(teacher.getTeacherID());
		tea.setBirth(teacher.getBirth());
		tea.setHome(teacher.getHome());
		tea.setKulture(teacher.getKulture());
		tea.setName(teacher.getName());
		tea.setPhoto(teacher.getTeacherID());
		tea.setSex(teacher.getSex());
		tea.setRemark(teacher.getRemark());
		return dao.update(tea);
	}
	@Override
	public int update2(Teacher teacher) {
		// TODO Auto-generated method stub
		Teacher tea=(Teacher)dao.findByID(Teacher.class, teacher.getTeacherID());
		College college=new College();
		college.setCollegeID(teacher.getCollege().getCollegeID());
		tea.setTeacherID(teacher.getTeacherID());
		tea.setBirth(teacher.getBirth());
		tea.setHome(teacher.getHome());
		tea.setKulture(teacher.getKulture());
		tea.setName(teacher.getName());
		tea.setPhoto(teacher.getTeacherID());
		tea.setSex(teacher.getSex());
		tea.setRemark(teacher.getRemark());
		return dao.update(tea);
	}
	@Override
	public int reset(Teacher teacher) {
		// TODO Auto-generated method stub
		Teacher ad=(Teacher)dao.findByID(Teacher.class, teacher.getTeacherID());
		try {
			ad.setPassword(util.UseMD5("123456"));
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dao.update(ad);
	}
	@Override
	public Teacher login(Teacher teacher) {
		// TODO Auto-generated method stub
		return (Teacher)dao.findByID(Teacher.class, teacher.getTeacherID());
	}
	@Override
	public int pwdupdate(Teacher teacher) {
		// TODO Auto-generated method stub
		Teacher tea=(Teacher)dao.findByID(Teacher.class, teacher.getTeacherID());
		tea.setPassword(teacher.getPassword());
		return dao.update(tea);
	}
	@Override
	public List<Teacher> select(Teacher teacher) {
		// TODO Auto-generated method stub
		String hql="from Teacher tea where tea.College.CollegeID=?";
		String[] parmas={teacher.getCollege().getCollegeID()};
		return dao.select(hql,parmas);
	}
}
