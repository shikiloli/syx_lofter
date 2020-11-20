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
import server.IClassRoom;
import server.ICollege;
import server.MgrFactory;
import util.json;
import util.util;

import com.opensymphony.xwork2.ModelDriven;

import model.Admin;
import model.ClassRoom;
import model.College;

public class ClassRoomAction implements ModelDriven<ClassRoom>{
	private ClassRoom classRoom=new ClassRoom();
	HttpServletResponse response=ServletActionContext.getResponse();
	HttpServletRequest request=ServletActionContext.getRequest();

	@Override
	public ClassRoom getModel() {
		// TODO Auto-generated method stub
		return this.classRoom;
	}
	
	public void ClassRoomShow() throws IOException{
		IClassRoom iad=MgrFactory.getClassRoomIntence();
		List<ClassRoom> list=iad.show(classRoom); 
		String[] not={"schedules"};
		JsonConfig js =json.configJson(not);
		JSONArray json=JSONArray.fromObject(list,js);
		System.out.println(json);
		response.setCharacterEncoding("utf-8");
		PrintWriter pw=response.getWriter();
		pw.write(json.toString());
		pw.close();
		pw.flush();
	}
	public String ClassRoomInsert(){
		IClassRoom iad=MgrFactory.getClassRoomIntence();
		if(iad.save(classRoom)==1){
			return "success";
		}
		else {
			return "error";
		}
	}
	public String ClassRoomDelete(){
		IClassRoom iad=MgrFactory.getClassRoomIntence();
		if(iad.delete(classRoom)==1){
			return "success";
		}
		else {
			return "error";
		}
	}
	public String ClassRoomUpdate(){
		IClassRoom iad=MgrFactory.getClassRoomIntence();
		if(iad.update(classRoom)==1){
			return "success";
		}
		else {
			return "error";
		}
	}
	
}
