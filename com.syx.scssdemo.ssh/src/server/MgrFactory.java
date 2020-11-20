package server;

import impl.AdminImpl;
import impl.ClassRoomImpl;
import impl.ClassaImpl;
import impl.CollegeImpl;
import impl.CourseImpl;
import impl.CourseScheduleImpl;
import impl.DepartmentImpl;
import impl.NoticeImpl;
import impl.ProfessionImpl;
import impl.ScheduleImpl;
import impl.StudentImpl;
import impl.TeachTaskImpl;
import impl.Teacherimpl;
public class MgrFactory{

	public static IAdmin getAdminIntence() {
		// TODO Auto-generated method stub
		return new AdminImpl();
	}

	public static ICollege getCollegeIntence() {
		// TODO Auto-generated method stub
		return new CollegeImpl();
	}

	public static IDepartment getDepartmentIntence() {
		// TODO Auto-generated method stub
		return new DepartmentImpl();
	}

	public static IProfession getProfessionIntence() {
		// TODO Auto-generated method stub
		return new ProfessionImpl();
	}

	public static IClassa getClassaIntence() {
		// TODO Auto-generated method stub
		return new ClassaImpl();
	}

	public static IClassRoom getClassRoomIntence() {
		// TODO Auto-generated method stub
		return new ClassRoomImpl();
	}

	public static ICourse getCourseIntence() {
		// TODO Auto-generated method stub
		return new CourseImpl();
	}

	public static ITeacher getTeacherIntence() {
		// TODO Auto-generated method stub
		return new Teacherimpl();
	}

	public static IStudent getStudentIntence() {
		// TODO Auto-generated method stub
		return new StudentImpl();
	}

	public static INotice getNoticeIntence() {
		// TODO Auto-generated method stub
		return new NoticeImpl();
	}

	public static ITeachTask getTeachTaskIntence() {
		// TODO Auto-generated method stub
		return new TeachTaskImpl();
	}

	public static ISchedule getScheduleIntence() {
		// TODO Auto-generated method stub
		return new ScheduleImpl();
	}

	public static ICourseSchedule getCourseScheduleIntence() {
		// TODO Auto-generated method stub
		return new CourseScheduleImpl();
	}

}
