package com.mp.base;

import java.lang.reflect.ParameterizedType;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.BeanWrapper;
import org.springframework.beans.BeanWrapperImpl;
import org.springframework.dao.DataAccessException;

import com.github.pagehelper.PageHelper;

/*import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;*/
/**
 * 
 * @author xiaoning
 * 类描述：共用的mybatis方法实现类，在dao.impl的类中需要实现，如增删改查
 * @param <T>
 */
@SuppressWarnings({ "unchecked" })
public class BaseDaoImpl<T> extends SqlSessionDaoSupport
		{

	private Class<T> entityClass;
	private String mapperNamespace;

	public BaseDaoImpl() {
		setEntityClass((Class<T>) ((ParameterizedType) getClass()
				.getGenericSuperclass()).getActualTypeArguments()[0]);
	}

	@Resource
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}

	public List<T> selectAll() throws DataAccessException {
		List<T> result = new ArrayList<T>();
		try {
			result = this.getSqlSession().selectList(
					getMapperNamespace() + "." + "selectAll");
		} catch (DataAccessException e) {
			throw e;
		}
		return result;
	}

	public Integer getTotalCount(Object params) throws DataAccessException {
		return getSqlSession().selectOne(
				getMapperNamespace() + "." + "getTotalCount", params);
	}

	public boolean insertSelective(T entity) throws DataAccessException {
		return insert("insertSelective", entity);
	}

	public boolean deleteByPrimaryKey(Integer pk) throws DataAccessException {
		boolean flag = false;
		try {
			flag = this.getSqlSession().delete(
					getMapperNamespace() + "." + "deleteByPrimaryKey", pk) > 0 ? true
					: false;
		} catch (DataAccessException e) {
			flag = false;
			throw e;
		}
		return flag;
	}

	public T selectByPrimaryKey(Integer pk) throws DataAccessException {
		System.out.println("namespace:"+this.getMapperNamespace());
		T result = null;
		try {
			result = (T) this.getSqlSession().selectOne(
					getMapperNamespace() + "." + "selectByPrimaryKey", pk);
		} catch (DataAccessException e) {
			throw e;
		}
		return result;
	}
	public T selectByPrimaryKey(String pk) throws DataAccessException {
		T result = null;
		try {
			result = (T) this.getSqlSession().selectOne(
					getMapperNamespace() + "." + "selectByPrimaryKey", pk);
		} catch (DataAccessException e) {
			throw e;
		}
		return result;
	}
	//New
	public T selectByPhone(String phone) throws DataAccessException {
		T result = null;
		try {
			result = (T) this.getSqlSession().selectOne(
					getMapperNamespace() + "." + "selectByPhone", phone);
		} catch (DataAccessException e) {
			throw e;
		}
		return result;
	}
	//New
	public T selectByPhoneAndDelFlag(String phone) throws DataAccessException {
		T result = null;
		try {
			result = (T) this.getSqlSession().selectOne(
					getMapperNamespace() + "." + "selectByPhoneAndDelFlag", phone);
		} catch (DataAccessException e) {
			throw e;
		}
		return result;
	}
	public List<T> selectByEntity(T entity) throws DataAccessException {

		return select("selectByEntity", entity);
	}

	public boolean delete(String id, T entity) throws DataAccessException {
		boolean flag = false;
		try {
			flag = this.getSqlSession().delete(getMapperNamespace() + "." + id,
					entity) > 0 ? true : false;
		} catch (DataAccessException e) {
			flag = false;
			throw e;
		}
		return flag;
	}

	public Integer getTotalCount(String id, Object params)
			throws DataAccessException {
		return getSqlSession().selectOne(getMapperNamespace() + "." + id,
				params);
	}
//	public PageModel getPage(String listId, Object params,PageModel pageModel) {
//		this.getSqlSession().select
//		List list = this.getSqlSession().selectList(getMapperNamespace() + "." + listId,
//													params,
//													new PageBounds(pageModel.getCurrentPage(), pageModel.getPageSize()));
//		pageModel.setList(list);
//		PageList pageList = (PageList)list;
//		pageModel.setTotalRecord(pageList.getPaginator().getTotalCount());
//		
//		return pageModel;
//	}

	/*@Deprecated
	@Override*/
	public PageModel getPage(String listId, String countId, Object params,
			PageModel pageModel) {
		// 得到数据记录总数
		Integer totalItem = (Integer) getSqlSession().selectOne(
				getMapperNamespace() + "." + countId, params);
		pageModel.setTotalRecord(totalItem);
		
		if (pageModel.getTotalPage() > 0) {
			PageHelper.startPage(pageModel.getCurrentPage(), pageModel.getPageSize());
			pageModel.setList(this.getSqlSession().selectList(
					getMapperNamespace() + "." + listId,
					params));
		}
		return pageModel;
	}
	

	public boolean update(String id, T entity) throws DataAccessException {
		boolean flag = false;
		try {
			flag = this.getSqlSession().update(getMapperNamespace() + "." + id,
					entity) > 0 ? true : false;
		} catch (DataAccessException e) {
			flag = false;
			throw e;
		}
		return flag;
	}
	
	public boolean updates(String id,Map<String,Object> param) {
		boolean flag = false;
		try {
			flag = this.getSqlSession().update(id, param) > 0 ? true : false;
		} catch (DataAccessException e) {
			flag = false;
			throw e;
		}
		return flag;
	}

	public List<T> select(String id, Object params) throws DataAccessException {
		List<T> result = new ArrayList<T>();
		try {
			result = this.getSqlSession().selectList(
					getMapperNamespace() + "." + id, params);
		} catch (DataAccessException e) {
			throw e;
		}
		return result;
	}

	public boolean updateByPrimaryKeySelective(T entity)
			throws DataAccessException {

		return update("updateByPrimaryKeySelective", entity);
	}

	public Class<T> getEntityClass() {
		return entityClass;
	}

	public void setEntityClass(Class<T> entityClass) {
		this.entityClass = entityClass;
		String pack = entityClass.getName();
//		setMapperNamespace(entityClass.getName().substring(
//				entityClass.getName().lastIndexOf(".") + 1));
		setMapperNamespace(pack.replace(".entity.", ".mapper."));
	}

	public String getMapperNamespace() {
		return mapperNamespace;
	}

	public void setMapperNamespace(String className) {
		this.mapperNamespace = className + "Mapper";
	}

	public boolean saveOrUpdate(T entity) throws DataAccessException {
		return saveOrUpdate("insertSelective", "updateByPrimaryKeySelective",
				entity);
	}

	public boolean saveOrUpdate(String insertId, String updateId, T entity)
			throws DataAccessException {
		BeanWrapper beanWrapper = new BeanWrapperImpl(entity);
		Integer id = (Integer) beanWrapper.getPropertyValue("id");
		if (id == null || id <= 0) { // 添加
			return insert(insertId, entity);
		} else {
			return update(updateId, entity);
		}
	}

	public boolean insert(String id, T entity) throws DataAccessException {
		return insertObj(id, entity);
	}

	@Deprecated
	public PageModel getPage(String listId, String countId,
			Map paramsMap) {

//		return getPage(listId,paramsMap);
		return null;

	}
	/*
	@Override
	public PageModel getPage(String listId,Map paramsMap) {

		String curPage = StringUtils.defaultIfEmpty( // 当前页数
				(String)paramsMap.get(Constants.PAGED_CURPAGE), "1");

		String numPerPage = StringUtils.defaultIfEmpty( // 每页条数
				(String)paramsMap.get(Constants.PAGED_NUM_PERPAGE), "10");

		PageModel pageModel = new PageModel(Integer.parseInt(curPage));
		pageModel.setPageSize(Integer.parseInt(numPerPage));

		return getPage(listId, paramsMap, pageModel);

	}
*/
	public boolean insertObj(String id, Object params)
			throws DataAccessException {
		boolean flag = false;
		try {
			flag = this.getSqlSession().insert(getMapperNamespace() + "." + id,
					params) > 0 ? true : false;
		} catch (DataAccessException e) {
			flag = false;
			throw e;
		}
		return flag;
	}

	public T selectEntity(String id, Object params) throws DataAccessException {
		List<T> list = select(id, params);
		if (list != null && list.size() > 0)
			return (T) list.get(0);
		return null;
	}

	public List selects(String id, Object params) throws DataAccessException {
		List result = new ArrayList();
		try {
			result = this.getSqlSession().selectList(
					getMapperNamespace() + "." + id, params);
		} catch (DataAccessException e) {
			throw e;
		}
		return result;
	}

	public boolean deletes(String id, Object object) throws DataAccessException {
		boolean flag = false;
		try {
			flag = this.getSqlSession().delete(getMapperNamespace() + "." + id,
					object) > 0 ? true : false;
		} catch (DataAccessException e) {
			flag = false;
			throw e;
		}
		return flag;
	}

	public Object getObject(String id, Object object) {
		// TODO Auto-generated method stub
		return this.getSqlSession().selectOne(getMapperNamespace() + "." + id, object);
	}
	
	public List<Map<String, Object>> selectById(String ids,Integer id){
		return this.getSqlSession().selectList(ids, id);
	}

	public T insertReturnId(String id, T entity) throws DataAccessException {
		int flag = 0;
		try {
			flag = this.getSqlSession().insert(getMapperNamespace() + "." + id,
					entity);
			return entity;
		} catch (DataAccessException e) {
			return null;
		}
	}

}
