package server;

import java.util.List;

import model.Department;

public interface IDepartment {

	List<Department> show(Department department);

	int save(Department department);

	int delete(Department department);

	int update(Department department);

}
