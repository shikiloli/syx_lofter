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
import server.MgrFactory;
import util.json;
import util.util;

import com.opensymphony.xwork2.ModelDriven;

import model.Admin;
import model.College;
import model.Department;

public class DepartmentAction implements ModelDriven<Department>{
	private Department department=new Department();
	HttpServletResponse response=ServletActionContext.getResponse();
	HttpServletRequest request=ServletActionContext.getRequest();

	@Override
	public Department getModel() {
		// TODO Auto-generated method stub
		return this.department;
	}
	
	public void DepartmentShow() throws IOException{
		IDepartment iad=MgrFactory.getDepartmentIntence();
		College college=new College();
		college.setCollegeID(request.getParameter("CollegeID"));
		department.setCollege(college);
		List<Department> list=iad.show(department); 
		String[] not={"teachers","professions"};
		JsonConfig js =json.configJson(not);
		JSONArray json=JSONArray.fromObject(list,js);
		response.setCharacterEncoding("utf-8");
		PrintWriter pw=response.getWriter();
		pw.write(json.toString());
		pw.close();
		pw.flush();
	}
	public String DepartmentInsert(){
		IDepartment iad=MgrFactory.getDepartmentIntence();
		College college=new College();
		college.setCollegeID(request.getParameter("CollegeID"));
		department.setCollege(college);
		if(iad.save(department)==1){
			return "success";
		}
		else {
			return "error";
		}
	}
	public String DepartmentDelete(){
		IDepartment iad=MgrFactory.getDepartmentIntence();
		if(iad.delete(department)==1){
			return "success";
		}
		else {
			return "error";
		}
	}
	public String DepartmentUpdate(){
		IDepartment iad=MgrFactory.getDepartmentIntence();
		College college=new College();
		college.setCollegeID(request.getParameter("CollegeID"));
		department.setCollege(college);
		if(iad.update(department)==1){
			return "success";
		}
		else {
			return "error";
		}
	}
	
}
