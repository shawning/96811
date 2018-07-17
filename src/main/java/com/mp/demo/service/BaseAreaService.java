package com.mp.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mp.demo.dao.BaseAreaDao;
import com.mp.demo.entity.BaseArea;

@Service
@Transactional
public class BaseAreaService {
	@Autowired
	private BaseAreaDao baseAreaDao;
	public BaseArea selectByParentId(Integer id){
		BaseArea log =  baseAreaDao.selectByParentId(id);
		return log;
	}
	public BaseArea selectById(Integer id){
		BaseArea log =  baseAreaDao.selectByPrimaryKey(id);
		return log;
	}
}
