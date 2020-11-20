package model;

import java.util.Set;

public class Profession {
	private String ProfessionID;
	private String ProfessionName;
	private String Remark;
	private Department department;
	private Set<Classa> classas;
	private Set<Course> courses;
	public String getProfessionID() {
		return ProfessionID;
	}
	public void setProfessionID(String professionID) {
		ProfessionID = professionID;
	}
	public String getProfessionName() {
		return ProfessionName;
	}
	public void setProfessionName(String professionName) {
		ProfessionName = professionName;
	}
	public String getRemark() {
		return Remark;
	}
	public void setRemark(String remark) {
		Remark = remark;
	}
	public Department getDepartment() {
		return department;
	}
	public void setDepartment(Department department) {
		this.department = department;
	}
	public Set<Classa> getClassas() {
		return classas;
	}
	public void setClassas(Set<Classa> classas) {
		this.classas = classas;
	}
	public Set<Course> getCourses() {
		return courses;
	}
	public void setCourses(Set<Course> courses) {
		this.courses = courses;
	}
	

}
