package impl;

import java.util.List;

import model.Classa;
import model.Department;
import model.Profession;
import basic.HibernateDAO;
import server.IClassa;

public class ClassaImpl implements IClassa {
	HibernateDAO dao=new HibernateDAO();
	@Override
	public List<Classa> show(Classa classa) {
		// TODO Auto-generated method stub
		String hql="select pro from Profession pro left outer join fetch pro.classas where pro.ProfessionID=?";
		String[] parmas={classa.getProfession().getProfessionID()};
		return dao.select(hql,parmas);
	}
	@Override
	public int save(Classa classa) {
		// TODO Auto-generated method stub
		if(dao.save(classa).equals(classa.getClassID())){
			return 1;
		}
		else {
			return 0;
		}
	}

	@Override
	public int delete(Classa classa) {
		// TODO Auto-generated method stub
		return dao.delete(Classa.class, classa.getClassID());
	}

	@Override
	public int update(Classa classa) {
		// TODO Auto-generated method stub
		Classa cla=(Classa)dao.findByID(Classa.class, classa.getClassID());
		Profession profession=new Profession();
		profession.setProfessionID(classa.getProfession().getProfessionID());
		cla.setProfession(profession);
		cla.setClassID(classa.getClassID());
		cla.setClassName(classa.getClassName());
		cla.setYearName(classa.getYearName());
		cla.setRemark(classa.getRemark());
		return dao.update(cla);
	}
	@Override
	public List<Classa> showall(Classa classa) {
		// TODO Auto-generated method stub
		String hql="from Classa";
		return dao.select(hql);
	}
}
