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
import server.ICourse;
import server.IDepartment;
import server.MgrFactory;
import util.json;
import util.util;

import com.opensymphony.xwork2.ModelDriven;

import model.Admin;
import model.College;
import model.Course;
import model.Department;
import model.Profession;

public class CourseAction implements ModelDriven<Course>{
	private Course course=new Course();
	HttpServletResponse response=ServletActionContext.getResponse();
	HttpServletRequest request=ServletActionContext.getRequest();

	@Override
	public Course getModel() {
		// TODO Auto-generated method stub
		return this.course;
	}
	
	public void CourseShow() throws IOException{
		ICourse iad=MgrFactory.getCourseIntence();
		Profession profession=new Profession();
		profession.setProfessionID(request.getParameter("ProfessionID"));
		course.setProfession(profession);
		List<Course> list=iad.show(course); 
		String[] not={"department","teachTasks","classas"};
		JsonConfig js =json.configJson(not);
		JSONArray json=JSONArray.fromObject(list,js);
		System.out.println(json);
		response.setCharacterEncoding("utf-8");
		PrintWriter pw=response.getWriter();
		pw.write(json.toString());
		pw.close();
		pw.flush();
	}
	public String CourseInsert(){
		ICourse iad=MgrFactory.getCourseIntence();
		Profession profession=new Profession();
		profession.setProfessionID(request.getParameter("ProfessionID"));
		course.setProfession(profession);
		if(iad.save(course)==1){
			return "success";
		}
		else {
			return "error";
		}
	}
	public String CourseDelete(){
		ICourse iad=MgrFactory.getCourseIntence();
		if(iad.delete(course)==1){
			return "success";
		}
		else {
			return "error";
		}
	}
	public String CourseUpdate(){
		ICourse iad=MgrFactory.getCourseIntence();
		Profession profession=new Profession();
		profession.setProfessionID(request.getParameter("ProfessionID"));
		course.setProfession(profession);
		if(iad.update(course)==1){
			return "success";
		}
		else {
			return "error";
		}
	}
	
}
