package basic;

import java.util.List;


@SuppressWarnings("rawtypes")

public interface iHibernateDAO {
	/**
	 * 将对象持久化
	 * @param obj
	 * @return 对象的主键
	 */
	public Object save(Object obj);
	public Object findByID(Class cla, Object id);
	public int update(Object obj);	
	public int delete(Object obj);
	public int delete(Class cla, Object id);
	public int delete(String hql, Object[] parmas);
	
	public List select(String hql);
	public List select(String hql,Object[] parmas);
	public Object selectValue(String hql);
	public Object selectValue(String hql,Object[] parmas);
	
	public Long getPageCount(String hql,int perCount);
	public Long getPageCount(String hql,Object[] parmas,int perCount);
	public List selectPage(String hql,int perCount,int index);
	public List selectPage(String hql,Object[] parmas,int perCount,int index);
	
}
