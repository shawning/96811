package com.mp.news.dao;

import com.mp.news.entity.News;
import javax.annotation.Resource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import com.mp.base.BaseDaoImpl;



/**
 * 
 * NewsDaodao类
 * 
 **/
@Repository
public class NewsDao extends BaseDaoImpl<News>{

}