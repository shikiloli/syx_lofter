package model;

import java.util.Set;

public class College {
	private String CollegeID;
	private String CollegeName;
	private String Remark;
	private Set<Department> departments;
	private Set<Teacher> teachers;
	public String getCollegeID() {
		return CollegeID;
	}
	public void setCollegeID(String collegeID) {
		CollegeID = collegeID;
	}
	public String getCollegeName() {
		return CollegeName;
	}
	public void setCollegeName(String collegeName) {
		CollegeName = collegeName;
	}
	public String getRemark() {
		return Remark;
	}
	public void setRemark(String remark) {
		Remark = remark;
	}
	public Set<Department> getDepartments() {
		return departments;
	}
	public void setDepartments(Set<Department> departments) {
		this.departments = departments;
	}
	public Set<Teacher> getTeachers() {
		return teachers;
	}
	public void setTeachers(Set<Teacher> teachers) {
		this.teachers = teachers;
	}
	
	
}
