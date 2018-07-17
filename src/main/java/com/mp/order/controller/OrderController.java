package com.mp.order.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mp.base.ResponseMsg;
import com.mp.order.service.OrderService;

/**
 * 
 * NewsControllercontroller类
 * 
 **/
@Controller
@RequestMapping("/order")
public class OrderController {
	@Autowired
	private OrderService orderService;
	@RequestMapping("/toOrder")
	public String toNews() {
		return "../../reserve";
	}
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ResponseBody
	public ResponseMsg add(@RequestBody Map<String,String> map, Model model) {
		ResponseMsg rm = new ResponseMsg();
		try {
			if (orderService.add(map)) {
				rm.setMsg("预约成功，稍后我们会短信通知!");
			} else {
				rm.setCode(400);
				rm.setMsg("预约失败，请稍后再试");
			}
		} catch (Exception e) {
			rm.setCode(400);
			rm.setMsg("预约失败");
		}
		return rm;
	}
}
