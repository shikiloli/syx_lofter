package server;

import java.util.List;

import model.College;
import model.Schedule;

public interface ICollege {

	List<College> show(College college);

	int save(College college);

	int delete(College college);

	int update(College college);

}
