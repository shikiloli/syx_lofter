package server;

import java.util.List;

import model.ClassRoom;

public interface IClassRoom {

	List<ClassRoom> show(ClassRoom classRoom);

	int save(ClassRoom classRoom);

	int delete(ClassRoom classRoom);

	int update(ClassRoom classRoom);

}
