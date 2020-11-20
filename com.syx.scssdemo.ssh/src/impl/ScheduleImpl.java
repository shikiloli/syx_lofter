package impl;

import java.util.List;

import basic.HibernateDAO;
import model.Schedule;
import server.ISchedule;

public class ScheduleImpl implements ISchedule {
	HibernateDAO dao=new HibernateDAO();
	@Override
	public List<Schedule> show(Schedule schedule) {
		// TODO Auto-generated method stub
		String hql="select sc from Schedule sc left outer join fetch sc.classRoom left outer join sc.teachTask left outer join sc.teachTask.teacher where sc.teachTask.teacher.TeacherID=?";
		String[] parmas={schedule.getTeachTask().getTeacher().getTeacherID()};
		return dao.select(hql,parmas);
	}
	@Override
	public int save(Schedule schedule) {
		// TODO Auto-generated method stub
		dao.save(schedule);
		return 1;
	}
	@Override
	public List<Schedule> showall(Schedule schedule) {
		// TODO Auto-generated method stub
		String hql="select sc from Schedule sc left outer join fetch sc.classRoom left outer join sc.teachTask left outer join sc.teachTask.teacher";
		return dao.select(hql);
	}
	@Override
	public int delete(Schedule schedule) {
		// TODO Auto-generated method stub
		return dao.delete(Schedule.class, schedule.getScheduleID());
	}
	
}
