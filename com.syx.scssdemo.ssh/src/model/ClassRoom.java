package model;

import java.util.Set;

public class ClassRoom {
	private String ClassRoomID;
	private String ClassRoomName;
	private String ClassRoomCategory;
	private String Remark;
	private Set<Schedule> schedules;
	
	public String getClassRoomID() {
		return ClassRoomID;
	}
	public void setClassRoomID(String classRoomID) {
		ClassRoomID = classRoomID;
	}
	public String getClassRoomName() {
		return ClassRoomName;
	}
	public void setClassRoomName(String classRoomName) {
		ClassRoomName = classRoomName;
	}
	public String getClassRoomCategory() {
		return ClassRoomCategory;
	}
	public void setClassRoomCategory(String classRoomCategory) {
		ClassRoomCategory = classRoomCategory;
	}
	public String getRemark() {
		return Remark;
	}
	public void setRemark(String remark) {
		Remark = remark;
	}
	public Set<Schedule> getSchedules() {
		return schedules;
	}
	public void setSchedules(Set<Schedule> schedules) {
		this.schedules = schedules;
	}
	
}
