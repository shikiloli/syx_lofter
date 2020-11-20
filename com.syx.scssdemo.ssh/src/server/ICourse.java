package server;

import java.util.List;

import model.Course;

public interface ICourse {

	List<Course> show(Course course);

	int save(Course course);

	int delete(Course course);

	int update(Course course);

}
