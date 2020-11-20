package server;

import java.util.List;

import model.College;
import model.Schedule;

public interface ISchedule {

	List<Schedule> show(Schedule schedule);

	int save(Schedule schedule);

	List<Schedule> showall(Schedule schedule);

	int delete(Schedule schedule);

}
