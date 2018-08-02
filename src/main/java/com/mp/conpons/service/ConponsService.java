package com.mp.conpons.service;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.mp.utils.JZMessageUtil;
import com.mp.utils.ResourceUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

@Service
@Transactional
public class ConponsService {
	String URL = ResourceUtil.getValueBykey("config", "coupons.getLatestCoupons");
	String GRAP_URL = ResourceUtil.getValueBykey("config","coupons.grap");

	public JSONObject getLastestConpons() {
		JSONObject json = new JSONObject();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
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
					json.put("id", jsonResult.get("id"));//券ID
					json.put("type", jsonResult.get("type"));//类型
					json.put("valiableMoney", jsonResult.get("valiableMoney"));//金额
					json.put("isValiable", jsonResult.get("isValiable"));//0有效，1已使用，2已过期
					json.put("name", jsonResult.get("name"));//券名称
					json.put("description", jsonResult.get("description"));//描述
					json.put("rule", jsonResult.get("rule"));//规则
					json.put("startDate", sf.format(new Date(Long.valueOf(jsonResult.get("startDate").toString()))));//有效开始时间
					json.put("endDate", sf.format(new Date(Long.valueOf(jsonResult.get("endDate").toString()))));//有效截至时间
					int num = jsonResult.getInteger("valiableNum");//可用数量
					json.put("num", num);//规则
					Date now = new Date();
					if(now.getTime()>=(new Date(Long.valueOf(jsonResult.get("endDate").toString())).getTime())){
						json.put("overdue", -1);//过期
					}else{
						json.put("overdue", 1);//有效
					}
				}else{

				}
			}else{
			}
		} catch (Exception e) {
		}
		return json;
	}
	public JSONObject grap(Map<String, Object> map){
		JSONObject json = new JSONObject();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			URL url = new URL(GRAP_URL);
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


			pras.put("head", objHead_value);
			objBody_value.put("couponsId",map.get("couponsId"));
			objBody_value.put("customerPhone",map.get("customerPhone"));
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
				json = JSONObject.parseObject(sb.toString());

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return json;
	}
}
