package com.mp.utils;

import java.util.PropertyResourceBundle;
import java.util.ResourceBundle;

public  class ResourceUtil {
	public static String getValueBykey(String fileName, String key) {
		String str = null;
		if (null == key)
			return null;
		try {
			PropertyResourceBundle res = (PropertyResourceBundle) ResourceBundle.getBundle(fileName);
			// Machine Controller
			str = res.getString(key);
		} catch (Exception e) {
			// e.printStackTrace();
		}
		return str;

	}

	public static void main(String[] args) {
		String valueBykey = getValueBykey("base", "order.url");
		System.err.println(valueBykey);
	}
}
