package com.mp.conpons.controller;

import com.alibaba.fastjson.JSONObject;
import com.mp.base.ResponseMsg;
import com.mp.conpons.service.ConponsService;
import com.mp.order.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

/**
 * 
 * NewsControllercontroller类
 * 
 **/
@Controller
@RequestMapping("/conpons")
public class ConponsController {
	@Autowired
	private ConponsService conponsService;

	@RequestMapping(value = "/getConpons", method = RequestMethod.POST)
	@ResponseBody
	public ResponseMsg getConpons(@RequestBody Map<String,String> map, Model model) {
		ResponseMsg rm = new ResponseMsg();
		try {
			rm.setData(conponsService.getLastestConpons());
		} catch (Exception e) {
			rm.setCode(400);
			rm.setMsg("活动已结束");
		}
		return rm;
	}

	@RequestMapping(value = "/grab")
	@ResponseBody
	public ResponseMsg grab(@RequestBody Map<String, Object> allRequestParams) {
		ResponseMsg rm = new ResponseMsg();
		try {
			JSONObject json = conponsService.grap(allRequestParams);
			rm.setData(json);
		}catch (Exception e){
			e.printStackTrace();
			rm.setCode(400);
		}
		return rm;
	}
}
