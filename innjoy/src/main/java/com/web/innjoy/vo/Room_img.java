package com.web.innjoy.vo;

import java.util.Date;

public class Room_img {
	private int no;
	private int room_id;
	private String fname;
	private Date updte;
	
	public Room_img() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Room_img(int no, int room_id, String fname, Date updte) {
		this.no = no;
		this.room_id = room_id;
		this.fname = fname;
		this.updte = updte;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getRoom_id() {
		return room_id;
	}

	public void setRoom_id(int room_id) {
		this.room_id = room_id;
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
