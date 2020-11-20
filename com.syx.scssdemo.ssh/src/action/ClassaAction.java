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
import server.IClassa;
import server.ICollege;
import server.IDepartment;
import server.IProfession;
import server.MgrFactory;
import util.json;
import util.util;

import com.opensymphony.xwork2.ModelDriven;

import model.Admin;
import model.Classa;
import model.College;
import model.Department;
import model.Profession;

public class ClassaAction implements ModelDriven<Classa>{
	private Classa classa=new Classa();
	HttpServletResponse response=ServletActionContext.getResponse();
	HttpServletRequest request=ServletActionContext.getRequest();

	@Override
	public Classa getModel() {
		// TODO Auto-generated method stub
		return this.classa;
	}
	
	public void ClassaShow() throws IOException{
		IClassa iad=MgrFactory.getClassaIntence();
		Profession profession=new Profession();
		profession.setProfessionID(request.getParameter("ProfessionID"));
		classa.setProfession(profession);
		List<Classa> list=iad.show(classa); 
		String[] not={"students","department","courses"};
		JsonConfig js =json.configJson(not);
		JSONArray json=JSONArray.fromObject(list,js);
		response.setCharacterEncoding("utf-8");
		PrintWriter pw=response.getWriter();
		pw.write(json.toString());
		pw.close();
		pw.flush();
	}
	public void ClassaShowAll() throws IOException{
		IClassa iad=MgrFactory.getClassaIntence();
		List<Classa> list=iad.showall(classa);
		String[] not={"students","profession"};
		JsonConfig js =json.configJson(not);
		JSONArray json=JSONArray.fromObject(list,js);
		System.out.println(json);
		response.setCharacterEncoding("utf-8");
		PrintWriter pw=response.getWriter();
		pw.write(json.toString());
		pw.close();
		pw.flush();
	}
	public String ClassaInsert(){
		IClassa iad=MgrFactory.getClassaIntence();
		Profession profession=new Profession();
		profession.setProfessionID(request.getParameter("ProfessionID"));
		classa.setProfession(profession);
		if(iad.save(classa)==1){
			return "success";
		}
		else {
			return "error";
		}
	}
	public String ClassaDelete(){
		IClassa iad=MgrFactory.getClassaIntence();
		if(iad.delete(classa)==1){
			return "success";
		}
		else {
			return "error";
		}
	}
	public String ClassaUpdate(){
		IClassa iad=MgrFactory.getClassaIntence();
		Profession profession=new Profession();
		profession.setProfessionID(request.getParameter("ProfessionID"));
		classa.setProfession(profession);
		if(iad.update(classa)==1){
			return "success";
		}
		else {
			return "error";
		}
	}
	
}
