package model;

import java.util.Set;

public class Course {

	private String CourseID;
	private String Course;
	private int StudyTime;
	private Integer Crediy;
	private String CurriculumTime;
	private String Remark;
	private Profession profession;
	private Set<TeachTask> teachTasks;
	public Profession getProfession() {
		return profession;
	}
	public void setProfession(Profession profession) {
		this.profession = profession;
	}
	public String getCourseID() {
		return CourseID;
	}
	public void setCourseID(String courseID) {
		CourseID = courseID;
	}
	public String getCourse() {
		return Course;
	}
	public void setCourse(String course) {
		Course = course;
	}
	public Integer getCrediy() {
		return Crediy;
	}
	public void setCrediy(Integer crediy) {
		Crediy = crediy;
	}
	public String getRemark() {
		return Remark;
	}
	public void setRemark(String remark) {
		Remark = remark;
	}
	public String getCurriculumTime() {
		return CurriculumTime;
	}
	public void setCurriculumTime(String curriculumTime) {
		CurriculumTime = curriculumTime;
	}
	public int getStudyTime() {
		return StudyTime;
	}
	public void setStudyTime(int studyTime) {
		StudyTime = studyTime;
	}
	public Set<TeachTask> getTeachTasks() {
		return teachTasks;
	}
	public void setTeachTasks(Set<TeachTask> teachTasks) {
		this.teachTasks = teachTasks;
	}
	
	
	
	
}
