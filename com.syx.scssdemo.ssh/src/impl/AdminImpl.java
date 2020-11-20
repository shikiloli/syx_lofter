package impl;

import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;

import basic.HibernateDAO;
import basic.HibernateSessionFactory;
import model.Admin;
import server.IAdmin;
import util.util;

public class AdminImpl implements IAdmin {
	HibernateDAO dao=new HibernateDAO();
	@Override
	public Admin login(Admin admin) {
		// TODO Auto-generated method stub
		return (Admin)dao.findByID(Admin.class, admin.getAdminID());
	}

	@Override
	public List<Admin> show(Admin admin) {
		// TODO Auto-generated method stub
		String hql="from Admin";
		return dao.select(hql);
	}

	@Override
	public int save(Admin admin) {
		// TODO Auto-generated method stub
		if(dao.save(admin).equals(admin.getAdminID())){
			return 1;
		}
		else {
			return 0;
		}
	}

	@Override
	public int delete(Admin admin) {
		// TODO Auto-generated method stub
		return dao.delete(Admin.class, admin.getAdminID());
	}

	@Override
	public int update(Admin admin) {
		// TODO Auto-generated method stub
		Admin ad=(Admin)dao.findByID(Admin.class, admin.getAdminID());
		ad.setAdminID(admin.getAdminID());
		ad.setAdminName(admin.getAdminName());
		ad.setRemark(admin.getRemark());
		return dao.update(ad);
	}

	@Override
	public int reset(Admin admin) {
		// TODO Auto-generated method stub
		Admin ad=(Admin)dao.findByID(Admin.class, admin.getAdminID());
		try {
			ad.setPassword(util.UseMD5("123456"));
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dao.update(ad);
	}

	@Override
	public int pwdupdate(Admin admin) {
		// TODO Auto-generated method stub
		Admin ad=(Admin)dao.findByID(Admin.class, admin.getAdminID());
		ad.setPassword(admin.getPassword());
		return dao.update(ad);
	}
	
}
