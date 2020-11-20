package impl;

import java.util.List;

import model.College;
import model.Department;
import basic.HibernateDAO;
import server.IDepartment;

public class DepartmentImpl implements IDepartment {
	HibernateDAO dao=new HibernateDAO();
	@Override
	public List<Department> show(Department department) {
		// TODO Auto-generated method stub
		String hql="select col from College col left outer join fetch col.departments where col.CollegeID=?";
		String[] parmas={department.getCollege().getCollegeID()};
		return dao.select(hql,parmas);
	}
	@Override
	public int save(Department department) {
		// TODO Auto-generated method stub
		if(dao.save(department).equals(department.getDepartmentID())){
			return 1;
		}
		else {
			return 0;
		}
	}

	@Override
	public int delete(Department department) {
		// TODO Auto-generated method stub
		return dao.delete(Department.class, department.getDepartmentID());
	}

	@Override
	public int update(Department department) {
		// TODO Auto-generated method stub
		Department dep=(Department)dao.findByID(Department.class, department.getDepartmentID());
		College college=new College();
		college.setCollegeID(department.getCollege().getCollegeID());
		dep.setCollege(college);
		dep.setDepartmentID(department.getDepartmentID());
		dep.setDepartmentName(department.getDepartmentName());
		dep.setRemark(department.getRemark());
		return dao.update(dep);
	}
}
