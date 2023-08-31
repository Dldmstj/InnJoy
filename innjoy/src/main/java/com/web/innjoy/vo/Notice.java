package com.web.innjoy.vo;

import java.util.Date;

public class Notice {
	private int not_id;
	private String adm_id;
	private String not_title;
	private String not_detail;
	private Date not_date;
	private int not_readcnt;
	
	public Notice() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Notice(int not_id, String adm_id, String not_title, String not_detail, Date not_date, int not_readcnt) {
		super();
		this.not_id = not_id;
		this.adm_id = adm_id;
		this.not_title = not_title;
		this.not_detail = not_detail;
		this.not_date = not_date;
		this.not_readcnt = not_readcnt;
	}

	public int getNot_id() {
		return not_id;
	}

	public void setNot_id(int not_id) {
		this.not_id = not_id;
	}

	public String getAdm_id() {
		return adm_id;
	}

	public void setAdm_id(String adm_id) {
		this.adm_id = adm_id;
	}

	public String getNot_title() {
		return not_title;
	}

	public void setNot_title(String not_title) {
		this.not_title = not_title;
	}

	public String getNot_detail() {
		return not_detail;
	}

	public void setNot_detail(String not_detail) {
		this.not_detail = not_detail;
	}

	public Date getNot_date() {
		return not_date;
	}

	public void setNot_date(Date not_date) {
		this.not_date = not_date;
	}

	public int getNot_readcnt() {
		return not_readcnt;
	}

	public void setNot_readcnt(int not_readcnt) {
		this.not_readcnt = not_readcnt;
	}

}
