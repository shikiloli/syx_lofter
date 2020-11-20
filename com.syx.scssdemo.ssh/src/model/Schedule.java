package model;

public class Schedule {
	private int ScheduleID;
	private TeachTask teachTask;
	private ClassRoom classRoom;
	private String ClassTime;
	private String Classfestival;
	private String Remark;
	
	public int getScheduleID() {
		return ScheduleID;
	}
	public void setScheduleID(int scheduleID) {
		ScheduleID = scheduleID;
	}
	public TeachTask getTeachTask() {
		return teachTask;
	}
	public void setTeachTask(TeachTask teachTask) {
		this.teachTask = teachTask;
	}
	public ClassRoom getClassRoom() {
		return classRoom;
	}
	public void setClassRoom(ClassRoom classRoom) {
		this.classRoom = classRoom;
	}
	public String getClassTime() {
		return ClassTime;
	}
	public void setClassTime(String classTime) {
		ClassTime = classTime;
	}
	public String getClassfestival() {
		return Classfestival;
	}
	public void setClassfestival(String classfestival) {
		Classfestival = classfestival;
	}
	public String getRemark() {
		return Remark;
	}
	public void setRemark(String remark) {
		Remark = remark;
	}
	
}
