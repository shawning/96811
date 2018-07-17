package com.mp.demo.entity;


/**
 * 
 * 包含用户登录记录，注册记录，服务访问记录等。
注册和登录包括状态：登录失败等
 * 
 **/
@SuppressWarnings("serial")
public class BaseLog  {

	/****/
	private Integer id;

	/**日志类型，注册、登录、访问设备**/
	private Integer type;

	/**用户id**/
	private Integer userId;

	/**内容**/
	private String content;

	/**操作时间**/
	private java.util.Date createDate;



	public void setId(Integer id){
		this.id = id;
	}

	public Integer getId(){
		return this.id;
	}

	public void setType(Integer type){
		this.type = type;
	}

	public Integer getType(){
		return this.type;
	}

	public void setUserId(Integer userId){
		this.userId = userId;
	}

	public Integer getUserId(){
		return this.userId;
	}

	public void setContent(String content){
		this.content = content;
	}

	public String getContent(){
		return this.content;
	}

	public void setCreateDate(java.util.Date createDate){
		this.createDate = createDate;
	}

	public java.util.Date getCreateDate(){
		return this.createDate;
	}

}
