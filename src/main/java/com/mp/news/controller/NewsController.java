package com.mp.news.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mp.base.PageModel;
import com.mp.base.ResponseMsg;
import com.mp.news.entity.News;
import com.mp.news.service.NewsService;

/**
 * 
 * NewsControllercontroller类
 * 
 **/
@Controller
@RequestMapping("/news")
public class NewsController {

	@Autowired
	private NewsService newsService;

	/**
	 * 
	 * 跳转页面
	 * 
	 **/
	@RequestMapping("/toNews")
	public String toNews() {
		return "../news/news";
	}
	@RequestMapping("/newsDetail")
	public String newsDetail() {
		return "../../newsDetails";
	}

	/**
	 * 
	 * 翻页查询
	 * 
	 **/
	@RequestMapping("/search")
	@ResponseBody
	public Map<String, Object> search(HttpServletRequest request, Model model) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			Map<String, Object> params = new HashMap<String, Object>();
			PageModel page = new PageModel(request.getParameter("rows")
					.isEmpty() ? 10 : Integer.parseInt(request.getParameter(
					"rows").trim()), request.getParameter("page").isEmpty() ? 1
					: Integer.parseInt(request.getParameter("page").trim()));
			page = newsService.search(params, page);
			if (page.getList() != null && page.getList().size() > 0) {
				result.put("total", page.getTotalRecord());
			} else {
				result.put("total", 0);
			}
			result.put("rows", page.getList());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 
	 * 新增
	 * 
	 **/
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ResponseBody
	public ResponseMsg add(@RequestBody News news, Model model) {
		ResponseMsg rm = new ResponseMsg();
		try {
			news.setCreateDate(new Date());
			news.setDelFlag(1);
			if (newsService.add(news)) {
				rm.setMsg("操作成功");
			} else {
				rm.setCode(400);
				rm.setMsg("操作失败");
			}
		} catch (Exception e) {
			rm.setCode(400);
			rm.setMsg("操作异常");
		}
		return rm;
	}

	/**
	 * 
	 * 修改
	 * 
	 **/
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public ResponseMsg update(@RequestBody News news, Model model) {
		ResponseMsg rm = new ResponseMsg();
		try {
			if (newsService.update(news)) {
				rm.setMsg("操作成功");
			} else {
				rm.setCode(400);
				rm.setMsg("操作失败");
			}
		} catch (Exception e) {
			rm.setCode(400);
			rm.setMsg("操作异常");
		}
		return rm;
	}

	/**
	 * 
	 * 删除
	 * 
	 **/
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public ResponseMsg delete(@RequestBody Map<String, String> map, Model model) {
		ResponseMsg rm = new ResponseMsg();
		try {
			String idS = map.get("id");
			Integer id = Integer.parseInt(idS);
			if (newsService.delete(id)) {
				rm.setMsg("操作成功");
			} else {
				rm.setCode(400);
				rm.setMsg("操作失败");
			}
		} catch (Exception e) {
			rm.setCode(400);
			rm.setMsg("操作异常");
		}
		return rm;
	}
	/**
	 * 
	 * ID选择一条
	 * 
	 **/
	@RequestMapping(value = "/newsDetail", method = RequestMethod.POST)
	@ResponseBody
	public ResponseMsg selectOne(@RequestBody Map<String, String> map, Model model) {
		ResponseMsg rm = new ResponseMsg();
		try {
			String idS = map.get("id");
			Integer id = Integer.parseInt(idS);
			rm.setData(newsService.selectOne(id));
		} catch (Exception e) {
			rm.setCode(400);
			rm.setMsg("操作异常");
		}
		return rm;
	}
}