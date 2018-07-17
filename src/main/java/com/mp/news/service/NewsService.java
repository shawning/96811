package com.mp.news.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mp.base.PageModel;
import com.mp.news.dao.NewsDao;
import com.mp.news.entity.News;

/**
 * 
 * NewsServicecontroller类
 * 
 **/
@Service
@Transactional
public class NewsService {

	@Autowired
	private NewsDao newsDao;

	/**
	 * 
	 * 翻页查询
	 * 
	 **/
	public PageModel search(Map<String, Object> params, PageModel page) {
		try {
			return newsDao.getPage("selectAll", "selectAllCount", params, page);
		} catch (Exception e) {
			return null;
		}

	}

	/**
	 * 
	 * 新增
	 * 
	 **/
	public boolean add(News news) {
		try {
			return newsDao.insertSelective(news);
		} catch (Exception e) {
			return false;
		}

	}

	/**
	 * 
	 * 修改
	 * 
	 **/
	public boolean update(News news) {
		try {
			return newsDao.updateByPrimaryKeySelective(news);
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
			return newsDao.deleteByPrimaryKey(id);
		} catch (Exception e) {
			return false;
		}

	}
	
	/**
	 * 
	 * 查询明细
	 * 
	 **/
	public News selectOne(Integer id) {
		try {
			return newsDao.selectByPrimaryKey(id);
		} catch (Exception e) {
			return null;
		}

	}

}