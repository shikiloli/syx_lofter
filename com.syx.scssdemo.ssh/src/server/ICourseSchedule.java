package server;

import java.util.List;

import model.CourseSchedule;

public interface ICourseSchedule {

	List<CourseSchedule> show(CourseSchedule courseSchedule);

	int save(CourseSchedule courseSchedule);

	int delete(CourseSchedule courseSchedule);

	List<CourseSchedule> showall(CourseSchedule courseSchedule);

	int update(CourseSchedule courseSchedule);

}
