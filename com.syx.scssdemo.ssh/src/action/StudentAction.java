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

public class StudentAction implements ModelDriven<Student>{
	private Student student=new Student();
	HttpServletResponse response=ServletActionContext.getResponse();
	HttpServletRequest request=ServletActionContext.getRequest();

	@Override
	public Student getModel() {
		// TODO Auto-generated method stub
		return this.student;
	}
	
	public String loginAction() throws NoSuchAlgorithmException{
		if(student.getStuID().equals("")||student.getPassword().equals("")){
			request.setAttribute("error", "");
			return "error";
		}
		IStudent iad=MgrFactory.getStudentIntence();
		Student stu=iad.login(student);
		if(stu!=null){
			if(stu.getPassword().equals(util.UseMD5(student.getPassword()))){
				request.getSession().setAttribute("stu", stu);
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
	
	public void StudentShow() throws IOException{
		IStudent iad=MgrFactory.getStudentIntence();
		Classa classa=new Classa();
		classa.setClassID(request.getParameter("ClassID"));
		student.setClassa(classa);
		List<Student> list=iad.show(student);
		String[] not={"classa","profession","courseSchedules"};
		JsonConfig js =json.configJson(not);
		JSONArray json=JSONArray.fromObject(list,js);
		System.out.println(json);
		response.setCharacterEncoding("utf-8");
		PrintWriter pw=response.getWriter();
		pw.write(json.toString());
		pw.close();
		pw.flush();
	}
	public String StudentInsert() throws NoSuchAlgorithmException{
		IStudent iad=MgrFactory.getStudentIntence();
		Classa classa=new Classa();
		classa.setClassID(request.getParameter("ClassID"));
		student.setClassa(classa);
		student.setPassword(util.UseMD5("123456"));
		student.setPhoto(student.getStuID());
		if(iad.save(student)==1){
			return "success";
		}
		else {
			return "error";
		}
	}
	public String StudentDelete(){
		IStudent iad=MgrFactory.getStudentIntence();
		if(iad.delete(student)==1){
			return "success";
		}
		else {
			return "error";
		}
	}
	public String StudentUpdate(){
		IStudent iad=MgrFactory.getStudentIntence();
		Classa classa=new Classa();
		classa.setClassID(request.getParameter("ClassID"));
		student.setClassa(classa);
		if(iad.update(student)==1){
			return "success";
		}
		else {
			return "error";
		}
	}
	public String Update(){
		IStudent iad=MgrFactory.getStudentIntence();
		Classa classa=new Classa();
		classa.setClassID(request.getParameter("ClassID"));
		student.setClassa(classa);
		if(iad.update2(student)==1){
			Student stu=iad.login(student);
			request.getSession().setAttribute("stu", stu);
			return "success";
		}
		else {
			return "error";
		}
	}
	public String PwdReset(){
		IStudent iad=MgrFactory.getStudentIntence();
		if(iad.reset(student)==1){
			return "success";
		}
		else {
			return "error";
		}
	}
	public String PwdUpdate() throws NoSuchAlgorithmException{
		IStudent iad=MgrFactory.getStudentIntence();
		String pwd=((Student)request.getSession().getAttribute("stu")).getPassword();
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
		student.setPassword(util.UseMD5(newpwd));
		if(iad.pwdupdate(student)==1){
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
		request.getSession().setAttribute("stu", null);
		return "success";
	}
	
}
