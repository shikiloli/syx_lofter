package model;

import java.util.Set;

public class Department {
	private String DepartmentID;
	private String DepartmentName;
	private College college;
	private String Remark;
	private Set<Profession> professions;
	public String getDepartmentID() {
		return DepartmentID;
	}
	public void setDepartmentID(String departmentID) {
		DepartmentID = departmentID;
	}
	public String getDepartmentName() {
		return DepartmentName;
	}
	public void setDepartmentName(String departmentName) {
		DepartmentName = departmentName;
	}
	public String getRemark() {
		return Remark;
	}
	public void setRemark(String remark) {
		Remark = remark;
	}
	public College getCollege() {
		return college;
	}
	public void setCollege(College college) {
		this.college = college;
	}
	public Set<Profession> getProfessions() {
		return professions;
	}
	public void setProfessions(Set<Profession> professions) {
		this.professions = professions;
	}
	
	
	
}
