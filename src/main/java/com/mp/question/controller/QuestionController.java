package com.mp.question.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mp.base.PageModel;
import com.mp.base.ResponseMsg;
import com.mp.question.entity.Question;
import com.mp.question.service.QuestionService;

/**
 * 
 * QuestionControllercontroller类
 * 
 **/
@Controller
@RequestMapping("/question")
public class QuestionController {

	@Autowired
	private QuestionService questionService;

	/**
	 * 
	 * 跳转页面
	 * 
	 **/
	@RequestMapping("/toQuestion")
	public String toQuestion() {
		return "../question/question";
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
			String question = request.getParameter("question");
			Map<String, Object> params = new HashMap<String, Object>();
			if(StringUtils.isNotEmpty(question)){
				question = new String(question.getBytes("ISO-8859-1"),"UTF-8")+"";
				params.put("question", question);
			}
			PageModel page = new PageModel(request.getParameter("rows")
					.isEmpty() ? 10 : Integer.parseInt(request.getParameter(
					"rows").trim()), request.getParameter("page").isEmpty() ? 1
					: Integer.parseInt(request.getParameter("page").trim()));
			page = questionService.search(params, page);
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
	public ResponseMsg add(@RequestBody Question question, Model model) {
		ResponseMsg rm = new ResponseMsg();
		try {
			if (questionService.add(question)) {
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
	public ResponseMsg update(@RequestBody Question question, Model model) {
		ResponseMsg rm = new ResponseMsg();
		try {
			if (questionService.update(question)) {
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
			if (questionService.delete(id)) {
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

}