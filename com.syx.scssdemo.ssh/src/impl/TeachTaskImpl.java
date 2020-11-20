package impl;

import java.util.List;

import basic.HibernateDAO;
import model.TeachTask;
import server.ITeachTask;

public class TeachTaskImpl implements ITeachTask {
	HibernateDAO dao=new HibernateDAO();
	@Override
	public List<TeachTask> show(TeachTask teachTask) {
		// TODO Auto-generated method stub
		String hql="select tt from TeachTask tt left outer join fetch tt.teacher left outer join fetch tt.course where tt.teacher.TeacherID=?";
		String[] parmas={teachTask.getTeacher().getTeacherID()};
		return dao.select(hql,parmas);
	}
	@Override
	public int save(TeachTask teachTask) {
		// TODO Auto-generated method stub
		dao.save(teachTask);
		return 1;
		
	}
	@Override
	public int delete(TeachTask teachTask) {
		// TODO Auto-generated method stub
		String hql="from TeachTask tt where tt.teacher.TeacherID=? and tt.course.CourseID=?";
		String[] parmas={teachTask.getTeacher().getTeacherID(),teachTask.getCourse().getCourseID()};
		TeachTask tt=(TeachTask)dao.selectValue(hql, parmas);
		return dao.delete(TeachTask.class, tt.getTeachTaskID());
	}
	@Override
	public List<TeachTask> select(TeachTask teachTask) {
		// TODO Auto-generated method stub
		String hql="select tt from TeachTask tt left outer join fetch tt.teacher left outer join fetch tt.course where tt.teacher.TeacherID=?";
		String[] parmas={teachTask.getTeacher().getTeacherID()};
		List<TeachTask> list=dao.select(hql,parmas);
		return list;
	}
	@Override
	public int updateT(TeachTask teachTask) {
		// TODO Auto-generated method stub
		String hql="from TeachTask tt where tt.teacher.TeacherID=? and tt.course.CourseID=?";
		String[] parmas={teachTask.getTeacher().getTeacherID(),teachTask.getCourse().getCourseID()};
		TeachTask tt=(TeachTask)dao.selectValue(hql, parmas);
		TeachTask tt2=new TeachTask();
		tt2=(TeachTask)dao.findByID(TeachTask.class, tt.getTeachTaskID());
		tt2.setAuditing("已通过");
		return dao.update(tt2);
	}
	@Override
	public int updateF(TeachTask teachTask) {
		// TODO Auto-generated method stub
		String hql="from TeachTask tt where tt.teacher.TeacherID=? and tt.course.CourseID=?";
		String[] parmas={teachTask.getTeacher().getTeacherID(),teachTask.getCourse().getCourseID()};
		TeachTask tt=(TeachTask)dao.selectValue(hql, parmas);
		TeachTask tt2=new TeachTask();
		tt2=(TeachTask)dao.findByID(TeachTask.class, tt.getTeachTaskID());
		tt2.setAuditing("未通过");
		return dao.update(tt2);
	}
	@Override
	public List<TeachTask> selectall(TeachTask teachTask) {
		// TODO Auto-generated method stub
		String hql="select tt from TeachTask tt left outer join fetch tt.teacher left outer join fetch tt.course where tt.Curricula=?";
		String[] parmas={teachTask.getCurricula()};
		return dao.select(hql,parmas);
	}
	
}
