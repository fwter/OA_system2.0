package com.oa.vo.fwt;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

public class OaContractform {
	
	private String empName;
	
	private String conId;

	private String conBegindate;

	private String conEnc;

	private String conEnddate;

	private String conRemark;

	private String conSigndate;

	private String conSigntime;

	private String conState;

	private String conStopdate;

	private String conTerm;

	private String conTryend;

	private String conType;

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getConId() {
		return conId;
	}

	public void setConId(String conId) {
		this.conId = conId;
	}

	public String getConBegindate() {
		return conBegindate;
	}

	public void setConBegindate(String conBegindate) {
		this.conBegindate = conBegindate;
	}

	public String getConEnc() {
		return conEnc;
	}

	public void setConEnc(String conEnc) {
		this.conEnc = conEnc;
	}

	public String getConEnddate() {
		return conEnddate;
	}

	public void setConEnddate(String conEnddate) {
		this.conEnddate = conEnddate;
	}

	public String getConRemark() {
		return conRemark;
	}

	public void setConRemark(String conRemark) {
		this.conRemark = conRemark;
	}

	public String getConSigndate() {
		return conSigndate;
	}

	public void setConSigndate(String conSigndate) {
		this.conSigndate = conSigndate;
	}

	public String getConSigntime() {
		return conSigntime;
	}

	public void setConSigntime(String conSigntime) {
		this.conSigntime = conSigntime;
	}

	public String getConState() {
		return conState;
	}

	public void setConState(String conState) {
		this.conState = conState;
	}

	public String getConStopdate() {
		return conStopdate;
	}

	public void setConStopdate(String conStopdate) {
		this.conStopdate = conStopdate;
	}

	public String getConTerm() {
		return conTerm;
	}

	public void setConTerm(String conTerm) {
		this.conTerm = conTerm;
	}

	public String getConTryend() {
		return conTryend;
	}

	public void setConTryend(String conTryend) {
		this.conTryend = conTryend;
	}

	public String getConType() {
		return conType;
	}

	public void setConType(String conType) {
		this.conType = conType;
	} 
	
	
}
