package com.authority.model;

import java.io.Serializable;

public class AuthorityVO implements Serializable{
	
	private String empno;
	private String ftno;
	
	public AuthorityVO() {
		
	}
	
	public AuthorityVO(String empno, String ftno) {
		this.empno = empno;
		this.ftno = ftno;
	}
	
	public String getEmpno() {
		return empno;
	}
	public void setEmpno(String empno) {
		this.empno = empno;
	}
	public String getFtno() {
		return ftno;
	}
	public void setFtno(String ftno) {
		this.ftno = ftno;
	}
	

}
