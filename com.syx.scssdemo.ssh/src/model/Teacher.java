package model;

import java.util.Set;

public class Teacher {
	private String TeacherID;
	private String Name;
	private String Sex;
	private String Birth;
	private String Photo;
	private String Kulture;
	private String Home;
	private String Password;
	private String Remark;
	private College College;
	private Set<TeachTask> teachTasks;
	public College getCollege() {
		return College;
	}
	public void setCollege(College college) {
		College = college;
	}
	public String getTeacherID() {
		return TeacherID;
	}
	public void setTeacherID(String teacherID) {
		TeacherID = teacherID;
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
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getKulture() {
		return Kulture;
	}
	public void setKulture(String kulture) {
		Kulture = kulture;
	}
	public String getHome() {
		return Home;
	}
	public void setHome(String home) {
		Home = home;
	}
	public Set<TeachTask> getTeachTasks() {
		return teachTasks;
	}
	public void setTeachTasks(Set<TeachTask> teachTasks) {
		this.teachTasks = teachTasks;
	}
	
	
}
