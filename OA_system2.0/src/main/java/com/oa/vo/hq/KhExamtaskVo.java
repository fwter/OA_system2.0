package com.oa.vo.hq;
//考核任务实体
public class KhExamtaskVo {
	 private String khName;
	 private String khPertemp;
	 private String khType;
	 private String khYear;
	 private int khIssue;
	 private String khTime;
	 private String khState;
	public String getKhName() {
		return khName;
	}
	public void setKhName(String khName) {
		this.khName = khName;
	}
	public String getKhPertemp() {
		return khPertemp;
	}
	public void setKhPertemp(String khPertemp) {
		this.khPertemp = khPertemp;
	}
	public String getKhType() {
		return khType;
	}
	public void setKhType(String khType) {
		this.khType = khType;
	}
	public String getKhYear() {
		return khYear;
	}
	public void setKhYear(String khYear) {
		this.khYear = khYear;
	}
	public int getKhIssue() {
		return khIssue;
	}
	public void setKhIssue(int khIssue) {
		this.khIssue = khIssue;
	}
	public String getKhTime() {
		return khTime;
	}
	public void setKhTime(String khTime) {
		this.khTime = khTime;
	}
	public String getKhState() {
		return khState;
	}
	public void setKhState(String khState) {
		this.khState = khState;
	}
	public KhExamtaskVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public KhExamtaskVo(String khName, String khPertemp, String khType, String khYear, int khIssue, String khTime,
			String khState) {
		super();
		this.khName = khName;
		this.khPertemp = khPertemp;
		this.khType = khType;
		this.khYear = khYear;
		this.khIssue = khIssue;
		this.khTime = khTime;
		this.khState = khState;
	}
}
