package com.mp.demo.dao;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.mp.base.BaseDaoImpl;
import com.mp.demo.entity.BaseLog;

@Repository
public class TestDao  extends BaseDaoImpl<BaseLog>{
	public BaseLog selectByPrId(Integer id){
			BaseLog result = null;
			try {
				result = this.getSqlSession().selectOne("selectByPrimaryKey", id);
				/*result = (T) this.getSqlSession().selectOne(
						getMapperNamespace() + "." + "selectByPhone", phone);*/
			} catch (DataAccessException e) {
				throw e;
			}
			return result;
		}
}
