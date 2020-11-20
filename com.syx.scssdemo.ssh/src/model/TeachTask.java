package model;

import java.util.Set;

public class TeachTask {
	private int TeachTaskID;
	private String Curricula;
	private String Auditing;
	private String Remarks;
	private Teacher teacher;
	private Course course;
	private Set<Schedule> schedules;
	private Set<CourseSchedule> courseSchedules;
	
	public int getTeachTaskID() {
		return TeachTaskID;
	}
	public void setTeachTaskID(int teachTaskID) {
		TeachTaskID = teachTaskID;
	}
	public Teacher getTeacher() {
		return teacher;
	}
	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}
	public String getCurricula() {
		return Curricula;
	}
	public void setCurricula(String curricula) {
		Curricula = curricula;
	}
	public String getAuditing() {
		return Auditing;
	}
	public void setAuditing(String auditing) {
		Auditing = auditing;
	}
	public String getRemarks() {
		return Remarks;
	}
	public void setRemarks(String remarks) {
		Remarks = remarks;
	}
	public Set<Schedule> getSchedules() {
		return schedules;
	}
	public void setSchedules(Set<Schedule> schedules) {
		this.schedules = schedules;
	}
	public Set<CourseSchedule> getCourseSchedules() {
		return courseSchedules;
	}
	public void setCourseSchedules(Set<CourseSchedule> courseSchedules) {
		this.courseSchedules = courseSchedules;
	}
	
}
