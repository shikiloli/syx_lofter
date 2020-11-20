package model;

import java.util.Set;

public class Student {

	private String StuID;
	private String Name;
	private String Sex;
	private String Birth;
	private String Photo;
	private String Phone;
	private String Family;
	private String Password;
	private String Remark;
	private Classa classa;
	private Set<CourseSchedule> courseSchedules;
	
	
	public String getStuID() {
		return StuID;
	}
	public void setStuID(String stuID) {
		StuID = stuID;
	}
	public String getSex() {
		return Sex;
	}
	public void setSex(String sex) {
		Sex = sex;
	}
	public String getBirth() {
		return Birth;
	}
	public void setBirth(String birth) {
		Birth = birth;
	}
	public String getPassword() {
		return Password;
	}
	
	public void setPassword(String password) {
		Password = password;
	}
	public String getRemark() {
		return Remark;
	}
	public void setRemark(String remark) {
		Remark = remark;
	}
	public String getPhoto() {
		return Photo;
	}
	public void setPhoto(String photo) {
		Photo = photo;
	}
	public Classa getClassa() {
		return classa;
	}
	public void setClassa(Classa classa) {
		this.classa = classa;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getPhone() {
		return Phone;
	}
	public void setPhone(String phone) {
		Phone = phone;
	}
	public String getFamily() {
		return Family;
	}
	public void setFamily(String family) {
		Family = family;
	}
	public Set<CourseSchedule> getCourseSchedules() {
		return courseSchedules;
	}
	public void setCourseSchedules(Set<CourseSchedule> courseSchedules) {
		this.courseSchedules = courseSchedules;
	}
	
	
}
