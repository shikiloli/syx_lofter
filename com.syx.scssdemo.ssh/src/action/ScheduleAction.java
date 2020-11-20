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
import server.ISchedule;
import server.MgrFactory;
import util.json;
import util.util;

import com.opensymphony.xwork2.ModelDriven;

import model.Admin;
import model.ClassRoom;
import model.College;
import model.Profession;
import model.Schedule;
import model.TeachTask;
import model.Teacher;

public class ScheduleAction implements ModelDriven<Schedule>{
	private Schedule schedule=new Schedule();
	HttpServletResponse response=ServletActionContext.getResponse();
	HttpServletRequest request=ServletActionContext.getRequest();

	@Override
	public Schedule getModel() {
		// TODO Auto-generated method stub
		return this.schedule;
	}
	
	public void ScheduleShow() throws IOException{
		ISchedule iad=MgrFactory.getScheduleIntence();
		Teacher teacher=new Teacher();
		teacher.setTeacherID(((Teacher)request.getSession().getAttribute("tea")).getTeacherID());
		TeachTask teachTask=new TeachTask();
		teachTask.setTeacher(teacher);
		schedule.setTeachTask(teachTask);
		List<Schedule> list=iad.show(schedule);
		String[] not={"schedules","courseSchedules","profession","college","teachTasks","schedules"};
		JsonConfig js =json.configJson(not);
		JSONArray json=JSONArray.fromObject(list,js);
		System.out.println(json);
		response.setCharacterEncoding("utf-8");
		PrintWriter pw=response.getWriter();
		pw.write(json.toString());
		pw.close();
		pw.flush();
	}
	public void ScheduleShowAll() throws IOException{
		ISchedule iad=MgrFactory.getScheduleIntence();
		List<Schedule> list=iad.showall(schedule); 
		String[] not={"schedules","courseSchedules","profession","college","teachTasks","schedules"};
		JsonConfig js =json.configJson(not);
		JSONArray json=JSONArray.fromObject(list,js);
		System.out.println(json);
		response.setCharacterEncoding("utf-8");
		PrintWriter pw=response.getWriter();
		pw.write(json.toString());
		pw.close();
		pw.flush();
	}
	public String ScheduleInsert(){
		ClassRoom classRoom=new ClassRoom();
		classRoom.setClassRoomID(request.getParameter("ClassRoomID"));
		TeachTask teachTask=new TeachTask();
		int TeachTaskID=Integer.valueOf(request.getParameter("TeachTaskID"));
		teachTask.setTeachTaskID(TeachTaskID);
		schedule.setClassRoom(classRoom);
		schedule.setTeachTask(teachTask);
		ISchedule iad=MgrFactory.getScheduleIntence();
		if(iad.save(schedule)==1){
			return "success";
		}
		else {
			return "error";
		}
	}
	public String ScheduleDelete(){
		ISchedule iad=MgrFactory.getScheduleIntence();
		if(iad.delete(schedule)==1){
			return "success";
		}
		else {
			return "error";
		}
	}
}
