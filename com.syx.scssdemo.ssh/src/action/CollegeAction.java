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
import server.MgrFactory;
import util.json;
import util.util;

import com.opensymphony.xwork2.ModelDriven;

import model.Admin;
import model.College;
import model.Profession;

public class CollegeAction implements ModelDriven<College>{
	private College college=new College();
	HttpServletResponse response=ServletActionContext.getResponse();
	HttpServletRequest request=ServletActionContext.getRequest();

	@Override
	public College getModel() {
		// TODO Auto-generated method stub
		return this.college;
	}
	
	public void CollegeShow() throws IOException{
		ICollege iad=MgrFactory.getCollegeIntence();
		List<College> list=iad.show(college); 
		String[] not={"departments","teachers"};
		JsonConfig js =json.configJson(not);
		JSONArray json=JSONArray.fromObject(list,js);
		response.setCharacterEncoding("utf-8");
		PrintWriter pw=response.getWriter();
		pw.write(json.toString());
		pw.close();
		pw.flush();
	}
	public String CollegeInsert(){
		ICollege iad=MgrFactory.getCollegeIntence();
		if(iad.save(college)==1){
			return "success";
		}
		else {
			return "error";
		}
	}
	public String CollegeDelete(){
		ICollege iad=MgrFactory.getCollegeIntence();
		if(iad.delete(college)==1){
			return "success";
		}
		else {
			return "error";
		}
	}
	public String CollegeUpdate(){
		ICollege iad=MgrFactory.getCollegeIntence();
		if(iad.update(college)==1){
			return "success";
		}
		else {
			return "error";
		}
	}
	
}
