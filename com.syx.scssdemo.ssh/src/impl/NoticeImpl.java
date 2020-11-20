package impl;

import java.util.List;

import model.College;
import model.Notice;
import basic.HibernateDAO;
import server.INotice;

public class NoticeImpl implements INotice {
	HibernateDAO dao=new HibernateDAO();
	
	@Override
	public List<Notice> show(Notice college) {
		// TODO Auto-generated method stub
		String hql="from Notice";
		return dao.select(hql);
	}
	
	@Override
	public int save(Notice notice) {
		// TODO Auto-generated method stub
		if(dao.save(notice).equals(notice.getID())){
			return 1;
		}
		else {
			return 0;
		}
	}

	@Override
	public int delete(Notice notice) {
		// TODO Auto-generated method stub
		return dao.delete(Notice.class, notice.getID());
	}

	@Override
	public Notice find(Notice notice) {
		// TODO Auto-generated method stub
		return (Notice)dao.findByID(Notice.class, notice.getID());
	}
}
