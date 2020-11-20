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
import server.IDepartment;
import server.INotice;
import server.IStudent;
import server.ITeacher;
import server.MgrFactory;
import util.json;
import util.util;

import com.opensymphony.xwork2.ModelDriven;

import model.Admin;
import model.Classa;
import model.College;
import model.Department;
import model.Notice;
import model.Student;
import model.Teacher;

public class TeacherAction implements ModelDriven<Teacher>{
	private Teacher teacher=new Teacher();
	HttpServletResponse response=ServletActionContext.getResponse();
	HttpServletRequest request=ServletActionContext.getRequest();

	@Override
	public Teacher getModel() {
		// TODO Auto-generated method stub
		return this.teacher;
	}
	
	public String loginAction() throws NoSuchAlgorithmException{
		if(teacher.getTeacherID().equals("")||teacher.getPassword().equals("")){
			request.setAttribute("error", "");
			return "error";
		}
		ITeacher iad=MgrFactory.getTeacherIntence();
		Teacher tea=iad.login(teacher);
		if(tea!=null){
			if(tea.getPassword().equals(util.UseMD5(teacher.getPassword()))){
				request.getSession().setAttribute("tea", tea);
				return "success";
			}
			else {
				request.setAttribute("error", "您输入的密码有误！");
				return "error";
			}
		}
		else{
			request.setAttribute("error", "您输入的用户名有误！");
			return "error";
		}
	}
	
	public void TeacherShow() throws IOException{
		ITeacher iad=MgrFactory.getTeacherIntence();
		College college=new College();
		college.setCollegeID(request.getParameter("CollegeID"));
		teacher.setCollege(college);
		List<Teacher> list=iad.show(teacher); 
		String[] not={"departments","teachTasks"};
		JsonConfig js =json.configJson(not);
		JSONArray json=JSONArray.fromObject(list,js);
		response.setCharacterEncoding("utf-8");
		PrintWriter pw=response.getWriter();
		pw.write(json.toString());
		pw.close();
		pw.flush();
	}
	public void TeacherSelect() throws IOException{
		ITeacher iad=MgrFactory.getTeacherIntence();
		College college=new College();
		college.setCollegeID(request.getParameter("CollegeID"));
		teacher.setCollege(college);
		List<Teacher> list=iad.select(teacher); 
		String[] not={"departments","tasks","college"};
		JsonConfig js =json.configJson(not);
		JSONArray json=JSONArray.fromObject(list,js);
		System.out.println(json);
		response.setCharacterEncoding("utf-8");
		PrintWriter pw=response.getWriter();
		pw.write(json.toString());
		pw.close();
		pw.flush();
	}
	public String TeacherInsert() throws NoSuchAlgorithmException{
		ITeacher iad=MgrFactory.getTeacherIntence();
		College college=new College();
		college.setCollegeID(request.getParameter("CollegeID"));
		teacher.setCollege(college);
		teacher.setPassword(util.UseMD5("123456"));
		teacher.setPhoto(teacher.getTeacherID());
		if(iad.save(teacher)==1){
			return "success";
		}
		else {
			return "error";
		}
	}
	public String TeacherDelete(){
		ITeacher iad=MgrFactory.getTeacherIntence();
		if(iad.delete(teacher)==1){
			return "success";
		}
		else {
			return "error";
		}
	}
	public String TeacherUpdate(){
		ITeacher iad=MgrFactory.getTeacherIntence();
		College college=new College();
		college.setCollegeID(request.getParameter("CollegeID"));
		teacher.setCollege(college);
		if(iad.update(teacher)==1){
			return "success";
		}
		else {
			return "error";
		}
	}
	public String Update(){
		ITeacher iad=MgrFactory.getTeacherIntence();
		College college=new College();
		college.setCollegeID(request.getParameter("CollegeID"));
		teacher.setCollege(college);
		if(iad.update2(teacher)==1){
			Teacher tea=iad.login(teacher);
			request.getSession().setAttribute("tea", tea);
			return "success";
		}
		else {
			return "error";
		}
	}
	public String PwdUpdate() throws NoSuchAlgorithmException{
		ITeacher iad=MgrFactory.getTeacherIntence();
		String pwd=((Teacher)request.getSession().getAttribute("tea")).getPassword();
		String oldpwd=util.UseMD5(request.getParameter("oldpwd"));
		String newpwd=request.getParameter("newpwd");
		String newpwd2=request.getParameter("newpwd2");
		if(!pwd.equals(oldpwd)){
			request.setAttribute("errorpwd", "您的原密码输入不正确!");
			return "success";
		}
		else if(!newpwd.equals(newpwd2)){
			request.setAttribute("errorpwd", "您的输入的两次新密码不正确!");
			return "success";
		}
		teacher.setPassword(util.UseMD5(newpwd));
		if(iad.pwdupdate(teacher)==1){
			return "success";
		}
		else {
			return "error";
		}
	}
	public String PwdReset(){
		ITeacher iad=MgrFactory.getTeacherIntence();
		if(iad.reset(teacher)==1){
			return "success";
		}
		else {
			return "error";
		}
	}
	public String NoticeFind(){
		INotice iad=MgrFactory.getNoticeIntence();
		Notice notice=new Notice();
		int id=Integer.valueOf(request.getParameter("id"));
		notice.setID(id);
		Notice not=iad.find(notice);
		if(not!=null){
			request.setAttribute("notice", not);
			return "success";
		}
		else {
			return "error";
		}
	}
	public String Exit(){
		request.getSession().setAttribute("tea", null);
		return "success";
	}
}
