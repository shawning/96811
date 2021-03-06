package com.mp.base;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;
/**
 * 
 * @author xiaoning
 * 类描述：共用的mybatis方法，如增删改查
 * @param <T>
 */

public interface BaseDao<T> {

	public Object getObject(String id,Object object); 
	
	public boolean delete(String id, T entity) throws DataAccessException;
	
	public boolean deletes(String id, Object object) throws DataAccessException;
	
	public List<T> select(String id, Object params) throws DataAccessException;
	
	public List selects(String id, Object params) throws DataAccessException;

	public T selectEntity(String id, Object params) throws DataAccessException;

	public Integer getTotalCount(String id, Object params)
			throws DataAccessException;



	@Deprecated
	public PageModel getPage(String listId, String countId,
			Map paramsMap);
	@Deprecated
	PageModel getPage(String listId, String countId, Object params,
			PageModel pageModel);
	
	public PageModel getPage(String listId,Map paramsMap);
	
	public PageModel getPage(String listId, Object params,
			PageModel pageModel);
	
	public boolean insertSelective(T entity) throws DataAccessException;

	public boolean insert(String id, T entity) throws DataAccessException;
	public T insertReturnId(String id, T entity) throws DataAccessException;

	public boolean insertObj(String id, Object params)
			throws DataAccessException;

	public boolean updateByPrimaryKeySelective(T entity)
			throws DataAccessException;

	public boolean update(String id, T entity) throws DataAccessException;

	public boolean deleteByPrimaryKey(Integer pk) throws DataAccessException;

	public T selectByPrimaryKey(Integer pk) throws DataAccessException;
	public T selectByPrimaryKey(String pk) throws DataAccessException;
	public T selectByPhone(String phone) throws DataAccessException;
	public T selectByPhoneAndDelFlag(String phone) throws DataAccessException;

	public List<T> selectAll() throws DataAccessException;

	public List<T> selectByEntity(T entity) throws DataAccessException;

	public boolean saveOrUpdate(T entity) throws DataAccessException;

	public boolean saveOrUpdate(String insertId, String updateId, T entity)
			throws DataAccessException;

	public List<Map<String, Object>> selectById(String ids,Integer id);

	boolean updates(String id, Map<String, Object> param);

}
