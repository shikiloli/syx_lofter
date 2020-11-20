package server;

import java.util.List;

import model.Department;
import model.Teacher;

public interface ITeacher {

	List<Teacher> show(Teacher teacher);

	int save(Teacher teacher);

	int delete(Teacher teacher);

	int update(Teacher teacher);

	int reset(Teacher teacher);

	Teacher login(Teacher teacher);

	int update2(Teacher teacher);

	int pwdupdate(Teacher teacher);

	List<Teacher> select(Teacher teacher);

}
