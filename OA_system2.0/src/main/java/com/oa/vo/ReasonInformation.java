package com.oa.vo;

public class ReasonInformation {
	private boolean success;
	private String reason;//操作失败的原因
	
	/**
	 * 成功
	 */
	public ReasonInformation() {
		success = true;
		reason = "操作成功";
	}

	/**
	 * 失败
	 * @param reason
	 */
	public ReasonInformation(String reason) {
		super();
		success = false;
		this.reason = reason;
	}

	public ReasonInformation(boolean success, String reason) {
		super();
		this.success = success;
		this.reason = reason;
	}



	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}
	

}
