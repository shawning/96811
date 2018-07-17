package com.mp.order.service;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.mp.utils.JZMessageUtil;
import com.mp.utils.ResourceUtil;

@Service
@Transactional
public class OrderService {
	String URL = ResourceUtil.getValueBykey("config", "dzcx.neworder.url");

	public boolean add(Map<String, String> params) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		try {
			URL url = new URL(URL);
			HttpURLConnection connection = (HttpURLConnection) url
					.openConnection();
			connection.setDoOutput(true);
			connection.setDoInput(true);
			connection.setRequestMethod("POST");
			connection.setUseCaches(false);
			connection.setInstanceFollowRedirects(true);
			connection.setConnectTimeout(20000);
			connection.setReadTimeout(300000);
			connection.setRequestProperty("Accept-Charset", "utf-8");
			connection.setRequestProperty("contentType", "utf-8");
			connection.setRequestProperty("Content-Type", "application/json");
			connection.connect();

			// POST请求
			DataOutputStream out = new DataOutputStream(
					connection.getOutputStream());
			JSONObject pras = new JSONObject();
			JSONObject objHead_value = new JSONObject();
			JSONObject objBody_value = new JSONObject();
			objHead_value.put("screeny", "00001");
			objHead_value.put("cd", "00001");
			objHead_value.put("mos", "96811.com");
			objHead_value.put("ver", "00001");
			objHead_value.put("de", "2015-09-09 14:00:00");
			objHead_value.put("aid", "com.96811/web");
			objHead_value.put("phone", "10000");
			objHead_value.put("screenx", "750");
			if (params.containsKey("bookDate")
					&& StringUtils.isNotEmpty(params.get("bookDate"))) {
				objBody_value.put("bookDate", params.get("bookDate"));
			} else {
				return false;
			}
			if (params.containsKey("name")
					&& StringUtils.isNotEmpty(params.get("name"))) {
				objBody_value.put("customerName", params.get("name"));
			} else {
				objBody_value.put("customerName", "先生");
			}
			objBody_value.put("orderSource", 6);
			if (params.containsKey("phone")
					&& StringUtils.isNotEmpty(params.get("phone"))) {
				objBody_value.put("customerPhone", params.get("phone"));
			} else {
				return false;
			}
			if (params.containsKey("bakstr1")
					&& StringUtils.isNotEmpty(params.get("bakstr1"))) {
				objBody_value.put("bakstr1", params.get("bakstr1"));
			} else {
				objBody_value.put("bakstr1", "");
			}

			objBody_value.put("startGps", "121.422130,31.188257");
			objBody_value.put("endGps", "121.422130,31.188257");
			objBody_value.put("callDate", sdf.format(new Date()));
			JSONObject startPlace = new JSONObject();
			if (params.containsKey("addressFrom")
					&& StringUtils.isNotEmpty(params.get("addressFrom"))) {
				startPlace.put("consignee", params.get("name"));
				startPlace.put("phone", params.get("phone"));
				startPlace.put("gps", "121.422130,31.188257");
				startPlace.put("address", params.get("addressFrom"));
				objBody_value.put("startPlace", startPlace);
			} else {
				return false;
			}
			JSONArray array = new JSONArray();
			JSONObject endPlace = new JSONObject();
			if (params.containsKey("addressTo")
					&& StringUtils.isNotEmpty(params.get("addressTo"))) {
				endPlace.put("consignee", params.get("name"));
				endPlace.put("phone", params.get("phone"));
				endPlace.put("gps", "121.422130,31.188257");
				endPlace.put("address", params.get("addressTo"));
				array.add(endPlace);
				objBody_value.put("endPlace", array);
			} else {
				return false;
			}

			pras.put("head", objHead_value);
			pras.put("body", objBody_value);
			out.write(pras.toString().getBytes("UTF-8"));
			out.flush();
			out.close();

			// 读取响应
			BufferedReader reader = new BufferedReader(new InputStreamReader(
					connection.getInputStream(), "UTF-8"));
			String lines;
			StringBuffer sb = new StringBuffer("");
			while ((lines = reader.readLine()) != null) {
				lines = new String(lines.getBytes());
				sb.append(lines);
			}
			reader.close();
			// 断开连接
			connection.disconnect();
			if (StringUtils.isNotEmpty(sb.toString())) {
				JSONObject jsonResult = JSONObject.parseObject(sb.toString());
				if (jsonResult.get("success").equals("0")) {
					JZMessageUtil.sendSms("你已成功预约搬家订单，稍后会有96811的客服人员会联系你，请保持电话畅通，谢谢！", params.get("phone"));
					return true;
				}else{
					return false;
				}
			}else{
				return false;
			}
		} catch (Exception e) {
			return false;
		}

	}
}
