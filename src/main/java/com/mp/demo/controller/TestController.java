package com.mp.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mp.base.ResponseMsg;
import com.mp.demo.entity.BaseArea;
import com.mp.demo.service.BaseAreaService;
import com.mp.demo.service.TestService;
@Controller
@RequestMapping("/test")
public class TestController {
	@Autowired
	private TestService testService;
	@Autowired
	private BaseAreaService baseAreaService;
	/**
	 * 跳转到页面
	 * @return
	 */
	@RequestMapping("/toIndex")
	public String toBill(){
		return "../page/index";
	}
	@RequestMapping(value = "/test")
	@ResponseBody
	public ResponseMsg test(){
		BaseArea  area = baseAreaService.selectByParentId(1);
		
		BaseArea  area1 = baseAreaService.selectById(1);
		ResponseMsg msg = new ResponseMsg();
//		msg.setData("999999");
		msg.setData(testService.selectByPrId(1733));
		return msg;
		//return testService.selectByPrId(1733);
	}
}
