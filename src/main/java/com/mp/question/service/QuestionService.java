package com.mp.question.service;

import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mp.base.PageModel;
import com.mp.question.dao.QuestionDao;
import com.mp.question.entity.Question;

/**
 * 
 * QuestionServicecontroller类
 * 
 **/
@Service
@Transactional
public class QuestionService {

	@Autowired
	private QuestionDao questionDao;

	/**
	 * 
	 * 翻页查询
	 * 
	 **/
	public PageModel search(Map<String, Object> params, PageModel page) {
		try {
			return questionDao.getPage("selectAll", "selectAllCount", params,
					page);
		} catch (Exception e) {
			return null;
		}

	}

	/**
	 * 
	 * 新增
	 * 
	 **/

	public boolean add(Question question) {

		try {
			question.setCreateDate(new Date());
			question.setDelFlag(1);
			return questionDao.insertSelective(question);
		} catch (Exception e) {
			return false;
		}

	}

	/**
	 * 
	 * 修改
	 * 
	 **/

	public boolean update(Question question) {
		try {
			question.setUpdateDate(new Date());
			return questionDao.updateByPrimaryKeySelective(question);
		} catch (Exception e) {
			return false;
		}

	}

	/**
	 * 
	 * 删除
	 * 
	 **/

	public boolean delete(Integer id) {
		try {
			return questionDao.deleteByPrimaryKey(id);
		} catch (Exception e) {
			return false;
		}

	}

}