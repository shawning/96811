package com.mp.question.entity;
import java.io.Serializable;


/**
 * 
 * 
 * 
 **/
@SuppressWarnings("serial")
public class Question implements Serializable {

	/****/
	private Integer id;

	/**0:车主，1货主**/
	private Integer type;

	/**问题**/
	private String question;

	/**答案**/
	private String answer;

	/**1:有效，0无效**/
	private Integer delFlag;

	/****/
	private java.util.Date createDate;

	/****/
	private java.util.Date updateDate;



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

	public void setQuestion(String question){
		this.question = question;
	}

	public String getQuestion(){
		return this.question;
	}

	public void setAnswer(String answer){
		this.answer = answer;
	}

	public String getAnswer(){
		return this.answer;
	}

	public void setDelFlag(Integer delFlag){
		this.delFlag = delFlag;
	}

	public Integer getDelFlag(){
		return this.delFlag;
	}

	public void setCreateDate(java.util.Date createDate){
		this.createDate = createDate;
	}

	public java.util.Date getCreateDate(){
		return this.createDate;
	}

	public void setUpdateDate(java.util.Date updateDate){
		this.updateDate = updateDate;
	}

	public java.util.Date getUpdateDate(){
		return this.updateDate;
	}

}
