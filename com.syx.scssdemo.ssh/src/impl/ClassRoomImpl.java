package impl;

import java.util.List;

import model.ClassRoom;
import model.College;
import basic.HibernateDAO;
import server.IClassRoom;

public class ClassRoomImpl implements IClassRoom {
	HibernateDAO dao=new HibernateDAO();
	@Override
	public List<ClassRoom> show(ClassRoom classRoom) {
		// TODO Auto-generated method stub
		String hql="from ClassRoom";
		return dao.select(hql);
	}
	@Override
	public int save(ClassRoom classRoom) {
		// TODO Auto-generated method stub
		if(dao.save(classRoom).equals(classRoom.getClassRoomID())){
			return 1;
		}
		else {
			return 0;
		}
	}

	@Override
	public int delete(ClassRoom classRoom) {
		// TODO Auto-generated method stub
		return dao.delete(ClassRoom.class, classRoom.getClassRoomID());
	}

	@Override
	public int update(ClassRoom classRoom) {
		// TODO Auto-generated method stub
		ClassRoom cr=(ClassRoom)dao.findByID(ClassRoom.class, classRoom.getClassRoomID());
		cr.setClassRoomID(classRoom.getClassRoomID());
		cr.setClassRoomName(classRoom.getClassRoomName());
		cr.setClassRoomCategory(classRoom.getClassRoomCategory());
		cr.setRemark(classRoom.getRemark());
		return dao.update(cr);
	}
}
