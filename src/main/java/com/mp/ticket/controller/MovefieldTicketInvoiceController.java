package com.mp.ticket.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mp.base.ResponseMsg;
import com.mp.ticket.service.MovefieldTicketInvoiceService;

/**
 * 
 * MovefieldTicketInvoiceController类
 * 
 **/
@Controller
@RequestMapping("/ticket")
public class MovefieldTicketInvoiceController {

	@Autowired
	private MovefieldTicketInvoiceService movefieldTicketInvoiceService;

	/**
	 * 
	 * SNO选择一条
	 * 
	 **/
	@RequestMapping(value = "/get", method = RequestMethod.POST)
	@ResponseBody
	public ResponseMsg get(@RequestBody Map<String, String> map, Model model) {
		ResponseMsg rm = new ResponseMsg();
		try {
			String sno = map.get("sno").trim();
			rm.setData(movefieldTicketInvoiceService.selectOne(sno));
		} catch (Exception e) {
			rm.setCode(400);
			rm.setMsg("操作异常");
		}
		return rm;
	}
}