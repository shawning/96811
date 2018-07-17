package com.mp.demo.dao;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.mp.base.BaseDaoImpl;
import com.mp.demo.entity.BaseArea;

@Repository
public class BaseAreaDao extends BaseDaoImpl<BaseArea> {

	public BaseArea selectByParentId(Integer id) {
		String a = this.getEntityClass().getName();
		BaseArea result = null;
		try {
			result = this.getSqlSession().selectOne("selectByParentId", id);
		} catch (DataAccessException e) {
			throw e;
		}
		return result;
	}
	
	public BaseArea selectById(Integer id) {
//		String a = (Class<T>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
//		
//				//BaseArea.class.getGenericSuperclass().;
//		
		BaseArea result = null;
		try {
			result = this.getSqlSession().selectOne("com.mp.demo.mapper.BaseAreaMapper.selectByPrimaryKey", id);
		} catch (DataAccessException e) {
			throw e;
		}
		return result;
	}
}
