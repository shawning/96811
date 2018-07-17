package com.mp.demo.entity;

/**
 * 区域信息
 * @author yuzl
 *
 */
@SuppressWarnings("serial")
public class BaseArea {

	private int id;
	
	private String area;
	
	private int parentId;
	
	private int delflag;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public int getParentId() {
		return parentId;
	}

	public void setParentId(int parentId) {
		this.parentId = parentId;
	}

	public int getDelflag() {
		return delflag;
	}

	public void setDelflag(int delflag) {
		this.delflag = delflag;
	}
}
