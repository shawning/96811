package com.mp.ticket.entity;
import java.io.Serializable;


/**
 * 
 * 订单开票
 * 
 **/
@SuppressWarnings("serial")
public class MovefieldTicketInvoice  implements Serializable {

	/**ID**/
	private Integer id;

	/**取票码**/
	private String sno;

	/**含税金额**/
	private Double taxAmount;

	/**开票类型（0 为普通 1 位增值）**/
	private Integer invoiceType;

	/**发票编号**/
	private String invoiceNumber;
	
	/**发票公司**/
	private String invoiceCompany;

	/**纳税人识别号**/
	private String taxpayerIdentityNumber;

	/**地址电话**/
	private String addressPhone;
	/**
	 * 电话
	 */
	private String invoicePhone;
	/**寄票地址**/
	private String invoiceAddress;
	/**开户行**/
	private String bank;
	/**银行及开户账号**/
	private String bankBanknumber;

	/**发票状态(发票状态(0开票中 1已出票))**/
	private Integer status;
	/**开票订单号**/
	private String orderIds;
	/**开票票号**/
	private String invoiceIds;
	/**备注**/
	private String description;

	/**0逻辑删除，1有效**/
	private Integer delFlag;

	/**创建人**/
	private String creater;

	/**创建时间**/
	private java.util.Date createTime;

	/**更新人**/
	private String updater;

	/**更新时间**/
	private java.util.Date updateTime;

	/**备用字段1**/
	private String bakstr1;

	/**备用字段2**/
	private String bakstr2;

	/**备用字段3**/
	private String bakstr3;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getSno() {
		return sno;
	}

	public void setSno(String sno) {
		this.sno = sno;
	}

	public Double getTaxAmount() {
		return taxAmount;
	}

	public void setTaxAmount(Double taxAmount) {
		this.taxAmount = taxAmount;
	}

	public Integer getInvoiceType() {
		return invoiceType;
	}

	public void setInvoiceType(Integer invoiceType) {
		this.invoiceType = invoiceType;
	}

	public String getInvoiceNumber() {
		return invoiceNumber;
	}

	public void setInvoiceNumber(String invoiceNumber) {
		this.invoiceNumber = invoiceNumber;
	}

	public String getInvoiceCompany() {
		return invoiceCompany;
	}

	public void setInvoiceCompany(String invoiceCompany) {
		this.invoiceCompany = invoiceCompany;
	}

	public String getTaxpayerIdentityNumber() {
		return taxpayerIdentityNumber;
	}

	public void setTaxpayerIdentityNumber(String taxpayerIdentityNumber) {
		this.taxpayerIdentityNumber = taxpayerIdentityNumber;
	}

	public String getAddressPhone() {
		return addressPhone;
	}

	public void setAddressPhone(String addressPhone) {
		this.addressPhone = addressPhone;
	}

	public String getInvoicePhone() {
		return invoicePhone;
	}

	public void setInvoicePhone(String invoicePhone) {
		this.invoicePhone = invoicePhone;
	}

	public String getInvoiceAddress() {
		return invoiceAddress;
	}

	public void setInvoiceAddress(String invoiceAddress) {
		this.invoiceAddress = invoiceAddress;
	}

	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	public String getBankBanknumber() {
		return bankBanknumber;
	}

	public void setBankBanknumber(String bankBanknumber) {
		this.bankBanknumber = bankBanknumber;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getOrderIds() {
		return orderIds;
	}

	public void setOrderIds(String orderIds) {
		this.orderIds = orderIds;
	}

	public String getInvoiceIds() {
		return invoiceIds;
	}

	public void setInvoiceIds(String invoiceIds) {
		this.invoiceIds = invoiceIds;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getDelFlag() {
		return delFlag;
	}

	public void setDelFlag(Integer delFlag) {
		this.delFlag = delFlag;
	}

	public String getCreater() {
		return creater;
	}

	public void setCreater(String creater) {
		this.creater = creater;
	}

	public java.util.Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(java.util.Date createTime) {
		this.createTime = createTime;
	}

	public String getUpdater() {
		return updater;
	}

	public void setUpdater(String updater) {
		this.updater = updater;
	}

	public java.util.Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(java.util.Date updateTime) {
		this.updateTime = updateTime;
	}

	public String getBakstr1() {
		return bakstr1;
	}

	public void setBakstr1(String bakstr1) {
		this.bakstr1 = bakstr1;
	}

	public String getBakstr2() {
		return bakstr2;
	}

	public void setBakstr2(String bakstr2) {
		this.bakstr2 = bakstr2;
	}

	public String getBakstr3() {
		return bakstr3;
	}

	public void setBakstr3(String bakstr3) {
		this.bakstr3 = bakstr3;
	}
	
	

	
}
