package server;

import java.util.List;

import model.TeachTask;

public interface ITeachTask {

	List<TeachTask> show(TeachTask teachTask);

	int save(TeachTask teachTask);

	int delete(TeachTask teachTask);

	List<TeachTask> select(TeachTask teachTask);

	int updateT(TeachTask teachTask);

	int updateF(TeachTask teachTask);

	List<TeachTask> selectall(TeachTask teachTask);

}
