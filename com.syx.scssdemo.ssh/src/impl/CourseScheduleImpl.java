package impl;

import java.util.List;

import basic.HibernateDAO;
import model.CourseSchedule;
import model.TeachTask;
import server.ICourseSchedule;

public class CourseScheduleImpl implements ICourseSchedule {
	HibernateDAO dao=new HibernateDAO();
	@Override
	public List<CourseSchedule> show(CourseSchedule courseSchedule) {
		// TODO Auto-generated method stub
		String hql="select cs from CourseSchedule cs left outer join fetch cs.student left outer join cs.teachTask where cs.student.StuID=?";
		String[] parmas={courseSchedule.getStudent().getStuID()};
		return dao.select(hql,parmas);
	}
	@Override
	public int save(CourseSchedule courseSchedule) {
		// TODO Auto-generated method stub
		dao.save(courseSchedule);
		return 1;
	}
	@Override
	public int delete(CourseSchedule courseSchedule) {
		// TODO Auto-generated method stub
		String hql="from CourseSchedule cs where cs.student.StuID=? and cs.teachTask.TeachTaskID=?";
		Object[] parmas={courseSchedule.getStudent().getStuID(),courseSchedule.getTeachTask().getTeachTaskID()};
		CourseSchedule cs=(CourseSchedule)dao.selectValue(hql, parmas);
		return dao.delete(CourseSchedule.class, cs.getCSID());
	}
	@Override
	public List<CourseSchedule> showall(CourseSchedule courseSchedule) {
		// TODO Auto-generated method stub
		//String hql="from CourseSchedule cs where cs.teachTask.teacher.TeacherID=?";
		String hql="select cs from CourseSchedule cs left outer join fetch cs.student left outer join cs.teachTask left outer join cs.teachTask.teacher where cs.teachTask.teacher.TeacherID=?";
		String[] parmas={courseSchedule.getTeachTask().getTeacher().getTeacherID()};
		return dao.select(hql,parmas);
	}
	@Override
	public int update(CourseSchedule courseSchedule) {
		// TODO Auto-generated method stub
		String hql="from CourseSchedule cs where cs.student.StuID=? and cs.teachTask.TeachTaskID=?";
		Object[] parmas={courseSchedule.getStudent().getStuID(),courseSchedule.getTeachTask().getTeachTaskID()};
		CourseSchedule cs=(CourseSchedule)dao.selectValue(hql, parmas);
		CourseSchedule courseSchedule2=(CourseSchedule)dao.findByID(CourseSchedule.class, cs.getCSID());
		courseSchedule2.setScoreOne(courseSchedule.getScoreOne());
		courseSchedule2.setScoreTwo(courseSchedule.getScoreTwo());
		courseSchedule2.setScoreThree(courseSchedule.getScoreThree());
		courseSchedule2.setTotalScore(courseSchedule.getTotalScore());
		return dao.update(courseSchedule2);
	}
	
}
