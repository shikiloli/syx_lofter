package impl;

import java.util.List;

import model.College;
import model.Course;
import model.Department;
import model.Profession;
import basic.HibernateDAO;
import server.ICourse;

public class CourseImpl implements ICourse {
	HibernateDAO dao=new HibernateDAO();
	@Override
	public List<Course> show(Course course) {
		// TODO Auto-generated method stub
		String hql="select pro from Profession pro left outer join fetch pro.courses where pro.ProfessionID=?";
		String[] parmas={course.getProfession().getProfessionID()};
		return dao.select(hql,parmas);
	}
	@Override
	public int save(Course course) {
		// TODO Auto-generated method stub
		if(dao.save(course).equals(course.getCourseID())){
			return 1;
		}
		else {
			return 0;
		}
	}

	@Override
	public int delete(Course course) {
		// TODO Auto-generated method stub
		return dao.delete(Course.class, course.getCourseID());
	}

	@Override
	public int update(Course course) {
		// TODO Auto-generated method stub
		Course cour=(Course)dao.findByID(Course.class, course.getCourseID());
		Profession profession=new Profession();
		profession.setProfessionID(course.getProfession().getProfessionID());
		cour.setProfession(profession);
		cour.setCourseID(course.getCourseID());
		cour.setCourse(course.getCourse());
		cour.setCrediy(course.getCrediy());
		cour.setCurriculumTime(course.getCurriculumTime());
		cour.setStudyTime(course.getStudyTime());
		cour.setRemark(course.getRemark());
		return dao.update(cour);
	}
}
