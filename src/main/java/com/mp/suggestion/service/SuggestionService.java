package com.mp.suggestion.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mp.base.PageModel;
import com.mp.suggestion.dao.SuggestionDao;
import com.mp.suggestion.entity.Suggestion;

/**
 * 
 * SuggestionServicecontroller类
 * 
 **/
@Service
@Transactional
public class SuggestionService {

	@Autowired
	private SuggestionDao suggestionDao;

	/**
	 * 
	 * 翻页查询
	 * 
	 **/
	public PageModel search(Map<String, Object> params, PageModel page) {
		try {
			return suggestionDao.getPage("selectAll", "selectAllCount", params,
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

	public boolean add(Suggestion suggestion) {

		try {
			return suggestionDao.insertSelective(suggestion);
		} catch (Exception e) {
			return false;
		}

	}

	/**
	 * 
	 * 修改
	 * 
	 **/

	public boolean update(Suggestion suggestion) {
		try {
			return suggestionDao.updateByPrimaryKeySelective(suggestion);
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
			return suggestionDao.deleteByPrimaryKey(id);
		} catch (Exception e) {
			return false;
		}

	}

}