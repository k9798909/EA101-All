package com.shoprp.model;

import java.sql.Date;

public class ShoprpVO implements java.io.Serializable{
	private String mbrno;
	private String rmno;
	private String detail;
	private Date rpdate;
	private Integer attend;
	
	public String getMbrno() {
		return mbrno;
	}
	public void setMbrno(String mbrno) {
		this.mbrno = mbrno;
	}
	public String getRmno() {
		return rmno;
	}
	public void setRmno(String rmno) {
		this.rmno = rmno;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public Date getRpdate() {
		return rpdate;
	}
	public void setRpdate(Date rpdate) {
		this.rpdate = rpdate;
	}
	public Integer getAttend() {
		return attend;
	}
	public void setAttend(Integer attend) {
		this.attend = attend;
	}
	
	
	

}
