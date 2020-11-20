package model;

import java.util.Set;

public class Classa {

	private String ClassID;
	private String ClassName;
	private String YearName;
	private String Remark;
	private Profession profession;
	private Set<Student> students;
	public String getClassID() {
		return ClassID;
	}
	public void setClassID(String classID) {
		ClassID = classID;
	}
	public String getClassName() {
		return ClassName;
	}
	public void setClassName(String className) {
		ClassName = className;
	}
	public String getRemark() {
		return Remark;
	}
	public void setRemark(String remark) {
		Remark = remark;
	}
	public Profession getProfession() {
		return profession;
	}
	public void setProfession(Profession profession) {
		this.profession = profession;
	}
	public Set<Student> getStudents() {
		return students;
	}
	public void setStudents(Set<Student> students) {
		this.students = students;
	}
	public String getYearName() {
		return YearName;
	}
	public void setYearName(String yearName) {
		YearName = yearName;
	}
	
	
}
