package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

import org.apache.struts2.ServletActionContext;

import server.IAdmin;
import server.ICollege;
import server.ICourseSchedule;
import server.IProfession;
import server.MgrFactory;
import util.json;
import util.util;

import com.opensymphony.xwork2.ModelDriven;

import model.Admin;
import model.College;
import model.CourseSchedule;
import model.Profession;
import model.Student;
import model.TeachTask;
import model.Teacher;

public class CourseScheduleAction implements ModelDriven<CourseSchedule>{
	private CourseSchedule courseSchedule=new CourseSchedule();
	HttpServletResponse response=ServletActionContext.getResponse();
	HttpServletRequest request=ServletActionContext.getRequest();

	@Override
	public CourseSchedule getModel() {
		// TODO Auto-generated method stub
		return this.courseSchedule;
	}
	
	public void CourseScheduleShow() throws IOException{
		ICourseSchedule iad=MgrFactory.getCourseScheduleIntence();
		Student student=new Student();
		student.setStuID(((Student)request.getSession().getAttribute("stu")).getStuID());
		courseSchedule.setStudent(student);
		List<CourseSchedule> list=iad.show(courseSchedule); 
		String[] not={"schedules","courseSchedules","profession","college","teachTasks","classa","courseSchedules"};
		JsonConfig js =json.configJson(not);
		JSONArray json=JSONArray.fromObject(list,js);
		response.setCharacterEncoding("utf-8");
		PrintWriter pw=response.getWriter();
		pw.write(json.toString());
		pw.close();
		pw.flush();
	}
	public void CourseScheduleShowAll() throws IOException{
		ICourseSchedule iad=MgrFactory.getCourseScheduleIntence();
		Teacher teacher=new Teacher();
		teacher.setTeacherID(((Teacher)request.getSession().getAttribute("tea")).getTeacherID());
		TeachTask teachTask=new TeachTask();
		teachTask.setTeacher(teacher);
		courseSchedule.setTeachTask(teachTask);
		List<CourseSchedule> list=iad.showall(courseSchedule); 
		String[] not={"schedules","courseSchedules","profession","college","teachTasks","classa","courseSchedules"};
		JsonConfig js =json.configJson(not);
		JSONArray json=JSONArray.fromObject(list,js);
		response.setCharacterEncoding("utf-8");
		PrintWriter pw=response.getWriter();
		pw.write(json.toString());
		pw.close();
		pw.flush();
	}
	public String CourseScheduleInsert(){
		ICourseSchedule iad=MgrFactory.getCourseScheduleIntence();
		Student student=new Student();
		student.setStuID(((Student)request.getSession().getAttribute("stu")).getStuID());
		TeachTask teachTask=new TeachTask();
		int TeachTaskID=Integer.valueOf(request.getParameter("TeachTaskID"));
		teachTask.setTeachTaskID(TeachTaskID);
		courseSchedule.setStudent(student);
		courseSchedule.setTeachTask(teachTask);
		if(iad.save(courseSchedule)==1){
			return "success";
		}
		else {
			return "error";
		}
	}
	public String CourseScheduleDelete(){
		ICourseSchedule iad=MgrFactory.getCourseScheduleIntence();
		Student student=new Student();
		student.setStuID(((Student)request.getSession().getAttribute("stu")).getStuID());
		TeachTask teachTask=new TeachTask();
		int TeachTaskID=Integer.valueOf(request.getParameter("TeachTaskID"));
		teachTask.setTeachTaskID(TeachTaskID);
		courseSchedule.setStudent(student);
		courseSchedule.setTeachTask(teachTask);
		if(iad.delete(courseSchedule)==1){
			return "success";
		}
		else {
			return "error";
		}
	}
	public String CourseScheduleUpdate(){
		ICourseSchedule iad=MgrFactory.getCourseScheduleIntence();
		Student student=new Student();
		student.setStuID(request.getParameter("StuID"));
		TeachTask teachTask=new TeachTask();
		int TeachTaskID=Integer.valueOf(request.getParameter("TeachTaskID"));
		teachTask.setTeachTaskID(TeachTaskID);
		courseSchedule.setStudent(student);
		courseSchedule.setTeachTask(teachTask);
		if(iad.update(courseSchedule)==1){
			return "success";
		}
		else {
			return "error";
		}
	}
	
}
