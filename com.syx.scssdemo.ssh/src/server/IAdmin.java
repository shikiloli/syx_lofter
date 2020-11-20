package server;

import java.util.List;

import model.Admin;
import model.Teacher;

public interface IAdmin {

	Admin login(Admin admin);

	List<Admin> show(Admin admin);

	int save(Admin admin);

	int delete(Admin admin);

	int update(Admin admin);

	int reset(Admin admin);

	int pwdupdate(Admin admin);
	
}
