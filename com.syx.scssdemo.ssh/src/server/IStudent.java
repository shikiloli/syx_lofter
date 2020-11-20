package server;

import java.util.List;

import model.Student;
import model.Teacher;

public interface IStudent {

	List<Student> show(Student student);

	int save(Student student);

	int delete(Student student);

	int update(Student student);
	
	int reset(Student student);

	Student login(Student student);

	int pwdupdate(Student student);

	int update2(Student student);

}
