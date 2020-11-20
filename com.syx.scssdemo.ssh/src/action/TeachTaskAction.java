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
import server.IProfession;
import server.ITeachTask;
import server.MgrFactory;
import util.json;
import util.util;

import com.opensymphony.xwork2.ModelDriven;

import model.Admin;
import model.College;
import model.Course;
import model.Profession;
import model.TeachTask;
import model.Teacher;

public class TeachTaskAction implements ModelDriven<TeachTask>{
	private TeachTask teachTask=new TeachTask();
	HttpServletResponse response=ServletActionContext.getResponse();
	HttpServletRequest request=ServletActionContext.getRequest();

	@Override
	public TeachTask getModel() {
		// TODO Auto-generated method stub
		return this.teachTask;
	}
	
	public void TeachTaskShow() throws IOException{
		ITeachTask iad=MgrFactory.getTeachTaskIntence();
		Teacher tea=new Teacher();
		tea.setTeacherID(request.getParameter("TeacherID"));
		teachTask.setTeacher(tea);
		List<TeachTask> list=iad.show(teachTask); 
		String[] not={"schedules","courseSchedules","profession","college","teachTasks"};
		JsonConfig js =json.configJson(not);
		JSONArray json=JSONArray.fromObject(list,js);
		System.out.println(json);
		response.setCharacterEncoding("utf-8");
		PrintWriter pw=response.getWriter();
		pw.write(json.toString());
		pw.close();
		pw.flush();
	}
	public String TeachTaskInsert(){
		ITeachTask iad=MgrFactory.getTeachTaskIntence();
		Course course=new Course();
		course.setCourseID(request.getParameter("CourseID"));
		Teacher teacher=new Teacher();
		teacher.setTeacherID(((Teacher)request.getSession().getAttribute("tea")).getTeacherID());
		teachTask.setCourse(course);
		teachTask.setTeacher(teacher);
		teachTask.setCurricula(util.getNowXue());
		teachTask.setAuditing("Œ¥…Û∫À");
		if(iad.save(teachTask)==1){
			return "success";
		}
		else {
			return "error";
		}
	}
	public String TeachTaskDelete(){
		ITeachTask iad=MgrFactory.getTeachTaskIntence();
		Course course=new Course();
		course.setCourseID(request.getParameter("CourseID"));
		Teacher teacher=new Teacher();
		teacher.setTeacherID(((Teacher)request.getSession().getAttribute("tea")).getTeacherID());
		teachTask.setCourse(course);
		teachTask.setTeacher(teacher);
		if(iad.delete(teachTask)==1){
			return "success";
		}
		else {
			return "error";
		}
	}
	public void TeachTaskSelect() throws IOException{
		ITeachTask iad=MgrFactory.getTeachTaskIntence();
		Teacher teacher=new Teacher();
		teacher.setTeacherID(((Teacher)request.getSession().getAttribute("tea")).getTeacherID());
		teachTask.setTeacher(teacher);
		List<TeachTask> list=iad.select(teachTask); 
		String[] not={"schedules","courseSchedules","profession","college","teachTasks"};
		JsonConfig js =json.configJson(not);
		JSONArray json=JSONArray.fromObject(list,js);
		System.out.println(json);
		response.setCharacterEncoding("utf-8");
		PrintWriter pw=response.getWriter();
		pw.write(json.toString());
		pw.close();
		pw.flush();
	}
	public void TeachTaskSelect2() throws IOException{
		ITeachTask iad=MgrFactory.getTeachTaskIntence();
		teachTask.setCurricula(util.getNowXue());
		List<TeachTask> list=iad.selectall(teachTask); 
		String[] not={"schedules","courseSchedules","profession","college","teachTasks"};
		JsonConfig js =json.configJson(not);
		JSONArray json=JSONArray.fromObject(list,js);
		System.out.println(json);
		response.setCharacterEncoding("utf-8");
		PrintWriter pw=response.getWriter();
		pw.write(json.toString());
		pw.close();
		pw.flush();
	}
	
	public String AuditingT(){
		ITeachTask iad=MgrFactory.getTeachTaskIntence();
		Course course=new Course();
		course.setCourseID(request.getParameter("CourseID"));
		Teacher teacher=new Teacher();
		teacher.setTeacherID(request.getParameter("TeacherID"));
		teachTask.setCourse(course);
		teachTask.setTeacher(teacher);
		if(iad.updateT(teachTask)==1){
			return "success";
		}
		else {
			return "error";
		}
	}
	public String AuditingF(){
		ITeachTask iad=MgrFactory.getTeachTaskIntence();
		Course course=new Course();
		course.setCourseID(request.getParameter("CourseID"));
		Teacher teacher=new Teacher();
		teacher.setTeacherID(request.getParameter("TeacherID"));
		teachTask.setCourse(course);
		teachTask.setTeacher(teacher);
		if(iad.updateF(teachTask)==1){
			return "success";
		}
		else {
			return "error";
		}
	}
}
