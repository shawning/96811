package com.mp.news.entity;
import java.io.Serializable;


/**
 * 
 * 
 * 
 **/
@SuppressWarnings("serial")
public class News implements Serializable {

	/****/
	private Integer id;

	/**标题**/
	private String title;

	/**新闻详细**/
	private String body;

	/**创建人**/
	private String creater;

	/**创建时间**/
	private java.util.Date createDate;

	/**是否显示，0不显示1显示**/
	private Integer delFlag;



	public void setId(Integer id){
		this.id = id;
	}

	public Integer getId(){
		return this.id;
	}

	public void setTitle(String title){
		this.title = title;
	}

	public String getTitle(){
		return this.title;
	}

	public void setBody(String body){
		this.body = body;
	}

	public String getBody(){
		return this.body;
	}

	public void setCreater(String creater){
		this.creater = creater;
	}

	public String getCreater(){
		return this.creater;
	}

	public void setCreateDate(java.util.Date createDate){
		this.createDate = createDate;
	}

	public java.util.Date getCreateDate(){
		return this.createDate;
	}

	public void setDelFlag(Integer delFlag){
		this.delFlag = delFlag;
	}

	public Integer getDelFlag(){
		return this.delFlag;
	}

}
