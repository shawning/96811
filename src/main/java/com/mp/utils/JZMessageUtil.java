package com.mp.utils;

import com.jianzhou.sdk.BusinessService;


public class JZMessageUtil {

	public static String signature = ResourceUtil.getValueBykey("config",
			"jzsms.signature");
	public static String account = ResourceUtil.getValueBykey("config",
			"jzsms.account");
	public static String password = ResourceUtil.getValueBykey("config",
			"jzsms.password");
	public static String wsdl = ResourceUtil
			.getValueBykey("config", "jzsms.wsdl");

	public static int sendSms(String message, String destMobile)
			throws Exception {
		int ret = 0;
		if(message==null){
			throw new Exception("消息内容为空！");
		}
		if(destMobile==null){
			throw new Exception("手机号码为空！");
		}
		try {
			BusinessService bs = new BusinessService();
			bs.setWebService(wsdl);
			message = message + "【" + signature + "】";
			ret = bs.sendBatchMessage(account, password, destMobile, message);
		} catch (Exception e) {
			// TODO: handle exception
			throw new Exception("系统错误！短信发送失败");
		}
		return ret;
	}
}
