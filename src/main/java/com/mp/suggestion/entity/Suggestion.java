package com.mp.suggestion.entity;
import java.io.Serializable;


/**
 * 
 * 
 * 
 **/
@SuppressWarnings("serial")
public class Suggestion implements Serializable {

	/****/
	private Integer id;

	/**联系人**/
	private String phone;

	/**建议内容**/
	private String description;

	/**0创建，1处理中，2处理完毕**/
	private Integer status;

	/**0：无效，1有效**/
	private Integer delFlag;

	/**处理人**/
	private String dealer;
	/**创建时间**/
	private java.util.Date createDate;


	public java.util.Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(java.util.Date createDate) {
		this.createDate = createDate;
	}

	public void setId(Integer id){
		this.id = id;
	}

	public Integer getId(){
		return this.id;
	}

	public void setPhone(String phone){
		this.phone = phone;
	}

	public String getPhone(){
		return this.phone;
	}

	public void setDescription(String description){
		this.description = description;
	}

	public String getDescription(){
		return this.description;
	}

	public void setStatus(Integer status){
		this.status = status;
	}

	public Integer getStatus(){
		return this.status;
	}

	public void setDelFlag(Integer delFlag){
		this.delFlag = delFlag;
	}

	public Integer getDelFlag(){
		return this.delFlag;
	}

	public void setDealer(String dealer){
		this.dealer = dealer;
	}

	public String getDealer(){
		return this.dealer;
	}

}
