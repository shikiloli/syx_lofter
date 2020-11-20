package impl;

import java.util.List;

import basic.HibernateDAO;
import model.Admin;
import model.College;
import server.ICollege;

public class CollegeImpl implements ICollege {
	HibernateDAO dao=new HibernateDAO();
	@Override
	public List<College> show(College college) {
		// TODO Auto-generated method stub
		String hql="from College";
		return dao.select(hql);
	}
	@Override
	public int save(College college) {
		// TODO Auto-generated method stub
		if(dao.save(college).equals(college.getCollegeID())){
			return 1;
		}
		else {
			return 0;
		}
	}

	@Override
	public int delete(College college) {
		// TODO Auto-generated method stub
		return dao.delete(College.class, college.getCollegeID());
	}

	@Override
	public int update(College college) {
		// TODO Auto-generated method stub
		College col=(College)dao.findByID(College.class, college.getCollegeID());
		col.setCollegeID(college.getCollegeID());
		col.setCollegeName(college.getCollegeName());
		col.setRemark(college.getRemark());
		return dao.update(col);
	}
	
}
