package com.web.innjoy.vo;

import java.util.Date;

public class Pro_img {
	private int no;
	private int pro_id;
	private String fname;
	private Date updte;
	
	public Pro_img() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Pro_img(int no, int pro_id, String fname, Date updte) {
		super();
		this.no = no;
		this.pro_id = pro_id;
		this.fname = fname;
		this.updte = updte;
	}
	public Pro_img( int pro_id, String fname) {
		this.pro_id = pro_id;
		this.fname = fname;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getPro_id() {
		return pro_id;
	}
	public void setPro_id(int pro_id) {
		this.pro_id = pro_id;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public Date getUpdte() {
		return updte;
	}
	public void setUpdte(Date updte) {
		this.updte = updte;
	}

}
