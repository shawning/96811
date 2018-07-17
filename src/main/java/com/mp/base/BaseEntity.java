package com.mp.base;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
/**
 * 
 * @author xiaoning
 * entity父类
 */
@SuppressWarnings("serial")
public class BaseEntity implements Serializable{

	public String toString(){
		return ToStringBuilder.reflectionToString(this,
						ToStringStyle.SHORT_PREFIX_STYLE);
	}
}
