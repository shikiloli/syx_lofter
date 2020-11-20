package impl;

import java.util.List;

import model.Department;
import model.Profession;
import basic.HibernateDAO;
import server.IProfession;

public class ProfessionImpl implements IProfession {
	HibernateDAO dao=new HibernateDAO();
	@Override
	public List<Profession> show(Profession profession) {
		// TODO Auto-generated method stub
		String hql="select dep from Department dep left outer join fetch dep.professions where dep.DepartmentID=?";
		String[] parmas={profession.getDepartment().getDepartmentID()};
		return dao.select(hql,parmas);
	}
	@Override
	public int save(Profession profession) {
		// TODO Auto-generated method stub
		if(dao.save(profession).equals(profession.getProfessionID())){
			return 1;
		}
		else {
			return 0;
		}
	}

	@Override
	public int delete(Profession profession) {
		// TODO Auto-generated method stub
		return dao.delete(Profession.class, profession.getProfessionID());
	}

	@Override
	public int update(Profession profession) {
		// TODO Auto-generated method stub
		Profession pro=(Profession)dao.findByID(Profession.class, profession.getProfessionID());
		Department department=new Department();
		department.setDepartmentID(profession.getDepartment().getDepartmentID());
		pro.setDepartment(department);
		pro.setProfessionID(profession.getProfessionID());
		pro.setProfessionName(profession.getProfessionName());
		pro.setRemark(profession.getRemark());
		return dao.update(pro);
	}
	@Override
	public List<Profession> showall(Profession profession) {
		// TODO Auto-generated method stub
		String hql="from Profession";
		return dao.select(hql);
	}
}
