package model;

public class CourseSchedule {
	private int CSID;
	private Student student;
	private TeachTask teachTask;
	private double ScoreOne;
	private double ScoreTwo;
	private double ScoreThree;
	private double TotalScore;
	public int getCSID() {
		return CSID;
	}
	public void setCSID(int cSID) {
		CSID = cSID;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public TeachTask getTeachTask() {
		return teachTask;
	}
	public void setTeachTask(TeachTask teachTask) {
		this.teachTask = teachTask;
	}
	public double getScoreOne() {
		return ScoreOne;
	}
	public void setScoreOne(double scoreOne) {
		ScoreOne = scoreOne;
	}
	public double getScoreTwo() {
		return ScoreTwo;
	}
	public void setScoreTwo(double scoreTwo) {
		ScoreTwo = scoreTwo;
	}
	public double getScoreThree() {
		return ScoreThree;
	}
	public void setScoreThree(double scoreThree) {
		ScoreThree = scoreThree;
	}
	public double getTotalScore() {
		return TotalScore;
	}
	public void setTotalScore(double totalScore) {
		TotalScore = totalScore;
	}
	
	
	
	
}
