package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

import org.apache.struts2.ServletActionContext;

import server.IAdmin;
import server.MgrFactory;
import util.json;
import util.util;

import com.opensymphony.xwork2.ModelDriven;

import model.Admin;

public class AdminAction implements ModelDriven<Admin>{
	private Admin admin=new Admin();
	HttpServletResponse response=ServletActionContext.getResponse();
	HttpServletRequest request=ServletActionContext.getRequest();

	@Override
	public Admin getModel() {
		// TODO Auto-generated method stub
		return this.admin;
	}
	public String login() throws NoSuchAlgorithmException{
		if(admin.getAdminID()==null||admin.getPassword()==null){
			request.setAttribute("error", "");
			return "error";
		}
		IAdmin iad=MgrFactory.getAdminIntence();
		Admin ad=iad.login(admin);
		if(ad!=null){
			if(ad.getPassword().equals(util.UseMD5(admin.getPassword()))){
				request.getSession().setAttribute("admin", ad);
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
	
	public void AdminShow() throws IOException{
		IAdmin iad=MgrFactory.getAdminIntence();
		List<Admin> list=iad.show(admin); 
		String[] not={"notices"};
		JsonConfig js =json.configJson(not);
		JSONArray json=JSONArray.fromObject(list,js);
		response.setCharacterEncoding("utf-8");
		PrintWriter pw=response.getWriter();
		pw.write(json.toString());
		pw.close();
		pw.flush();
	}
	public String AdminInsert() throws NoSuchAlgorithmException{
		IAdmin iad=MgrFactory.getAdminIntence();
		admin.setPassword(util.UseMD5("123456"));
		admin.setPhoto(admin.getAdminID());
		if(iad.save(admin)==1){
			return "success";
		}
		else {
			return "error";
		}
	}
	public String AdminDelete(){
		IAdmin iad=MgrFactory.getAdminIntence();
		if(iad.delete(admin)==1){
			return "success";
		}
		else {
			return "error";
		}
	}
	public String AdminUpdate(){
		IAdmin iad=MgrFactory.getAdminIntence();
		admin.setPassword(((Admin)request.getSession().getAttribute("admin")).getPassword());
		admin.setPhoto(admin.getAdminID());
		if(iad.update(admin)==1){
			return "success";
		}
		else {
			return "error";
		}
	}
	public String PwdReset(){
		IAdmin iad=MgrFactory.getAdminIntence();
		if(iad.reset(admin)==1){
			return "success";
		}
		else {
			return "error";
		}
	}
	public String PwdUpdate() throws NoSuchAlgorithmException{
		IAdmin iad=MgrFactory.getAdminIntence();
		String pwd=((Admin)request.getSession().getAttribute("admin")).getPassword();
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
		admin.setPassword(util.UseMD5(newpwd));
		if(iad.pwdupdate(admin)==1){
			return "success";
		}
		else {
			return "error";
		}
	}
	public String Exit(){
		request.getSession().setAttribute("admin", null);
		return "success";
	}
	
}
