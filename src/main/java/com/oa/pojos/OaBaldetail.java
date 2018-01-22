package com.oa.pojos;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the oa_baldetails database table.
 * 
 */
@Entity
@Table(name="oa_baldetails")
@NamedQuery(name="OaBaldetail.findAll", query="SELECT o FROM OaBaldetail o")
public class OaBaldetail implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="det_id")
	private String detId;

	@Column(name="det_caozuoid")
	private String detCaozuoid;

	private String det_caozuoName;

	@Temporal(TemporalType.DATE)
	@Column(name="det_date")
	private Date detDate;

	@Column(name="det_number")
	private int detNumber;

	@Column(name="det_reason")
	private String detReason;

	//bi-directional many-to-one association to OaBalance
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="bal_id")
	private OaBalance oaBalance;

	public OaBaldetail() {
	}

	public String getDetId() {
		return this.detId;
	}

	public void setDetId(String detId) {
		this.detId = detId;
	}

	public String getDetCaozuoid() {
		return this.detCaozuoid;
	}

	public void setDetCaozuoid(String detCaozuoid) {
		this.detCaozuoid = detCaozuoid;
	}

	public String getDet_caozuoName() {
		return this.det_caozuoName;
	}

	public void setDet_caozuoName(String det_caozuoName) {
		this.det_caozuoName = det_caozuoName;
	}

	public Date getDetDate() {
		return this.detDate;
	}

	public void setDetDate(Date detDate) {
		this.detDate = detDate;
	}

	public int getDetNumber() {
		return this.detNumber;
	}

	public void setDetNumber(int detNumber) {
		this.detNumber = detNumber;
	}

	public String getDetReason() {
		return this.detReason;
	}

	public void setDetReason(String detReason) {
		this.detReason = detReason;
	}

	public OaBalance getOaBalance() {
		return this.oaBalance;
	}

	public void setOaBalance(OaBalance oaBalance) {
		this.oaBalance = oaBalance;
	}

}