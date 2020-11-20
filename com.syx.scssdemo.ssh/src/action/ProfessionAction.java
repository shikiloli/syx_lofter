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
import server.IProfession;
import server.MgrFactory;
import util.json;
import util.util;

import com.opensymphony.xwork2.ModelDriven;

import model.Admin;
import model.College;
import model.Department;
import model.Profession;

public class ProfessionAction implements ModelDriven<Profession>{
	private Profession profession=new Profession();
	HttpServletResponse response=ServletActionContext.getResponse();
	HttpServletRequest request=ServletActionContext.getRequest();

	@Override
	public Profession getModel() {
		// TODO Auto-generated method stub
		return this.profession;
	}
	
	public void ProfessionShow() throws IOException{
		IProfession iad=MgrFactory.getProfessionIntence();
		Department department=new Department();
		department.setDepartmentID(request.getParameter("DepartmentID"));
		profession.setDepartment(department);
		List<Profession> list=iad.show(profession); 
		String[] not={"classas","courses","college"};
		JsonConfig js =json.configJson(not);
		JSONArray json=JSONArray.fromObject(list,js);
		response.setCharacterEncoding("utf-8");
		PrintWriter pw=response.getWriter();
		pw.write(json.toString());
		pw.close();
		pw.flush();
	}
	public void ProfessionShowAll() throws IOException{
		IProfession iad=MgrFactory.getProfessionIntence();
		List<Profession> list=iad.showall(profession); 
		String[] not={"department","classas","courses"};
		JsonConfig js =json.configJson(not);
		JSONArray json=JSONArray.fromObject(list,js);
		System.out.println(json);
		response.setCharacterEncoding("utf-8");
		PrintWriter pw=response.getWriter();
		pw.write(json.toString());
		pw.close();
		pw.flush();
	}
	public String ProfessionInsert(){
		IProfession iad=MgrFactory.getProfessionIntence();
		Department department=new Department();
		department.setDepartmentID(request.getParameter("DepartmentID"));
		profession.setDepartment(department);
		if(iad.save(profession)==1){
			return "success";
		}
		else {
			return "error";
		}
	}
	public String ProfessionDelete(){
		IProfession iad=MgrFactory.getProfessionIntence();
		if(iad.delete(profession)==1){
			return "success";
		}
		else {
			return "error";
		}
	}
	public String ProfessionUpdate(){
		IProfession iad=MgrFactory.getProfessionIntence();
		Department department=new Department();
		department.setDepartmentID(request.getParameter("DepartmentID"));
		profession.setDepartment(department);
		if(iad.update(profession)==1){
			return "success";
		}
		else {
			return "error";
		}
	}
	
}
