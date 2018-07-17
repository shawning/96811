package com.mp.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mp.base.BaseDaoImpl;
import com.mp.demo.dao.TestDao;
import com.mp.demo.entity.BaseLog;

@Service
@Transactional
public class TestService{
	@Autowired
	private TestDao testDao;
	public BaseLog selectByPrId(Integer id){
		BaseLog log =  testDao.selectByPrimaryKey(id);
		return log;
	}
}
