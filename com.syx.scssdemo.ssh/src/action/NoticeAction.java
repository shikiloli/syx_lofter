package action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import server.IAdmin;
import server.ICollege;
import server.INotice;
import server.IProfession;
import server.MgrFactory;
import util.json;
import util.util;

import com.opensymphony.xwork2.ModelDriven;

import model.Admin;
import model.College;
import model.Notice;
import model.Profession;

public class NoticeAction implements ModelDriven<Notice>{
	private Notice notice=new Notice();
	HttpServletResponse response=ServletActionContext.getResponse();
	HttpServletRequest request=ServletActionContext.getRequest();

	@Override
	public Notice getModel() {
		// TODO Auto-generated method stub
		return this.notice;
	}
	
	public void NoticeShow() throws IOException{
		INotice iad=MgrFactory.getNoticeIntence();
		List<Notice> list=iad.show(notice); 
		String[] not={"notices"};
		JsonConfig js =json.configJson(not);
		JSONArray json=JSONArray.fromObject(list,js);
		response.setCharacterEncoding("utf-8");
		PrintWriter pw=response.getWriter();
		pw.write(json.toString());
		pw.close();
		pw.flush();
	}
	public String NoticeInsert(){
		INotice iad=MgrFactory.getNoticeIntence();
		notice.setReleaseTime(util.getNowTime());
		Admin admin=new Admin();
		admin.setAdminID(((Admin)request.getSession().getAttribute("admin")).getAdminID());
		notice.setAdmin(admin);
		if(iad.save(notice)==1){
			return "success";
		}
		else {
			return "error";
		}
	}
	public String NoticeDelete(){
		INotice iad=MgrFactory.getNoticeIntence();
		int id=Integer.valueOf(request.getParameter("id"));
		notice.setID(id);
		Notice not=iad.find(notice);
		if(iad.delete(notice)==1){
			return "success";
		}
		else {
			return "error";
		}
	}
	public String NoticeFind(){
		INotice iad=MgrFactory.getNoticeIntence();
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
	
}
